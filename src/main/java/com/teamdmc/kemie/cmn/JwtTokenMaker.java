package com.teamdmc.kemie.cmn;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;


public class JwtTokenMaker {
	final Logger LOG = LogManager.getLogger(getClass());
	
	private String accessKey = "B4HUUTutJxxUHJQDOBEASi2MiZ6xqGQXzxmAVg9A";
	private String secretKey = "Q4j8cxN4mawHKnxcuebmACbzTAxMS6LJrKbYsoxP";
	
	public String jwtTokenMaker() {
		if(accessKey.length() == 40 && secretKey.length() == 40) {
			Algorithm algorithm = Algorithm.HMAC256(secretKey);
			String jwtToken = JWT.create()
					.withClaim("access_key", accessKey)
					.withClaim("nonce", UUID.randomUUID().toString())
					.sign(algorithm);
			String authenticationToken = "Bearer " + jwtToken;
			
			return authenticationToken;
		} else return "토큰 키가 부정확합니다!";
	}
	
//	public String testToken() throws NoSuchAlgorithmException, UnsupportedEncodingException {
//		HashMap<String, String> params = new HashMap<>();
////      params.put("uuid", UUID.randomUUID().toString());
////      params.put("txid", TXID.ran);
//      params.put("currency", "KRW");
//
//      ArrayList<String> queryElements = new ArrayList<>();
//      for(Map.Entry<String, String> entity : params.entrySet()) {
//          queryElements.add(entity.getKey() + "=" + entity.getValue());
//      }
//
//      String queryString = String.join("&", queryElements.toArray(new String[0]));
//
//      MessageDigest md = MessageDigest.getInstance("SHA-512");
//      md.update(queryString.getBytes("UTF-8"));
//
//      String queryHash = String.format("%0128x", new BigInteger(1, md.digest()));
//
//      Algorithm algorithm = Algorithm.HMAC256(secretKey);
//      String jwtToken = JWT.create()
//              .withClaim("access_key", accessKey)
//              .withClaim("nonce", UUID.randomUUID().toString())
//              .withClaim("query_hash", queryHash)
//              .withClaim("query_hash_alg", "SHA512")
//              .sign(algorithm);
//
//      String authenticationToken = "Bearer " + jwtToken;
//      System.out.println("토큰토큰"+authenticationToken);
//      System.out.println("토큰토큰"+authenticationToken);
//      System.out.println("토큰토큰"+authenticationToken);
//      System.out.println("토큰토큰"+authenticationToken);
//      System.out.println("토큰토큰"+authenticationToken);
//      
//      return authenticationToken;
//	}
	
	public String depositAndPostKRW(String filedName, String amount) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		if(accessKey.length() == 40 && secretKey.length() == 40) {
			ArrayList<String> queryElements = new ArrayList<>();
			
	        for(Map.Entry<String, String> entity : paramsHashMap(filedName, amount).entrySet()) {
	            queryElements.add(entity.getKey() + "=" + entity.getValue());
	        }
			
	        String queryString = String.join("&", queryElements.toArray(new String[0]));
	        
	        MessageDigest md = MessageDigest.getInstance("SHA-512");
	        md.update(queryString.getBytes("UTF-8"));
	        
	        String queryHash = String.format("%0128x", new BigInteger(1, md.digest()));
	        
			Algorithm algorithm = Algorithm.HMAC256(secretKey);
			String jwtToken = JWT.create()
					.withClaim("access_key", accessKey)
					.withClaim("nonce", UUID.randomUUID().toString())
	                .withClaim("query_hash", queryHash)
	                .withClaim("query_hash_alg", "SHA512")
					.sign(algorithm);
			
			String authenticationToken = "Bearer " + jwtToken;
			
			return authenticationToken;
		} else return "토큰 키가 부정확합니다!";
	}
	
	public HashMap<String, String> paramsHashMap(String filedName, String amount) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put(filedName, amount);
		
		return params;
	}
}