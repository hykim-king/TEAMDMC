package com.teamdmc.kemie.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamdmc.kemie.cmn.DTO;
import com.teamdmc.kemie.cmn.SearchVO;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

@Repository("userInterestedCoinDao")
public class UserInterestedCoinDaoImpl implements UserInterestedCoinDao {
	
	final Logger LOG = LogManager.getLogger(this.getClass());
	final String NAMESPACE = "com.teamdmc.kemie.userInterestedCoin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public UserInterestedCoinDaoImpl() {}

	@Override
	public int loginCheck(UserInterestedVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int idCheck(UserInterestedVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public List<UserInterestedVO> doRetrieve(DTO dto) throws SQLException {
		SearchVO  inVO = (SearchVO)dto;
		String statement = NAMESPACE+".doRetrieve";
		LOG.debug("==============================");
		LOG.debug("param:" + dto.toString());
		LOG.debug("statement:" +statement);
		LOG.debug("==============================");		
		List<UserInterestedVO> list = sqlSessionTemplate.selectList(statement,inVO);
		
		for(UserInterestedVO vo  :list) {
			LOG.debug(vo);
		}
		return list;
	}

	@Override
	public int doDelete(UserInterestedVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = this.NAMESPACE+".doDelete";		
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" +statement);
		LOG.debug("==============================");	
				
		flag = this.sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public int doUpdate(UserInterestedVO inVO) throws SQLException {
		int flag = 0;
        String statement =NAMESPACE+".doUpdate";	
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
	
		flag = sqlSessionTemplate.update(statement, inVO);
		
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public int doInsert(UserInterestedVO inVO) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE+".doInsert";
		
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
		
		flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public void deleteAll() throws SQLException {
		String statement = NAMESPACE+".deleteAll";
		
		LOG.debug("==============================");
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		sqlSessionTemplate.delete(statement);

	}

	@Override
	public int getCount(UserInterestedVO inVO) throws SQLException {
		int count = 0;

		String statement = this.NAMESPACE+".getCount";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		count =this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("==============================");
		LOG.debug("count=" + count);
		LOG.debug("==============================");			
	
		return count;
	}

	@Override
	public List<UserInterestedVO> getAll(UserInterestedVO inVO) {
		List<UserInterestedVO> list= null;
	    String statement = NAMESPACE+".getAll";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");	
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		//list = jdbcTemplate.query(sb.toString(),rowMapper,args);
		
		for(UserInterestedVO vo  :list) {
			LOG.debug("vo:"+vo.toString());
		}
		
		return list;
	}

	@Override
	public UserInterestedVO doSelectOne(UserInterestedVO inVO) throws SQLException {
		UserInterestedVO outVO = null;
		
		String statement = this.NAMESPACE +".doSelectOne";
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		outVO = this.sqlSessionTemplate.selectOne(statement, inVO);		
		LOG.debug("==============================");
		LOG.debug("**outVO=" + outVO.toString());
		LOG.debug("==============================");

		return outVO;
	}
}
