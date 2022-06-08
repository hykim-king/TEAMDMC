package com.pcwk.ehr;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class UserDaoImpl implements UserDao {
	
	final Logger LOG = LogManager.getLogger(this.getClass());	
	
	private DataSource dataSource;
		
	private JdbcTemplate jdbcTemplate;
	
	// RowMapper객체 생성
	RowMapper<UserVO> rowMapper = new RowMapper<UserVO>() {
		@Override
		public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserVO user = new UserVO();
			
			user.setuId(rs.getString("u_id"));
			user.setName(rs.getString("name"));
			user.setPasswd(rs.getString("passwd"));
			
			// 1-> BASIC.
			user.setLevel(Level.valueOf(rs.getInt("u_level")));
			user.setLogin(rs.getInt("login"));
			user.setRecommend(rs.getInt("recommend"));
			user.setEmail(rs.getString("email"));
			return user;
		}
	};
	
	public UserDaoImpl() {}

	//	setter를 통한 의존 관계 주입(DI)
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<UserVO> doRetrieve(DTO dto) throws SQLException {
		StringBuilder sb = new StringBuilder(200);
		
		
		return null;
	}

	@Override
	public int doDelete(UserVO inVO) throws SQLException {
		StringBuilder sb = new StringBuilder(100);
		sb.append("DELETE FROM hr_member WHERE u_id = ?\n");
		LOG.debug("================================");
		LOG.debug("sql:\n"+sb.toString());
		LOG.debug("param: "+inVO.toString());
		
		Object[] args = {inVO.getuId()};
		
		LOG.debug("args: "+args[0].toString());
		
		int flag = jdbcTemplate.update(sb.toString(), args);
		
		LOG.debug("flag: "+flag);
		LOG.debug("================================");	
		
		return flag;
	}

	@Override
	public int doUpdate(UserVO inVO) throws SQLException {
		StringBuilder sb = new StringBuilder(200);
		sb.append("UPDATE hr_member         \n");
		sb.append("SET name = ?,            \n");
		sb.append("    passwd = ?,          \n");
		sb.append("    u_level = ?,         \n");
		sb.append("    login = ?,           \n");
		sb.append("    recommend = ?,       \n");
		sb.append("    email = ?,           \n");
		sb.append("    reg_dt = SYSDATE		\n");
		sb.append("WHERE u_id = ?           \n");
		LOG.debug("================================");
		LOG.debug("sql:\n"+sb.toString());
		LOG.debug("param: "+inVO.toString());
		
		Object[] args = {inVO.getName(), inVO.getPasswd(), inVO.getLevel().getValue(), inVO.getLogin() ,inVO.getRecommend(), inVO.getEmail(), inVO.getuId()};
		
		for(Object obj : args) LOG.debug("args: "+obj.toString());
		
		int flag = jdbcTemplate.update(sb.toString(), args);
		LOG.debug("flag: "+flag);
		LOG.debug("================================");	
		
		return flag;
	}

	@Override
	public List<UserVO> getAll(UserVO inVO){
		List<UserVO> list = null;
		
		StringBuilder sb = new StringBuilder(200);
		sb.append("SELECT             							            \n");
		sb.append("    u_id,         									    \n");
		sb.append("    name,         									    \n");
		sb.append("    passwd,        									    \n");
		sb.append("    u_level,       									    \n");
		sb.append("    login,         										\n");
		sb.append("    recommend,       									\n");
		sb.append("    email,           						  		    \n");
		sb.append("    TO_CHAR(reg_dt, 'yyyy-mm-dd hh24:mi:ss') AS reg_dt   \n");
		sb.append("FROM hr_member     										\n");
		sb.append("WHERE u_id LIKE ? || '%'                                 \n");
		sb.append("ORDER BY u_id											\n");
		LOG.debug("================================");
		LOG.debug("sql:\n"+sb.toString());
		LOG.debug("param: "+inVO.toString());
		LOG.debug("================================");	
		
		Object[] args = {inVO.getuId()};
		
		list = jdbcTemplate.query(sb.toString(), rowMapper, args);
		
		for(UserVO vo : list) LOG.debug("vo: "+vo.toString());
		
		return list;
	}
	
	@Override
	public int getCount(final UserVO inVO) throws SQLException{
		int count = 0;
		/*
		 * java와 oracle 연동 순서 
		 * 1. db연결 ==> OOP를 이용하여 개발자가 구현하지 않도록 처리
		 * 2. sql Statement(X, 보안 문제), PreparedStatement 
		 * 3. PreparedStatement 수행 
		 * 4. SQL 실행
		 * 5. ResultSet으로 정보를 받아와 처리 
		 * 6. 자원 반납 ==> OOP를 이용하여 개발자가 구현하지 않도록 처리
		 */
		
		// [2] sql 쿼리 작성
		StringBuilder sb = new StringBuilder(200);
		
		sb.append("SELECT COUNT(*) cnt FROM hr_member WHERE u_id LIKE ? || '%' \n");
		LOG.debug("================================");
		LOG.debug("param: "+inVO.toString());
		LOG.debug("sql:\n"+sb.toString());
		
		Object[] args = {inVO.getuId()};
		
		LOG.debug("Object param args: "+args[0].toString());
		LOG.debug("================================");	
		
		count = jdbcTemplate.queryForObject(sb.toString(), args,Integer.class);
		LOG.debug("=======================================");
		LOG.debug("count= "+count);
		LOG.debug("=======================================");
		
		return count;
	}
		
	/**
	 * 사용자 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	@Override
	public int doInsert(final UserVO inVO) throws SQLException{
		// [2] sql 작성
		StringBuilder sb = new StringBuilder(200);
		sb.append("INSERT INTO hr_member (	\n");
		sb.append("    u_id,                \n");
		sb.append("    name,                \n");
		sb.append("    passwd,              \n");
		sb.append("    u_level,             \n");
		sb.append("    login,               \n");
		sb.append("    recommend,           \n");
		sb.append("    email,               \n");
		sb.append("    reg_dt               \n");
		sb.append(") VALUES (               \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    ?,                   \n");
		sb.append("    SYSDATE              \n");
		sb.append(")                        \n");
		LOG.debug("================================");
		LOG.debug("param: "+inVO.toString());
		LOG.debug("sql:\n"+sb.toString());
		
		
		Object[] args = {inVO.getuId(), inVO.getName(), inVO.getPasswd(),
				inVO.getLevel().getValue(), inVO.getLogin(), inVO.getRecommend(), inVO.getEmail()}; // 오브젝트 배열 생성
		
		for(Object obj : args) LOG.debug("args: "+obj.toString());
		
		int flag = jdbcTemplate.update(sb.toString(), args);
		
		LOG.debug("flag: "+flag);
		LOG.debug("================================");
		
		return flag;
	}
	
	@Override
	public void deleteAll() throws SQLException{
		// [2] sql 쿼리 작성
		StringBuilder sb = new StringBuilder(100);
		
		sb.append("DELETE FROM hr_member \n");		
		LOG.debug("================================");
		LOG.debug("sql:\n"+sb.toString());
		LOG.debug("================================");
		// [3] 쿼리 실행
		//     [3-1] JdbcTemplate의 update메소드는 int값을 반환한다. => 트랜잭션이 필요한 경우 사용(CUD)
		jdbcTemplate.update(sb.toString());
	}
	
	/**
	 * 회원 단건 조회
	 * @param inVO
	 * @return UserVO
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	@Override
	public UserVO doSelectOne(final UserVO inVO) throws SQLException {
		UserVO outVO = null;
		/*
		 * java와 oracle 연동 순서 
		 * 1. db연결  ==> OOP를 이용하여 개발자가 구현하지 않도록 처리
		 * 2. sql Statement(X, 보안 문제), PreparedStatement 
		 * 3. PreparedStatement 수행 
		 * 4. SQL 실행
		 * 5. ResultSet으로 정보를 받아와 처리 
		 * 6. 자원 반납 ==> OOP를 이용하여 개발자가 구현하지 않도록 처리
		 */
		
		// [2] SQL 작성
		StringBuilder sb = new StringBuilder(200);
		sb.append("SELECT             							            \n");
		sb.append("    u_id,         									    \n");
		sb.append("    name,         									    \n");
		sb.append("    passwd,        									    \n");
		sb.append("    u_level,       									    \n");
		sb.append("    login,         										\n");
		sb.append("    recommend,       									\n");
		sb.append("    email,           						  		    \n");
		sb.append("    TO_CHAR(reg_dt, 'yyyy-mm-dd hh24:mi:ss') AS reg_dt   \n");
		sb.append("FROM hr_member     										\n");
		sb.append("WHERE u_id = ?    										\n");
		LOG.debug("================================");
		LOG.debug("param: "+inVO.toString());
		LOG.debug("sql:\n"+sb.toString());
		LOG.debug("================================");
		
		Object[] args = {inVO.getuId()};
		LOG.debug("Object param args: "+args[0].toString());
		
		outVO = jdbcTemplate.queryForObject(sb.toString(), args, rowMapper);
		
		if(outVO == null) throw new NullPointerException();
		
		LOG.debug("================================");
		LOG.debug("outVO: "+outVO.toString());
		LOG.debug("================================");
		
		return outVO;
	}
}