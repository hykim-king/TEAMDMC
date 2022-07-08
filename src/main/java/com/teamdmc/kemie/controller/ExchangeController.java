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
import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.teamdmc.kemie.boardComment.domain.BoardCommentVO;
import com.teamdmc.kemie.cmn.MessageVO;
import com.teamdmc.kemie.userinterested.UserinterestedService;
import com.teamdmc.kemie.userinterested.domain.UserInterestedVO;

/**
 * @author Choi Jong Hee
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
	UserinterestedService userinterestedService;
	
	@RequestMapping("/exchange.do")  
	public String exchange(Model model){
   /*     try {
        	HttpClient client = HttpClientBuilder.create().build();
        	HttpGet request = new HttpGet("https://api.upbit.com/v1/candles/minutes/1?market=KRW-BTC&count=30");
            request.setHeader("Content-Type", "application/json");
            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();
            
			String json = EntityUtils.toString(entity, "UTF-8");
			
			Gson gson = new Gson();
			
			Type mCandleType = new TypeToken<ArrayList<MinitesCandleVO>>() {}.getType();
			List<MinitesCandleVO> list = gson.fromJson(json, mCandleType);
			
            model.addAttribute("list", list);
        } catch (IOException e) {
            e.printStackTrace();
        }*/
		
        return "exchange";
	}	
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentDelete(UserInterestedVO inVO) throws SQLException {

		LOG.debug("========================");
		LOG.debug("=inVO=" + inVO);

		int flag = userinterestedService.doDelete(inVO);
		String resultMsg = "";
		if (1 == flag) {
			resultMsg = "삭제되었습니다.";
		} else {
			resultMsg = "삭제 실패";
		}

		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		String jsonString = new Gson().toJson(message);
		LOG.debug("=jsonString=" + jsonString);
		LOG.debug("========================");
		return jsonString;
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
			Gson gson=new Gson();
			String jsonString = gson.toJson(list);
			LOG.debug("==============================");
			LOG.debug("=doSelectOne()=");
			LOG.debug("=jsonString="+jsonString);
			LOG.debug("==============================");	
			
			return jsonString;
		}
	
	@RequestMapping(value = "/insert.do",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody//스프링에서 비동기 처리를 하는 경우,HTTP 요청의 분문 body 부분이 그대로 전달된다.
	public String add(UserInterestedVO inVO) throws SQLException{
		String jsonString = "";
		LOG.debug("==============================");
		LOG.debug("=inVO="+inVO);
		LOG.debug("==============================");
		
		int flag = userinterestedService.doInsert(inVO);
		String resultMessage = "";
		if(1==flag) {//등록 성공	
			resultMessage = inVO.getUicMarket()+"가 등록 되었습니다.";
		}else {
			resultMessage = inVO.getUicMarket()+"등록 실패.";
		}
		
		MessageVO message=new MessageVO(String.valueOf(flag), resultMessage);
		Gson gson=new Gson();
		jsonString = gson.toJson(message);
		LOG.debug("==============================");
		LOG.debug("=jsonString="+jsonString);
		LOG.debug("==============================");		
		
		return jsonString;
	}
}