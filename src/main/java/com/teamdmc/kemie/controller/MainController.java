package com.teamdmc.kemie.controller;

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
import com.teamdmc.kemie.navernews.NaverDao;
import com.teamdmc.kemie.navernews.NaverSearchVO;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

@Controller("mainController")
public class MainController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	NaverDao naverDao;
	
	public MainController() {}

	@RequestMapping(value="/mainPage.do")  
	public String mainPage(Model model) throws SQLException {
		NaverSearchVO list = naverDao.doRetrieve();
		
		model.addAttribute("list", list);
		
		return "mainPage";
	}
	
	@RequestMapping(value = "/main/doRefreshNN.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRefreshNN() throws SQLException {

		LOG.debug("========================");
		LOG.debug("=doRefreshNN()=");
		LOG.debug("========================");
		
		NaverSearchVO data = naverDao.doRetrieve();
		
		return new Gson().toJson(data);
	}
}
