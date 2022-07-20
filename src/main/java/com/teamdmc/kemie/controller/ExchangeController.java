/**
* <pre>
* com.teamdmc.kemie.controller
* Class Name : ExchangeController.java
* Description:
* Author: Choi Jong Hee
* Since: 2022/06/29
* Version 0.1
* Copyright (c) by H.R.KIM All right reserved.
* Modification Information
* 수정일   수정자    수정내용
*-----------------------------------------------------
*2022/06/29 최초생성
*-----------------------------------------------------
* </pre>
*/
package com.teamdmc.kemie.controller;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.upbit.API.ApiDao;
import com.teamdmc.kemie.upbit.domain.AllMarketVO;
import com.teamdmc.kemie.upbit.domain.TickerVO;
import com.teamdmc.kemie.user.domain.UserVO;
import com.teamdmc.kemie.userinterested.UserinterestedService;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

/**
 * @author Choi Jong Hee, Teus(Teawook Kim)
 *
 */
@Controller("exchangeController")
public class ExchangeController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE ="com.teamdmc.kemie.controller";
	
	//mybatis db연결객체
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
		
	@Autowired
	ApiDao apiDao;
	
	@Autowired
	UserinterestedService userinterestedService;
	
	@RequestMapping("/exchange.do")  
	public String exchange(HttpSession session, HttpServletRequest request, @RequestParam(value="market", defaultValue = "비트코인") String market, Model model){
		UserVO inVO = (UserVO) session.getAttribute("user"); // 로그인 세션 가져오기
		LOG.debug("============================");
		LOG.debug("=HttpSession="+session);
		LOG.debug("=inVO="+inVO);
		LOG.debug("=market="+market);
		LOG.debug("============================");

		if(inVO == null) { // 세션 정보가 없는 경우 메인 페이지로 보냄
			LOG.debug("==세선 정보가 없습니다.==");
			return "mainPage"; 
		}
		
		String marketNames = ""; // 암호 화폐의 market 이름을 저장할 변수
		UserInterestedVO voVO = new UserInterestedVO(0, "", inVO.getuId()); // 가져온 세션으로 uic VO 생성
		
		List<UserInterestedVO> uicList = userinterestedService.getAll(voVO); // 관심코인 조회 -> market이름만 가져옴
		
		for(UserInterestedVO vo : uicList) 
			marketNames += vo.getUicMarket()+"%2C"; // market 값 뒤에 %2C를 붙여 url에 붙일 수 있도록 String값 조정
		
		marketNames = marketNames.substring(0, marketNames.length()-3); // 마지막 %2C 제거

		List<TickerVO> uicTickerList = apiDao.getTicker(marketNames);
		
		model.addAttribute("uicTickerList", uicTickerList);
//---------------------------------------------------------------- 관심 코인 시세 조회 끝
		List<AllMarketVO> marketList = apiDao.getAllMarket("false");
		LOG.debug("=marketList="+marketList);
		
		marketNames = ""; // marketNames 변수 초기화
		
		if(marketList.size() > 0) {
			for(AllMarketVO vo : marketList) {
				if(vo.getMarket().contains("KRW")) {
					marketNames+= vo.getMarket()+"%2C";
					if(vo.getKorean_name().equals(market)) model.addAttribute("market", vo.getMarket());
				}
			}
			
			marketNames = marketNames.substring(0, marketNames.length()-3);
			LOG.debug("=마지막 %2C 제거 marketNames="+marketNames);
			
			List<TickerVO> tickerList = apiDao.getTicker(marketNames);
			LOG.debug("=tickerList="+tickerList);
			
			model.addAttribute("tickerList", tickerList);
		}
        return "exchange";
	}	

	@RequestMapping(value = "/addOrDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addOrDelete(UserInterestedVO inVO) throws SQLException {

		LOG.debug("========================");
		LOG.debug("=addOrDelete()=");
		LOG.debug("=inVO=" + inVO);
		LOG.debug("========================");
		
		MessageVO message = userinterestedService.addOrDelete(inVO);
		
		return new Gson().toJson(message);
	}
	
	//GET방식으로 : http://localhost:8081/ehr/user/doSelectOne.do?uId=p31
		@RequestMapping(value = "/getAll.do",method = RequestMethod.GET
				,produces = "application/json;charset=UTF-8")
		@ResponseBody //스프링에서 비동기 처리를 하는 경우, Http 요청의 본문 body부분이 전달된다.
		//UserVO inVO : form name VO 멤버변수명이 동일하면 자동으로 메핑한다.
		public String getAll(UserInterestedVO inVO) throws SQLException{
			LOG.debug("==============================");
			LOG.debug("=getAll()=");
			LOG.debug("=inVO="+inVO);
			LOG.debug("==============================");
			
			List<UserInterestedVO> list = userinterestedService.getAll(inVO);

			return new Gson().toJson(list);
		}
}