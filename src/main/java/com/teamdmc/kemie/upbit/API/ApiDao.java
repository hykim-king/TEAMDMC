package com.teamdmc.kemie.upbit.API;

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
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.teamdmc.kemie.upbit.domain.AcountsVO;
import com.teamdmc.kemie.upbit.domain.AllMarketVO;
import com.teamdmc.kemie.upbit.domain.MinitesCandleVO;
import com.teamdmc.kemie.upbit.domain.TickerVO;

@Repository("apiDao")
public class ApiDao {
	final Logger LOG = LogManager.getLogger(getClass());
	
	public List<AcountsVO> getAccounts(String token) {
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/accounts"); // 사용 API URL
			request.setHeader("Content-Type", "application/json");
			request.addHeader("Authorization", token); // 인증 토큰
	
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
	
			String data = EntityUtils.toString(entity, "UTF-8");
			
			if(data.contains("no_authorization_i_p")) {
				LOG.debug("=====================================");
				LOG.debug("=인증되지 않은 IP오류입니다. UPBIT IP 권환 확인 요망=");
				LOG.debug("=https://upbit.com/");
				LOG.debug("=====================================");
			}
			
			LOG.debug("=data="+data);
			
			Type acountTypeToken = new TypeToken<ArrayList<AcountsVO>>() {}.getType();
			return new Gson().fromJson(data, acountTypeToken);
		}catch (IOException e) {
			LOG.debug(e.getMessage());
		}
		return null;
	}
	
	public List<AllMarketVO> getAllMarket(String isDetails) {
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/market/all?isDetails="+isDetails);
			request.setHeader("Content-Type", "application/json");
	
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
	
			String data = EntityUtils.toString(entity, "UTF-8");
			
			LOG.debug("=data="+data);
			
			Type allMarketTypeToken = new TypeToken<ArrayList<AllMarketVO>>() {}.getType();
			return new Gson().fromJson(data, allMarketTypeToken);
		}catch (IOException e) {
			LOG.debug(e.getMessage());
		}
		return null;
	}
	
	public List<MinitesCandleVO> getMiniutes(String marketName) {
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/candles/minutes/1?market=" + marketName + "&count=1");
			request.setHeader("Content-Type", "application/json");
	
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
	
			String data = EntityUtils.toString(entity, "UTF-8");
			
			LOG.debug("=data="+data);
			
			Type mCandleTypeToken = new TypeToken<ArrayList<MinitesCandleVO>>() {}.getType();
			return new Gson().fromJson(data, mCandleTypeToken);
		}catch (IOException e) {
			LOG.debug(e.getMessage());
		}
		return null;
	}
	
	public List<TickerVO> getTicker(String markets) {
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/ticker?markets=" + markets);
			request.setHeader("Content-Type", "application/json");
	
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
	
			String data = EntityUtils.toString(entity, "UTF-8");
			
			LOG.debug("=data="+data);
			
			Type tickerType = new TypeToken<ArrayList<TickerVO>>() {}.getType();
			return new Gson().fromJson(data, tickerType);
		}catch (IOException e) {
			LOG.debug(e.getMessage());
		}
		return null;
	}
}
