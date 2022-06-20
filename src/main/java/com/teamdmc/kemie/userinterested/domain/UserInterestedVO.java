package com.teamdmc.kemie.userinterested.domain;

import com.teamdmc.kemie.cmn.DTO;

public class UserInterestedVO extends DTO{
	private int uicIndex;      // 관심 암호화폐 인덱스
	private String uicNameKor; // 거래 대상 암호화폐 한글명
	private String uicNameEng; // 거래 대상 암호화폐 영문명
	private String uId;        // 회원 ID
	
	public UserInterestedVO() {}

	public UserInterestedVO(int uicIndex, String uicNameKor, String uicNameEng, String uId) {
		super();
		this.uicIndex = uicIndex;
		this.uicNameKor = uicNameKor;
		this.uicNameEng = uicNameEng;
		this.uId = uId;
	}

	public int getUicIndex() {
		return uicIndex;
	}

	public void setUicIndex(int uicIndex) {
		this.uicIndex = uicIndex;
	}

	public String getUicNameKor() {
		return uicNameKor;
	}

	public void setUicNameKor(String uicNameKor) {
		this.uicNameKor = uicNameKor;
	}

	public String getUicNameEng() {
		return uicNameEng;
	}

	public void setUicNameEng(String uicNameEng) {
		this.uicNameEng = uicNameEng;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "UserInterestedVO [uicIndex=" + uicIndex + ", uicNameKor=" + uicNameKor + ", uicNameEng=" + uicNameEng
				+ ", uId=" + uId + ", toString()=" + super.toString() + "]";
	}
}