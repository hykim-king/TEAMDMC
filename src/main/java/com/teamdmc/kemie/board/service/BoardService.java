package com.teamdmc.kemie.board.service;

import java.sql.SQLException;
import java.util.List;

import com.teamdmc.kemie.board.domain.BoardVO;
import com.teamdmc.kemie.cmn.DTO;

public interface BoardService {
	
	/**
	 * 목록 조회
	 * @param dto
	 * @return List<boardVO>
	 * @throws SQLException
	 */
	public List<BoardVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 게시물 삭제
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doDelete(BoardVO inVO) throws SQLException;
	
	/**
	 * 게시물 수정
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws SQLException
	 */
	public int doUpdate(BoardVO inVO) throws SQLException;
	
	/**
	 * 게시물 등록
	 * @param inVO
	 * @return 1(성공)/ 0(실패)
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int doInsert(BoardVO inVO) throws SQLException;

	
	/**
	 * 게시물 단건 조회
	 * @param inVO
	 * @return UserVO
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public BoardVO doSelectOne(BoardVO inVO) throws SQLException;
}
