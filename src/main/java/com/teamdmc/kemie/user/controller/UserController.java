package com.teamdmc.kemie.user.controller;

import java.sql.SQLException;

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
import com.teamdmc.kemie.user.domain.UserVO;
import com.teamdmc.kemie.user.service.userService;

@Controller("userController")
@RequestMapping("userinfo")
public class UserController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	userService Uservice;
	
	@RequestMapping("/myPage.do")  
	public String myPage() {
		System.out.println("userController테스트입니다.!");
		return "myPage";
	}
	
	
	@RequestMapping(value = "/doInsert.do",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody//스프링에서 비동기 처리를 하는 경우,HTTP 요청의 분문 body 부분이 그대로 전달된다.
	public String doInsert(UserVO inVO) throws SQLException{
		String jsonString = "";
		LOG.debug("==============================");
		LOG.debug("=inVO="+inVO);
		LOG.debug("==============================");
		String resultMsg = "";
		
		int flag = Uservice.doInsert(inVO);
		String resultMessage = "";
		
		if(1==flag) {//등록 성공
			resultMessage = inVO.getuId()+"가 등록 되었습니다.";
		}else {
			resultMessage = inVO.getuId()+"등록 실패.";
		}
		
		MessageVO message=new MessageVO(String.valueOf(flag), resultMessage);
		Gson gson=new Gson();
		jsonString = gson.toJson(message);
		LOG.debug("==============================");
		LOG.debug("=jsonString="+jsonString);
		LOG.debug("==============================");		
		
		return jsonString;
	}
	
	
	@RequestMapping(value="/doDelete.do",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req, UserVO inVO) throws SQLException{
		String jsonString = "";
		  
		//HttpServletRequest param읽기
		String uId = req.getParameter("uId");
		LOG.debug("==============================");
		LOG.debug("=uId="+uId);
		//Command로 param읽기(from name값이 VO member변수와 이름이 일치(setter로 값이 설정됨)
		LOG.debug("=inVO="+inVO);
		LOG.debug("==============================");		
		
		String resultMsg = "";
		int flag = Uservice.doDelete(inVO);
		if(1==flag) {
			resultMsg = inVO.getuId()+"가 삭제 되었습니다.";
		}else {
			resultMsg = inVO.getuId()+"가 삭제 실패!";
		}
		
		MessageVO message=new MessageVO(String.valueOf(flag), resultMsg);	
		Gson gson=new Gson();
		
		jsonString = gson.toJson(message);
		LOG.debug("==============================");
		LOG.debug("=jsonString="+jsonString);		
		LOG.debug("==============================");
		
		return jsonString;
	}
	
	
	// testURL : http://localhost:8080/kemie/doNickUpdate.do?nick=테스트01
	@RequestMapping(value="/doPassUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doPassUpdate(Model model, UserVO inVO) throws SQLException {
		String resultMsg = "";
		String jsonString = "";
		
		LOG.debug("==========================");
		LOG.debug("=doNickUpdate()=");
		LOG.debug("==========================");
		
		int flag = Uservice.doPassUpdate(inVO);
		
		if(flag == 1) resultMsg = "당신의 비밀번호가 성공적으로 변경되었습니다.";
		else resultMsg = "당신의 비밀번호는 변경되지 않았습니다.";
				
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
		
		LOG.debug("=========================");
		LOG.debug("=jsonString: ="+jsonString);
		LOG.debug("=========================");
		
		return jsonString;
	}
	
	
	@RequestMapping(value="/idCheck.do",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")	
	@ResponseBody
	public String idCheck(UserVO inVO) throws SQLException{
		String jsonString = "";
		LOG.debug("==============================");
		LOG.debug("=inVO="+inVO);
		LOG.debug("==============================");
		
		String resultMsg = "";
		int flag = Uservice.idCheck(inVO);
		if(1==flag) {
			resultMsg =inVO.getuId()+"가 존재 합니다.";
		}else {
			resultMsg =inVO.getuId()+"는 사용할 수 있습니다.";
		}
		
		MessageVO message=new MessageVO(String.valueOf(flag), resultMsg);	
		jsonString = new Gson().toJson(message);
		LOG.debug("==============================");
		LOG.debug("=jsonString="+jsonString);		
		LOG.debug("==============================");
		return jsonString;
	}
	
	
	
	// testURL : http://localhost:8080/kemie/getPass.do?u_id=id01
		@RequestMapping(value="/passCheck.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String passCheck(Model model, UserVO inVO) throws SQLException {
			String resultMsg = "";
			String jsonString = "";
			
			LOG.debug("==========================");
			LOG.debug("=getPass()=");
			LOG.debug("==========================");
			
			int flag = Uservice.passCheck(inVO);
			
			if(flag == 1) resultMsg = "이전과 동일한 비밀번호입니다!";
			else resultMsg = "이전과 동일하지 않은 비밀번호입니다.";
					
			jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
			
			LOG.debug("=========================");
			LOG.debug("=jsonString: ="+jsonString);
			LOG.debug("=========================");
			
			return jsonString;
		}
	
	// testURL : http://localhost:8080/kemie/nickCheck.do?nick=테스트01
	@RequestMapping(value="/nickCheck.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nickCheck(Model model, UserVO inVO) throws SQLException {
		String resultMsg = "";
		String jsonString = "";
		
		LOG.debug("==========================");
		LOG.debug("=nickCheck()=");
		LOG.debug("==========================");
		
		int flag = Uservice.nickCheck(inVO);
		
		if(flag == 1) resultMsg = inVO.getNick() + "가 중복되었습니다.";
		else resultMsg = inVO.getNick() + "는 중복되지 않았습니다.";
				
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
		
		LOG.debug("=========================");
		LOG.debug("=jsonString: ="+jsonString);
		LOG.debug("=========================");
		
		return jsonString;
	}
	
	// testURL : http://localhost:8080/kemie/doNickUpdate.do?nick=테스트01
		@RequestMapping(value="/doNickUpdate.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String doNickUpdate(Model model, UserVO inVO) throws SQLException {
			String resultMsg = "";
			String jsonString = "";
			
			LOG.debug("==========================");
			LOG.debug("=doNickUpdate()=");
			LOG.debug("==========================");
			
			int flag = Uservice.doNickUpdate(inVO);
			
			if(flag == 1) resultMsg = inVO.getNick() + "가 변경되었습니다.";
			else resultMsg = inVO.getNick() + "는 변경되지 않았습니다.";
					
			jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
			
			LOG.debug("=========================");
			LOG.debug("=jsonString: ="+jsonString);
			LOG.debug("=========================");
			
			return jsonString;
		}
}
