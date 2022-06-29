package com.teamdmc.kemie.board.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamdmc.kemie.cmn.StringUtil;
import com.google.gson.Gson;
import com.teamdmc.kemie.board.domain.BoardVO;
import com.teamdmc.kemie.board.service.BoardService;
import com.teamdmc.kemie.cmn.SearchVO;

@Controller("boardController")
@RequestMapping("board")
public class BoardController {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	BoardService boardService;
	
	public BoardController() {
		
	}
	
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException {
		
		String jsonString = "";
		
		LOG.debug("--------------------");
		LOG.debug("---doRetrieve---");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("--------------------");
		
		// 페이지 사이즈 null 처리
		if(0==inVO.getPageSize()) {
			inVO.setPageSize(10);
		}
		
		// 페이지 넘버 null 처리
		if(0==inVO.getPageNum()) {
			inVO.setPageNum(1);          
		}
		
		// 검색 구분 null 처리
		if(null==inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv(),""));
		}
		
		// 검색어 null 처리
		if(null==inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord(), ""));
		}
		
		LOG.debug("---------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("---------------------------");
		
		List<BoardVO> list = boardService.doRetrieve(inVO);
		Gson gson = new Gson();
		
		jsonString = gson.toJson(list);
				
		return jsonString;
				
	}
	
	@RequestMapping(value="/boardView.do", method=RequestMethod.GET)
	public String boardView(Model  model, SearchVO inVO) throws SQLException {
		LOG.debug("--------------------");
		LOG.debug("---boardView---");
		LOG.debug("--------------------");
		
		// 페이지 사이즈 null 처리
		if(0==inVO.getPageSize()) {
			inVO.setPageSize(10);
		}
		
		// 페이지 넘버 null 처리
		if(0==inVO.getPageNum()) {
			inVO.setPageNum(1);          
		}
		
		// 검색 구분 null 처리
		if(null==inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv(),""));
		}
		
		// 검색어 null 처리
		if(null==inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord(), ""));
		}
		
		LOG.debug("---------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("---------------------------");
		
		List<BoardVO> list = boardService.doRetrieve(inVO);
		model.addAttribute("list",list);
		model.addAttribute("vo",inVO);
		
		return "board";
	}

}
