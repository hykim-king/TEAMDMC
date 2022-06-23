/**
* <pre>
* com.teamdmc.kemie.usernews.service
* Class Name : UserNewsService.java
* Description:
* Author: Choi Jong Hee
* Since: 2022/06/23
* Version 0.1
* Copyright (c) by H.R.KIM All right reserved.
* Modification Information
* 수정일   수정자    수정내용
*-----------------------------------------------------
*2022/06/23 최초생성
*-----------------------------------------------------
* </pre>
*/
package com.teamdmc.kemie.usernews.service;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.cmn.DTO;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.usernews.domain.UserNewsVO;

/**
 * @author Choi Jong Hee
 *
 */
public interface UserNewsService {
	/**
	 * 로그인 시 아이디랑 비번 체크~!
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public MessageVO idPassCheck(UserNewsVO inVO) throws SQLException;

	/**
	 * 비번 확인 체크
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int passCheck(UserNewsVO inVO) throws SQLException;

	/**
	 * id 중복 체크
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int idCheck(UserNewsVO inVO) throws SQLException;

	/**
	 * 회원목록 조회
	 * 
	 * @param dto
	 * @return List<UserNewsVO>
	 * @throws SQLException
	 */
	public List<UserNewsVO> doRetrieve(DTO dto) throws SQLException;

	/**
	 * 회원정보 삭제
	 * 
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(UserNewsVO inVO) throws SQLException;

	/**
	 * 회원정보 단건조회
	 * 
	 * @param inVO
	 * @return UserNewsVO
	 * @throws SQLException
	 */
	public UserNewsVO doSelectOne(UserNewsVO inVO) throws SQLException;

	/**
	 * 회원정보 추가
	 * 
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	public int doInsert(final UserNewsVO inVO) throws SQLException;

	/**
	 * 회원정보 수정
	 * 
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	public int doUpdate(UserNewsVO inVO) throws SQLException;

	/**
	 * 등급 업 기능
	 * 
	 * @throws SQLException
	 */
	public void upgradeLevels(UserNewsVO inVO) throws SQLException;

	/**
	 * 최초 가입자는 기본적으로 BASIC 레벨이어야 함
	 * 
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	public int add(UserNewsVO inVO) throws SQLException;
}