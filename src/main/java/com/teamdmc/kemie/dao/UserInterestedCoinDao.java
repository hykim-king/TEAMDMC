package com.teamdmc.kemie.dao;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.cmn.DTO;
import com.teamdmc.kemie.user.domain.UserVO;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

public interface UserInterestedCoinDao {
	
	/**
	 * 비밀번호 check
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int loginCheck(UserInterestedVO inVO) throws SQLException;
	
	/**
	 * id중복 check
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int idCheck(UserInterestedVO inVO) throws SQLException;

	/**
	 * 목록 조회
	 * @param dto
	 * @return List<UserVO>
	 * @throws SQLException
	 */
	public List<UserInterestedVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 사용자 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(UserInterestedVO inVO) throws SQLException;
	
	/**
	 * 사용자 수정 가능
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doUpdate(UserInterestedVO inVO) throws SQLException;
	
	/**
	 * 사용자 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int doInsert(UserInterestedVO inVO) throws SQLException;

	/**
	 * 모든 데이터 삭제
	 * @throws SQLException
	 */
	public void deleteAll() throws SQLException;

	/**
	 * 조회 건수 출력
	 * @param user01
	 * @return int
	 * @throws SQLException
	 */
	public int getCount(UserInterestedVO user01) throws SQLException;
	
	/**
	 * 회원 다건 조회
	 * @return
	 */
	public List<UserInterestedVO> getAll(UserInterestedVO inVO);
	
	/**
	 * 회원 단건 조회
	 * @param inVO
	 * @return UserVO
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public UserInterestedVO doSelectOne(UserInterestedVO inVO) throws SQLException;

}
