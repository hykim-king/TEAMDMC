package com.pcwk.ehr;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
	
	
	/**
	 * 목록 조회
	 * @param dto
	 * @return List<UserVO>
	 * @throws SQLException
	 */
	List<UserVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 사용자 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	int doDelete(UserVO inVO) throws SQLException;
	
	/**
	 * 사용자 수정 가능
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	int doUpdate(UserVO inVO) throws SQLException;
	
	/**
	 * 사용자 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	int doInsert(UserVO inVO) throws SQLException;

	/**
	 * 모든 데이터 삭제
	 * @throws SQLException
	 */
	void deleteAll() throws SQLException;

	/**
	 * 조회 건수 출력
	 * @param inVO
	 * @return int
	 * @throws SQLException
	 */
	int getCount(UserVO inVO) throws SQLException;
	
	/**
	 * 회원 다건 조회
	 * @return
	 */
	List<UserVO> getAll(UserVO inVO);
	
	/**
	 * 회원 단건 조회
	 * @param inVO
	 * @return UserVO
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	UserVO doSelectOne(UserVO inVO) throws SQLException;

}