package com.teamdmc.kemie.boardComment.dao;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.boardComment.domain.BoardCommentVO;
import com.teamdmc.kemie.cmn.DTO;

public interface BoardCommentDao {

	/**
	 * 목록 조회
	 * @param dto
	 * @return List<UserVO>
	 * @throws SQLException
	 */
	public List<BoardCommentVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 댓글 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(BoardCommentVO inVO) throws SQLException;
	
	/**
	 * 댓글 수정 가능
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doUpdate(BoardCommentVO inVO) throws SQLException;
	
	/**
	 * 댓글 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int doInsert(BoardCommentVO inVO) throws SQLException;

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
	public int getCount(BoardCommentVO inVO) throws SQLException;
	
	/**
	 * 다건 조회
	 * @return
	 */
	public List<BoardCommentVO> getAll(BoardCommentDao inVO);
	
	/**
	 * 단건 조회
	 * @param inVO
	 * @return boardCommentDao
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	BoardCommentVO doSelectOne(BoardCommentVO inVO) throws SQLException;
	
	/**
	 * 목록조회
	 * @param dto
	 * @return List<UserVO>
	 * @throws SQLException
	 */

	List<BoardCommentVO> getAll(BoardCommentVO inVO);



}