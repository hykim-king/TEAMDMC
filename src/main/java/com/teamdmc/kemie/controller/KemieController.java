package com.teamdmc.kemie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		/*
		 * HttpRequest request = HttpRequest.newBuilder()
		 * .uri(URI.create("https://api.upbit.com/v1/market/all?isDetails=false"))
		 * .header("Accept", "application/json") .method("GET",
		 * HttpRequest.BodyPublishers.noBody()) .build(); HttpResponse<String> response
		 * = HttpClient.newHttpClient().send(request,
		 * HttpResponse.BodyHandlers.ofString()); System.out.println(response.body());
		 */
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
