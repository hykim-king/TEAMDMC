package com.teamdmc.kemie.dao;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.cmn.DTO;
import com.teamdmc.kemie.usernews.domain.UserNewsVO;

public interface UserNewsDao {
	
	/**
	 * 비밀번호 check
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int loginCheck(UserNewsVO inVO) throws SQLException;
	
	/**
	 * id중복 check
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int idCheck(UserNewsVO inVO) throws SQLException;

	/**
	 * 목록 조회
	 * @param dto
	 * @return List<UserNewsVO>
	 * @throws SQLException
	 */
	public List<UserNewsVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 사용자 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(UserNewsVO inVO) throws SQLException;
	
	/**
	 * 사용자 수정 가능
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doUpdate(UserNewsVO inVO) throws SQLException;
	
	/**
	 * 사용자 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int doInsert(UserNewsVO inVO) throws SQLException;

	/**
	 * 모든 데이터 삭제
	 * @throws SQLException
	 */
	public void deleteAll() throws SQLException;

	/**
	 * 조회 건수 출력
	 * @param inVO
	 * @return int
	 * @throws SQLException
	 */
	public int getCount(UserNewsVO inVO) throws SQLException;
	
	/**
	 * 회원 다건 조회
	 * @return
	 */
	public List<UserNewsVO> getAll(UserNewsVO inVO);
	
	/**
	 * 회원 단건 조회
	 * @param inVO
	 * @return UserNewsVO
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public UserNewsVO doSelectOne(UserNewsVO inVO) throws SQLException;

}
