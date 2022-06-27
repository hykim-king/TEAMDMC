package com.teamdmc.kemie.user.controller;

import java.sql.SQLException;

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
public class UserController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	userService userService;
	
	@RequestMapping("/myPage.do")  
	public String myPage() {
		System.out.println("userController테스트입니다.!");
		
		return "myPage";
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
		
		int flag = userService.doPassUpdate(inVO);
		
		if(flag == 1) resultMsg = "당신의 비밀번호가 성공적으로 변경되었습니다.";
		else resultMsg = "당신의 비밀번호는 변경되지 않았습니다.";
				
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
		
		LOG.debug("=========================");
		LOG.debug("=jsonString: ="+jsonString);
		LOG.debug("=========================");
		
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
			
			int flag = userService.passCheck(inVO);
			
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
		
		int flag = userService.nickCheck(inVO);
		
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
			
			int flag = userService.doNickUpdate(inVO);
			
			if(flag == 1) resultMsg = inVO.getNick() + "가 변경되었습니다.";
			else resultMsg = inVO.getNick() + "는 변경되지 않았습니다.";
					
			jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), resultMsg));
			
			LOG.debug("=========================");
			LOG.debug("=jsonString: ="+jsonString);
			LOG.debug("=========================");
			
			return jsonString;
		}
}
