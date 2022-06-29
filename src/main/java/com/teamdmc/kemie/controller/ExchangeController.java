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

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
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
	public String exchange(Model model) {
		
        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet request = new HttpGet("https://api.upbit.com/v1/market/all");
            request.setHeader("Content-Type", "application/json");

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();

            String data = EntityUtils.toString(entity, "UTF-8");

            LOG.debug("data=="+data);
            
            model.addAttribute("data", data);
        } catch (IOException e) {
            e.printStackTrace();
        }
		return "exchange";
	}	
}
