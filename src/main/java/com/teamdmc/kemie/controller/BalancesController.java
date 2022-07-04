package com.teamdmc.kemie.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.teamdmc.kemie.cmn.JwtTokenMaker;
import com.teamdmc.kemie.upbit.domain.AcountsVO;
import com.teamdmc.kemie.upbit.domain.AllMarketVO;
import com.teamdmc.kemie.upbit.domain.MinitesCandleVO;


@Controller("balancesController")
public class BalancesController {
	final Logger LOG = LogManager.getLogger(getClass());

	@RequestMapping("/balancesPage.do")
	public String balancesPage(Model model) {
		JwtTokenMaker tokenMaker = new JwtTokenMaker();

		String token = tokenMaker.jwtTokenMaker();

		LOG.debug(token);
		
        try {
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet request = new HttpGet("https://api.upbit.com/v1/accounts");
            request.setHeader("Content-Type", "application/json");
            request.addHeader("Authorization", token);

            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();
            
            String data = EntityUtils.toString(entity, "UTF-8");
            
            LOG.debug("---------- list json mapping before");
            
            Type acountTypeToken = new TypeToken<ArrayList<AcountsVO>>() {}.getType();
            List<AcountsVO> list = new Gson().fromJson(data, acountTypeToken);
            
            LOG.debug("---------- list json mapping after\n"+list.toString());
            
//            list.get(0).getBalance();
            if(list.size() > 0) {
            	LOG.debug("---------- list.size() > 0 is true");
            	List<List<MinitesCandleVO>> mListList = new ArrayList<List<MinitesCandleVO>>();
//            	for(int i=1; i<list.size(); i++) {
//            	LOG.debug("list.get(i).getCurrency()"+list.get(i).getCurrency());
//            	}
            	Type mCandleTypeToken = new TypeToken<ArrayList<MinitesCandleVO>>() {}.getType();
            	List<MinitesCandleVO> minitesList = new ArrayList<MinitesCandleVO>(); 
            	
            	client = HttpClientBuilder.create().build();
            	request = new HttpGet("https://api.upbit.com/v1/market/all?isDetails=true");
            	request.setHeader("Content-Type", "application/json");
            	
            	response = client.execute(request);
    			entity = response.getEntity();
    			
    			data = EntityUtils.toString(entity, "UTF-8");
    			
    			Type allMarketTypeToken = new TypeToken<ArrayList<AllMarketVO>>() {}.getType();
    			List<AllMarketVO> marketList = new Gson().fromJson(data, allMarketTypeToken);
    			LOG.debug("allMarketList=="+marketList);
    			
    			int sum = 0;
    			List<String> marketKorNames = new ArrayList<String>();
            	for(int i=0; i<list.size(); i++) {
            		for(int j=0; j<marketList.size(); j++) {
	            		if( marketList.get(j).getMarket().contains("KRW") && marketList.get(j).getMarket().substring(marketList.get(j).getMarket().lastIndexOf('-')+1).equals(list.get(i).getCurrency())) {
		                	client = HttpClientBuilder.create().build();
		                	request = new HttpGet("https://api.upbit.com/v1/candles/minutes/1?market=KRW-" +list.get(i).getCurrency()+ "&count=1");
		                	request.setHeader("Content-Type", "application/json");
		                	
		                	response = client.execute(request);
		        			entity = response.getEntity();
		        			
		        			data = EntityUtils.toString(entity, "UTF-8");
		        			LOG.debug(data);
		        			LOG.debug("---------- minitesList gson mapping before");
		        			
		        		    minitesList = (List<MinitesCandleVO>) new Gson().fromJson(data, mCandleTypeToken);
		        			LOG.debug("---------- minitesList gson mapping success\n"+minitesList.toString());
		        			mListList.add(minitesList);
		        			LOG.debug("---------- mListList.add success!");

		        			break;
	            		}else if(j== marketList.size()-1) {
	            			minitesList.add(new MinitesCandleVO().mCandleNull(list.get(i).getCurrency()));
	            			mListList.add(minitesList);
	            		}
            		}
            		sum += Math.round(mListList.get(i).get(0).getTrade_price() * Double.parseDouble(list.get(i).getBalance()));
                }
            	
            	model.addAttribute("marketKorNames", marketKorNames);
            	model.addAttribute("sum", sum);
            	model.addAttribute("mListList", mListList);
            	model.addAttribute("list", list);
            	LOG.debug("---------- models on! success!");
            }
            LOG.debug("what the fword?");
        } catch (IOException e) {
            e.printStackTrace();
        }
		return "balancesPage";
	}
}
