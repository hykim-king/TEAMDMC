package com.teamdmc.kemie.userinterested.domain;

import com.teamdmc.kemie.cmn.DTO;

public class UserInterestedVO extends DTO{
	private int uicIndex;      // 관심 암호화폐 인덱스
	private String uicMarket; // 거래 대상 암호화폐 한글명
	private String uicNowPrice; // 거래 대상 암호화폐 영문명
	private String uicToFixed; // 거래 대상 암호화폐 한글명
	private String uicPrice24h; // 거래 대상 암호화폐 영문명
	private String uId;        // 회원 ID
	
	public UserInterestedVO() {}

	public UserInterestedVO(int uicIndex, String uicMarket, String uicNowPrice, String uicToFixed,String uicPrice24h, String uId) {
		super();
		this.uicIndex = uicIndex;
		this.uicMarket = uicMarket;
		this.uicNowPrice = uicNowPrice;
		this.uicToFixed = uicToFixed;
		this.uicPrice24h = uicPrice24h;
		this.uId = uId;
	}

	public int getUicIndex() {
		return uicIndex;
	}

	public void setUicIndex(int uicIndex) {
		this.uicIndex = uicIndex;
	}

	public String getUicMarket() {
		return uicMarket;
	}

	public void setUicMarket(String uicMarket) {
		this.uicMarket = uicMarket;
	}

	public String getUicNowPrice() {
		return uicNowPrice;
	}

	public void setUicNowPrice(String uicNowPrice) {
		this.uicNowPrice = uicNowPrice;
	}

	public String getUicToFixed() {
		return uicToFixed;
	}

	public void setUicToFixed(String uicToFixed) {
		this.uicToFixed = uicToFixed;
	}

	public String getUicPrice24h() {
		return uicPrice24h;
	}

	public void setUicPrice24h(String uicPrice24h) {
		this.uicPrice24h = uicPrice24h;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}


	@Override
	public String toString() {
		return "UserInterestedVO [uicIndex=" + uicIndex + ", uicMarket=" + uicMarket + ", uicNowPrice=" + uicNowPrice + ", uicToFixed=" + uicToFixed + ", uicPrice24h=" + uicPrice24h
				+ ", uId=" + uId + ", toString()=" + super.toString() + "]";
	}
}