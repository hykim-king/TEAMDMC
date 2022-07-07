package com.teamdmc.kemie.login.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.user.domain.UserVO;
import com.teamdmc.kemie.user.service.userService;

@Controller("loginController")
@RequestMapping("login")
public class LoginController {
	
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	userService Uservice;
	
	public LoginController() {
		LOG.debug("===========================");
		LOG.debug("=LonginController()=");
		LOG.debug("===========================");
	}
	
	
	@RequestMapping(value="/doLogout.do")
	public String doLogout(HttpSession session)throws SQLException{
		LOG.debug("===========================");
		LOG.debug("=doLogout()=");
		LOG.debug("===========================");		
		
		if(null != session.getAttribute("user")) {
			session.removeAttribute("user");
			session.invalidate();
		}
		return "mainPage";
	}
	
	
	@RequestMapping(value="/doLogin.do"
					,method = RequestMethod.POST 
					,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doLogin(UserVO inVO, HttpSession session)throws SQLException{
		String jsonString = "";
		LOG.debug("===========================");
		LOG.debug("=inVO="+inVO);
		LOG.debug("===========================");
		
		
		MessageVO message = Uservice.idPassCheck(inVO);
        //msgId
		//1. ID확인 : 10
		//2. 비번확인: 20      
		//3. id/비번 통과: 30		
		
		if(null !=message && "30".equals(message.getMsgId())){
			UserVO loginUser = Uservice.doSelectOne(inVO);
			if(null !=loginUser) {
				session.setAttribute("user", loginUser);
				
				message.setMsgContents("반갑습니다"+loginUser.getName()+"님.");
			}
		}
		
		jsonString = new Gson().toJson(message);
		
		LOG.debug("===========================");
		LOG.debug("=jsonString="+jsonString);
		LOG.debug("===========================");		
		return jsonString;
	}
	
	@RequestMapping(value="/loginAlert.do", method=RequestMethod.GET)
	public String loginAlert()throws SQLException{
		LOG.debug("===========================");
		LOG.debug("=loginAlert()=");
		LOG.debug("===========================");
		
		return "alertPage";
	}
	
	@RequestMapping(value="/loginView.do", method=RequestMethod.GET)
	public String loginView()throws SQLException{
		LOG.debug("===========================");
		LOG.debug("=loginView()=");
		LOG.debug("===========================");
		
		return "loginPage";
	}
}