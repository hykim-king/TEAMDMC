package com.teamdmc.kemie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("kemieController")
public class KemieController {
	
	public KemieController() {}
	
	@RequestMapping("/mainPage.do")  
	public String mainPage() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "mainPage";
	}
	
	@RequestMapping("/exchange.do")  
	public String exchange() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "exchange";
	}
	
	@RequestMapping("/balancesPage.do")  
	public String balancesPage() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "balancesPage";
	}
	
	@RequestMapping("/board.do")  
	public String board() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "board";
	}
	
	@RequestMapping("/details.do")  
	public String details() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "details";
	}
	
	@RequestMapping("/faq.do")  
	public String faq() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "faq";
	}
	
	@RequestMapping("/loginPage.do")  
	public String loginPage() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "loginPage";
	}
//	
//	@RequestMapping("/myPage.do")  
//	public String myPage() {
//		System.out.println("메인 테스트입니다 메인 테스트입니다.");
//		
//		return "myPage";
//	}
	
	@RequestMapping("/signin.do")  
	public String signin() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "signin";
	}
	
	@RequestMapping("/write.do")  
	public String write() {
		System.out.println("메인 테스트입니다 메인 테스트입니다.");
		
		return "write";
	}
}
