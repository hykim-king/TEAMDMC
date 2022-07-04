package com.teamdmc.kemie.cmn;

import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

public class JwtTokenMaker {
	final Logger LOG = LogManager.getLogger(getClass());
	
	private String accessKey = "업비트 엑세스키";
	private String secretKey = "업비트 시크릿키";
	
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
}