package com.teamdmc.kemie.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.teamdmc.kemie.cmn.JwtTokenMaker;
import com.teamdmc.kemie.upbit.API.ApiDao;
import com.teamdmc.kemie.upbit.domain.AcountsVO;
import com.teamdmc.kemie.upbit.domain.AllMarketVO;
import com.teamdmc.kemie.upbit.domain.DepositsVO;
import com.teamdmc.kemie.upbit.domain.MinitesCandleVO;
import com.teamdmc.kemie.upbit.domain.TickerVO;
import com.teamdmc.kemie.upbit.domain.WithdrawsVO;

@Controller("balancesController")
public class BalancesController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApiDao apiDao;
	
	@RequestMapping(value = "/getWithdraws.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getWithdraws(String currency)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		JwtTokenMaker jwtTokenMaker = new JwtTokenMaker();
		String jsonString = "";

		String token = jwtTokenMaker.depositAndPostKRW("currency", currency);

		LOG.debug("========================================");
		LOG.debug("====getWithdraws()====");
		LOG.debug("param: " + currency);
		LOG.debug("token: " + token);

		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/withdraws?currency=" + currency);
			request.setHeader("Content-Type", "application/json");
			request.addHeader("Authorization", token);

			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();

			String data = EntityUtils.toString(entity, "UTF-8");
			LOG.debug("data: " + data);

			List<WithdrawsVO> withList = Arrays.asList(new ObjectMapper().readValue(data, WithdrawsVO[].class));
			for (WithdrawsVO vo : withList)
				LOG.debug("vo: " + vo);

			jsonString = new Gson().toJson(withList);
			LOG.debug("jsonString: " + jsonString);

			return jsonString;
		} catch (IOException e) {
			LOG.debug(e.toString());
			System.out.println(e.getMessage());
		}
		return jsonString;
	}
	
	@RequestMapping(value = "/getDeposit.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getDeposit(String currency)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		JwtTokenMaker jwtTokenMaker = new JwtTokenMaker();
		String jsonString = "";

		String token = jwtTokenMaker.depositAndPostKRW("currency", currency);

		LOG.debug("========================================");
		LOG.debug("====getDeposit()====");
		LOG.debug("param: " + currency);
		LOG.debug("token: " + token);

		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet("https://api.upbit.com/v1/deposits?currency=" + currency);
			request.setHeader("Content-Type", "application/json");
			request.addHeader("Authorization", token);

			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();

			String data = EntityUtils.toString(entity, "UTF-8");
			LOG.debug("data: " + data);

			List<DepositsVO> depoList = Arrays.asList(new ObjectMapper().readValue(data, DepositsVO[].class));
			for (DepositsVO vo : depoList)
				LOG.debug("vo: " + vo);

			jsonString = new Gson().toJson(depoList);
			LOG.debug("jsonString: " + jsonString);

			return jsonString;
		} catch (IOException e) {
			LOG.debug(e.toString());
			System.out.println(e.getMessage());
		}
		return jsonString;
	}

	@RequestMapping(value = "/withDrawsKRW.do", method = RequestMethod.POST)
	@ResponseBody
	public int withDrawsKRW(String amount) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		JwtTokenMaker jwtTokenMaker = new JwtTokenMaker();
		int flag = 0;
		String token = jwtTokenMaker.depositAndPostKRW("amount", amount); // 토큰 생성

		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost request = new HttpPost("https://api.upbit.com/v1/withdraws/krw");
			request.setHeader("Content-Type", "application/json");
			request.addHeader("Authorization", token);
			request.setEntity(new StringEntity(new Gson().toJson(jwtTokenMaker.paramsHashMap("amount", amount))));

			HttpResponse response = client.execute(request);
			// HttpEntity entity = response.getEntity();

			flag = 1;

			return flag;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@RequestMapping(value = "/depositKRW.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int depositKRW(String amount) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		JwtTokenMaker jwtTokenMaker = new JwtTokenMaker();
		int flag = 0;
		String token = jwtTokenMaker.depositAndPostKRW("amount", amount); // 토큰 생성
		System.out.println(token);
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost request = new HttpPost("https://api.upbit.com/v1/deposits/krw");
			request.setHeader("Content-Type", "application/json");
			request.addHeader("Authorization", token);
			request.setEntity(new StringEntity(new Gson().toJson(jwtTokenMaker.paramsHashMap("amount", amount))));

			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();

			System.out.println(EntityUtils.toString(entity, "UTF-8"));
			
			flag = 1;

			return flag;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	@RequestMapping(value = "/getAccounts.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getAccounts() throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String token = new JwtTokenMaker().jwtTokenMaker();
		
		return new Gson().toJson(apiDao.getAccounts(token));
	}
	
	@RequestMapping(value = "/getAllItems.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getAllItems(String currency) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		return new Gson().toJson(apiDao.getAllMarket("false"));
	}
	
	@RequestMapping(value = "/balancesPage.do")
	public String balancesPage(Model model) {
		JwtTokenMaker tokenMaker = new JwtTokenMaker();

		String token = tokenMaker.jwtTokenMaker(); // JwTTokenMaker 객체의 jwtTokenMaker 메소드를 이용하여 토큰 생성

		LOG.debug(token);

		List<AcountsVO> list = apiDao.getAccounts(token);

		if (list.size() > 0) { // API를 통해 가져온 json 데이터가 있으면
			LOG.debug("---------- list.size() > 0 is true");
			List<List<MinitesCandleVO>> mListList = new ArrayList<List<MinitesCandleVO>>();

			List<MinitesCandleVO> minitesList = new ArrayList<MinitesCandleVO>();

			List<AllMarketVO> marketList = apiDao.getAllMarket("true");
			LOG.debug("allMarketList==" + marketList);

			int sum = 0;

			for (int i = 0; i < list.size(); i++) {
				for (int j = 1; j < marketList.size(); j++) {
					// 만약 marketList에 포함된 market명에 KRW를 포함하고, currency와 market명(ex. KRW-BTC)에서
					// 구분자('-') 뒤 3글자가 같으면 실행
					// 위의 조건식이 참일 경우 for문을 통해 API 분 캔들 조회 실행
					String currnecyStr = marketList.get(j).getMarket(); // marketList의 j번째 요소의 market 변수 가져오기
					currnecyStr = currnecyStr.substring(currnecyStr.lastIndexOf('-') + 1); // market 값(ex. KRW-BTC에서 BTC만 추출)
					
					if (marketList.get(j).getMarket().contains("KRW") && currnecyStr.equals(list.get(i).getCurrency())) {
						// 원하는 currency에 해당하는 데이터 만들기(분 캔들 조회)
						
						minitesList = apiDao.getMiniutes("KRW-" + list.get(i).getCurrency());
						LOG.debug("========minitesList: "+minitesList);
						mListList.add(minitesList);
					} else if (j == marketList.size() - 1) {
						minitesList.add(new MinitesCandleVO().mCandleNull(list.get(i).getCurrency()));
						mListList.add(minitesList);
					}
				}
				LOG.debug("========mListList: "+mListList);
				
				sum += Math.round(
						mListList.get(i).get(0).getTrade_price() * Double.parseDouble(list.get(i).getBalance()));
			}
			model.addAttribute("sum", sum);
			model.addAttribute("mListList", mListList);
			model.addAttribute("list", list);
			LOG.debug("---------- models on! success!");
		}
		// 코인 시세
		String marketContainKRW = ""; // 가상 화폐 market 명에서 KRW를 포함하는 market명을 저장하는 String

		List<AllMarketVO> marketList = apiDao.getAllMarket("false");

		for (int i = 0; i < marketList.size(); i++)
			if (marketList.get(i).getMarket().contains("KRW"))
				marketContainKRW += marketList.get(i).getMarket() + "%2C";
		
		marketContainKRW = marketContainKRW.substring(0, marketContainKRW.length() - 3);
		LOG.debug("marketContainKRW 마지막 %2C 제거 후 : " + marketContainKRW);
		
		List<TickerVO> tickerList = apiDao.getTicker(marketContainKRW);
		LOG.debug("tickerList: " + tickerList);

		model.addAttribute("tickerList", tickerList);
		
		return "balancesPage";
	}
	
//	@RequestMapping(value = "/balancesPage.do")
//	public String balancesPage(Model model) {
//		JwtTokenMaker tokenMaker = new JwtTokenMaker();
//
//		String token = tokenMaker.jwtTokenMaker(); // JwTTokenMaker 객체의 jwtTokenMaker 메소드를 이용하여 토큰 생성
//
//		LOG.debug(token);
//
//		try {
//			// 보유 금액 및 보유 코인 조회 ----------------------------------------------
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet request = new HttpGet("https://api.upbit.com/v1/accounts"); // 사용 API URL
//			request.setHeader("Content-Type", "application/json");
//			request.addHeader("Authorization", token); // 인증 토큰
//
//			HttpResponse response = client.execute(request);
//			HttpEntity entity = response.getEntity();
//
//			String data = EntityUtils.toString(entity, "UTF-8");
//			
//			if(data.contains("no_authorization_i_p")) {
//				LOG.debug("=====================================");
//				LOG.debug("=인증되지 않은 IP오류입니다. UPBIT IP 권환 확인 요망=");
//				LOG.debug("=https://upbit.com/");
//				LOG.debug("=====================================");
//			}
//			
//			LOG.debug("=data="+data);
//			
//			Type acountTypeToken = new TypeToken<ArrayList<AcountsVO>>() {}.getType();
//			
//			List<AcountsVO> list = new Gson().fromJson(data, acountTypeToken);
//
//			if (list.size() > 0) { // API를 통해 가져온 json 데이터가 있으면
//				LOG.debug("---------- list.size() > 0 is true");
//				List<List<MinitesCandleVO>> mListList = new ArrayList<List<MinitesCandleVO>>();
//
//				Type mCandleTypeToken = new TypeToken<ArrayList<MinitesCandleVO>>() {
//				}.getType();
//				List<MinitesCandleVO> minitesList = new ArrayList<MinitesCandleVO>();
//
////				client = HttpClientBuilder.create().build();
//				request = new HttpGet("https://api.upbit.com/v1/market/all?isDetails=true");
//				request.setHeader("Content-Type", "application/json");
//
//				response = client.execute(request);
//				entity = response.getEntity();
//
//				data = EntityUtils.toString(entity, "UTF-8");
//
//				Type allMarketTypeToken = new TypeToken<ArrayList<AllMarketVO>>() {
//				}.getType();
//				List<AllMarketVO> marketList = new Gson().fromJson(data, allMarketTypeToken);
//				LOG.debug("allMarketList==" + marketList);
//
//				int sum = 0;
//				List<String> marketKorNames = new ArrayList<String>(); // 가상 화폐 한국어 이름 저장하는 List
//
//				for (int i = 0; i < list.size(); i++) {
//					for (int j = 1; j < marketList.size(); j++) {
//						// 만약 marketList에 포함된 market명에 KRW를 포함하고, currency와 market명(ex. KRW-BTC)에서
//						// 구분자('-') 뒤 3글자가 같으면 실행
//						// 위의 조건식이 참일 경우 for문을 통해 API 분 캔들 조회 실행
//						if (marketList.get(j).getMarket().contains("KRW") && marketList.get(j).getMarket()
//								.substring(marketList.get(j).getMarket().lastIndexOf('-') + 1)
//								.equals(list.get(i).getCurrency())) {
//							// 원하는 currency에 해당하는 데이터 만들기(분 캔들 조회)
//							LOG.debug("marketList에 포함된 market값이 현재 currency의 값과 같나요? " + marketList.get(j).getMarket()
//									.substring(marketList.get(j).getMarket().lastIndexOf('-') + 1)
//									.equals(list.get(i).getCurrency()));
//
////							client = HttpClientBuilder.create().build();
//							request = new HttpGet("https://api.upbit.com/v1/candles/minutes/1?market=KRW-"
//									+ list.get(i).getCurrency() + "&count=1");
//							request.setHeader("Content-Type", "application/json");
//
//							response = client.execute(request);
//							entity = response.getEntity();
//
//							data = EntityUtils.toString(entity, "UTF-8");
//							LOG.debug(data);
//							LOG.debug("---------- minitesList gson mapping before");
//
//							minitesList = (List<MinitesCandleVO>) new Gson().fromJson(data, mCandleTypeToken);
//							LOG.debug("---------- minitesList gson mapping success\n" + minitesList.toString());
//							mListList.add(minitesList);
//							LOG.debug("---------- mListList.add success!");
//						} else if (j == marketList.size() - 1) {
//							minitesList.add(new MinitesCandleVO().mCandleNull(list.get(i).getCurrency()));
//							mListList.add(minitesList);
//						}
//					}
//
//					sum += Math.round(
//							mListList.get(i).get(0).getTrade_price() * Double.parseDouble(list.get(i).getBalance()));
//				}
//
//				model.addAttribute("marketKorNames", marketKorNames);
//				model.addAttribute("sum", sum);
//				model.addAttribute("mListList", mListList);
//				model.addAttribute("list", list);
//				LOG.debug("---------- models on! success!");
//			}
//			// 코인 시세
//			String marketContainKRW = ""; // 가상 화폐 market 명에서 KRW를 포함하는 market명을 저장하는 String
//
//			client = HttpClientBuilder.create().build();
//			request = new HttpGet("https://api.upbit.com/v1/market/all?isDetails=false");
//			request.setHeader("Content-Type", "application/json");
//			response = client.execute(request);
//			entity = response.getEntity();
//
//			data = EntityUtils.toString(entity, "UTF-8");
//
//			Type allMarketTypeToken = new TypeToken<ArrayList<AllMarketVO>>() {
//			}.getType();
//			List<AllMarketVO> marketList = new Gson().fromJson(data, allMarketTypeToken);
//
//			if (marketList.size() > 0) {
//				for (int i = 0; i < marketList.size(); i++) {
//					if (marketList.get(i).getMarket().contains("KRW"))
//						marketContainKRW += marketList.get(i).getMarket() + "%2C";
//				}
//				marketContainKRW = marketContainKRW.substring(0, marketContainKRW.length() - 3);
//				LOG.debug("marketContainKRW 마지막 %2C 제거 후 : " + marketContainKRW);
//				
//				client = HttpClientBuilder.create().build();
//				request = new HttpGet("https://api.upbit.com/v1/ticker?markets=" + marketContainKRW);
//				request.setHeader("Content-Type", "application/json");
//				response = client.execute(request);
//				entity = response.getEntity();
//
//				data = EntityUtils.toString(entity, "UTF-8");
//				LOG.debug("ticker조회 data: " + data);
//				Type tickerType = new TypeToken<ArrayList<TickerVO>>() {}.getType();
//				List<TickerVO> tickerList = new Gson().fromJson(data, tickerType);
//				LOG.debug("tickerList: " + tickerList);
//
//				model.addAttribute("tickerList", tickerList);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return "balancesPage";
//	}	
//	
//	public List<AcountsVO> getAccounts(String token) {
//		try {
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet request = new HttpGet("https://api.upbit.com/v1/accounts"); // 사용 API URL
//			request.setHeader("Content-Type", "application/json");
//			request.addHeader("Authorization", token); // 인증 토큰
//	
//			HttpResponse response = client.execute(request);
//			HttpEntity entity = response.getEntity();
//	
//			String data = EntityUtils.toString(entity, "UTF-8");
//			
//			if(data.contains("no_authorization_i_p")) {
//				LOG.debug("=====================================");
//				LOG.debug("=인증되지 않은 IP오류입니다. UPBIT IP 권환 확인 요망=");
//				LOG.debug("=https://upbit.com/");
//				LOG.debug("=====================================");
//			}
//			
//			LOG.debug("=data="+data);
//			
//			Type acountTypeToken = new TypeToken<ArrayList<AcountsVO>>() {}.getType();
//			return new Gson().fromJson(data, acountTypeToken);
//		}catch (IOException e) {
//			LOG.debug(e.getMessage());
//		}
//		return null;
//	}
//	
//	public List<AllMarketVO> getAllMarket(String isDetails) {
//		try {
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet request = new HttpGet("https://api.upbit.com/v1/market/all?isDetails="+isDetails);
//			request.setHeader("Content-Type", "application/json");
//	
//			HttpResponse response = client.execute(request);
//			HttpEntity entity = response.getEntity();
//	
//			String data = EntityUtils.toString(entity, "UTF-8");
//			
//			LOG.debug("=data="+data);
//			
//			Type allMarketTypeToken = new TypeToken<ArrayList<AllMarketVO>>() {}.getType();
//			return new Gson().fromJson(data, allMarketTypeToken);
//		}catch (IOException e) {
//			LOG.debug(e.getMessage());
//		}
//		return null;
//	}
//	
//	public List<MinitesCandleVO> getMiniutes(String currency) {
//		try {
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet request = new HttpGet("https://api.upbit.com/v1/candles/minutes/1?market=KRW-" + currency + "&count=1");
//			request.setHeader("Content-Type", "application/json");
//	
//			HttpResponse response = client.execute(request);
//			HttpEntity entity = response.getEntity();
//	
//			String data = EntityUtils.toString(entity, "UTF-8");
//			
//			LOG.debug("=data="+data);
//			
//			Type mCandleTypeToken = new TypeToken<ArrayList<MinitesCandleVO>>() {}.getType();
//			return new Gson().fromJson(data, mCandleTypeToken);
//		}catch (IOException e) {
//			LOG.debug(e.getMessage());
//		}
//		return null;
//	}
//	
//	public List<TickerVO> getTicker(String markets) {
//		try {
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpGet request = new HttpGet("https://api.upbit.com/v1/ticker?markets=" + markets);
//			request.setHeader("Content-Type", "application/json");
//	
//			HttpResponse response = client.execute(request);
//			HttpEntity entity = response.getEntity();
//	
//			String data = EntityUtils.toString(entity, "UTF-8");
//			
//			LOG.debug("=data="+data);
//			
//			Type tickerType = new TypeToken<ArrayList<TickerVO>>() {}.getType();
//			return new Gson().fromJson(data, tickerType);
//		}catch (IOException e) {
//			LOG.debug(e.getMessage());
//		}
//		return null;
//	}
}
