/**
* <pre>
* com.teamdmc.kemie.userinterested
* Class Name : UserinterestedService.java
* Description:
* Author: Choi Jong Hee
* Since: 2022/07/05
* Version 0.1
* Copyright (c) by H.R.KIM All right reserved.
* Modification Information
* 수정일   수정자    수정내용
*-----------------------------------------------------
*2022/07/05 최초생성
*-----------------------------------------------------
* </pre>
*/
package com.teamdmc.kemie.userinterested;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

/**
 * @author Choi Jong Hee
 *
 */
public interface UserinterestedService {
	
	/**
	 * 회원 다건 조회
	 * @return
	 */
	public List<UserInterestedVO> getAll(UserInterestedVO inVO);
	
	/**
	 * 게시물 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(UserInterestedVO inVO) throws SQLException;
	
	/**
	 * 게시물 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int doInsert(UserInterestedVO inVO) throws SQLException;

}
