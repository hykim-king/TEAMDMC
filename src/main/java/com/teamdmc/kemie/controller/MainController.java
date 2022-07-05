package com.teamdmc.kemie.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamdmc.kemie.navernews.Item;
import com.teamdmc.kemie.navernews.NaverService;

@Controller("mainController")
public class MainController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	NaverService naverService;
	
	public MainController() {}

	@RequestMapping(value="/mainPage.do")  
	public String mainPage(Model model) throws SQLException {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		List<Item> list = naverService.doRetrieve();
		
		model.addAttribute("list", list);
		
		return "mainPage";
	}
	
	
	
}
