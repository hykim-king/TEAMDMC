package com.pcwk.ehr;

public class UserVO extends DTO{
	
// Level을 Enum을 이용하여 설계
//	   개발을 진행할때 Enum을 통해 얻는 기본적인 장점들은 아래와 같습니다.
//
//	  1. 문자열과 비교해, IDE의 적극적인 지원을 받을 수 있습니다.
//	  2. 자동완성, 오타검증, 텍스트 리팩토링 등등
//	  3. 허용 가능한 값들을 제한할 수 있습니다.
//	  4. 리팩토링시 변경 범위가 최소화 됩니다.
//	  5. 내용의 추가가 필요하더라도, Enum 코드외에 수정할 필요가 없습니다.
	
	
	private String uId;    // 사용자 id
	private String name;   // 사용자 이름
	private String passwd; // 사용자 비밀번호
	
	private Level level;   // 등급: 1 -> BASIC, 2 -> SILVER, 3 -> GOLD
	private int login;     // 로그인
	private int recommend; // 추천 수
	private String email;  // 이메일
	private String regDt;  // 등록일
	
	public UserVO() {}

	public UserVO(String uId, String name, String passwd, Level level, int login, int recommend, String email, String regDt) {
		super();
		this.uId = uId;
		this.name = name;
		this.passwd = passwd;
		this.level = level;
		this.login = login;
		this.recommend = recommend;
		this.email = email;
		this.regDt = regDt;
	}

	public int getLogin() {
		return login;
	}

	public void setLogin(int login) {
		this.login = login;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Override
	public String toString() {
		return "UserVO [uId=" + uId + ", name=" + name + ", passwd=" + passwd + ", level=" + level + ", login=" + login
				+ ", recommend=" + recommend + ", email=" + email + ", regDt=" + regDt + ", toString()="
				+ super.toString() + "]";
	}
}