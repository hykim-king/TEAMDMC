package com.teamdmc.kemie.usernews.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.cmn.SearchVO;
import com.teamdmc.kemie.cmn.StringUtil;
import com.teamdmc.kemie.usernews.domain.UserNewsVO;
import com.teamdmc.kemie.usernews.service.UserNewsService;

@Controller("userNewsController")
public class UserNewsController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String VIEW_NAME = "user/user_mng";
	
	@Autowired
	UserNewsService userNewsService;
	
	public UserNewsController() {}
	
	@RequestMapping(value="/idCheck.do", method = RequestMethod.GET, produces =  "application/json;charset=UTF-8")
	@ResponseBody
	public String idCheck(UserNewsVO inVO) throws SQLException{
		
		String jsonString = "";
		
		LOG.debug("---------------------");
		LOG.debug("--inVO-- : " + inVO);
		LOG.debug("---------------------");
		
		String resultMsg = "";
		int flag = userNewsService.idCheck(inVO);
		if(1==flag) {
			// 아이디가 있음
			resultMsg = inVO.getuId()+"가 존재합니다.";
		}else {
			resultMsg = inVO.getuId()+"는 사용 가능합니다.";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		jsonString = new Gson().toJson(message);
		
		LOG.debug("---------------------------");
		LOG.debug("--jsonString-- : " + jsonString);
		LOG.debug("---------------------------");
		
		return jsonString;
	}
	
	@RequestMapping(value="/userView.do",method=RequestMethod.GET)
	public String userView(Model model, SearchVO inVO) throws SQLException {
		LOG.debug("---------------------");
		LOG.debug("--userView--");
		LOG.debug("---------------------");
		
		// 페이지 사이즈 null 처리
		if(0==inVO.getPageSize()) {
			inVO.setPageSize(10);
		}
		
		// 페이지 넘버 null 처리
		if(0==inVO.getNum()) {
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
		
		List<UserNewsVO> list = userNewsService.doRetrieve(inVO);
		
		int totalCnt = 0;
		
		// 총 글 수 
		// pageTotal : 총 페이지 수
		double pageTotal = 0;
		if(null != list && list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
			pageTotal = Math.ceil(totalCnt/(inVO.getPageSize()*1.0));
			LOG.debug("---------------------------");
			LOG.debug("-pageTotal- : " + pageTotal);
			LOG.debug("---------------------------");	
			// int 나누기 int는 int! double로 받기 위해 *1.0처리
		}
		
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("list", list);
		
		return VIEW_NAME;
	}
	
	@RequestMapping(value="/doRetrieve.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException{
		String jsonString = "";
		
		LOG.debug("---------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("---------------------------");
		
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
		
		List<UserNewsVO> list = userNewsService.doRetrieve(inVO);
		Gson gson = new Gson();
		jsonString = gson.toJson(list);
		
		LOG.debug("---------------------------");
		LOG.debug("-jsonString- : " + jsonString);
		LOG.debug("---------------------------");
		
		return jsonString;
	}
	
	@RequestMapping(value="/doUpdate.do", method = RequestMethod.POST, produces =  "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(UserNewsVO inVO) throws SQLException{
		String jsonString = "";
		
		LOG.debug("---------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("---------------------------");
		
		String resultMsg = "";
		int flag = userNewsService.doUpdate(inVO);
		if(1==flag) {
			resultMsg = inVO.getuId() + "가 수정되었습니다.";
		} else {
			resultMsg = inVO.getuId() + "가 수정 실패!";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		Gson gson = new Gson();
		jsonString = gson.toJson(message);
		
		LOG.debug("---------------------------");
		LOG.debug("--jsonString-- : " + jsonString);
		LOG.debug("---------------------------");
		
		return jsonString;
	}
	
	@RequestMapping(value = "/add.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(UserNewsVO inVO) throws SQLException {
		String jsonString = "";
		
		LOG.debug("---------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("---------------------------");
		
		int flag = userNewsService.add(inVO);
		String resultMessage = "";
		if(1==flag) {
			resultMessage = inVO.getuId() + "가 등록되었습니다.";
		}else {
			resultMessage = inVO.getuId() + "가 등록 실패!"; 
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMessage);
		Gson gson = new Gson();
		jsonString = gson.toJson(message);
		return jsonString;
	}
	
	// http://localhost:8081/ehr/user/doDelete.do?uId=p26
	@RequestMapping(value="/doDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req, UserNewsVO inVO) throws SQLException{
		String jsonString ="";
		String uId = req.getParameter("uId");
		
		LOG.debug("---------------------------");
		LOG.debug("--uId : " + uId);
		// command로 param 읽기 (from name 값이 vo memeber 변수와 이름이 일치, setter로 값이 설정됨)
		LOG.debug("--inVO-- : " + inVO);
		LOG.debug("---------------------------");
		
		String resultMsg = "";
		int flag = userNewsService.doDelete(inVO);

		if(1==flag) {
			resultMsg = inVO.getuId() + "가 삭제되었습니다.";
		}else {
			resultMsg = inVO.getuId() + "가 삭제 실패!";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		Gson gson = new Gson();
		
		jsonString = gson.toJson(message);
		
		LOG.debug("---------------------------");
		LOG.debug("--jsonString-- : " + jsonString);
		LOG.debug("---------------------------");
		
		return jsonString;
	}
	
	
	// GET 방식으로http://localhost:8081/ehr/user/doSelectOne.do?uId=p26 요청
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	// 스프링에서 비동기 처리를 하는 경우 HTTP 요청의 본문 BODY 부분이 전달 됨
	// UserNewsVO inVO : form name VO 멤버 변수명이 동일하면 자동으로 맵핑
	public String doSelectOne(UserNewsVO inVO) throws SQLException{
		LOG.debug("--------------------------");
		LOG.debug("-inVO- : " + inVO);
		LOG.debug("--------------------------");
		
		UserNewsVO outVO = userNewsService.doSelectOne(inVO);
		Gson gson = new Gson();
		String jsonString = gson.toJson(outVO);
		
		LOG.debug("--------------------------");
		LOG.debug("-jsonString- : " + jsonString);
		LOG.debug("--------------------------");
		
		return jsonString;
	}
}
