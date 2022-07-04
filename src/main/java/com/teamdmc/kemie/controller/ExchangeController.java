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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Choi Jong Hee
 *
 */
@Controller("exchangeController")
public class ExchangeController {
	final Logger LOG = LogManager.getLogger(getClass());
	
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
}