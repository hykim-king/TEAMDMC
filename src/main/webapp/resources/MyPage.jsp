<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<!-- 스타일 시트 -->
<style type="text/css">
/* 스타일 시트 */
/* 각 태그 별 margin 값 */
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

/* 전체 container div */
.container {
	width: 100%;
	height: calc(100vh - 80px);
	position: relative;
	background: white;

	/* padding top> right> bottom> left */
}

.box {
	width: 90%;
	height: auto;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.page-header {
	width: 100%;
	text-align: center;
	margin-bottom: 50px;
}

.page-header h1 {
	font-size: 45px;
	font-weight: border;
}

#wrap {
	display: flex;
	margin: 0 auto;
	width: 100%;
	height: auto;
	justify-content: space-between;
}

/* 개인 정보 관리 div */
#userInfoDiv {
	width: 35%;
	height: 400px;
	border: 1px solid #333; box-sizing : border-box;
	padding: 15px 0 0 15px;
	box-sizing: border-box;
}

/* 내 소식 div */
#userNewsDiv {
	width: 63%;
	height: 400px;
	border: 1px solid #333; box-sizing : border-box;
	padding: 15px 15px 0px 15px;
	box-sizing: border-box;
}

#userInfoDiv .btn {
	border: 1px solid #333;
	border-radius: 2px;
	width: 100px;
	height: 30px;
	line-height: 30px;
	background: white;
	margin-top: 15px;
}

h3 {
	margin-bottom: 20px;
}
</style>

<title>Insert title here</title>
<!-- reset.css를 직접참조하여 가져오기 
			<link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css"> -->

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 직접참조하여 favicon설정 -->
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml5/favicon.ico">

<!-- 자바스크립트 -->
<script type="text/javascript">
			/* 자바스크립트 코드 */
			$(document).ready(function(){
				console.log('PCWK *** document');
				
				
				/* https://zetawiki.com/wiki/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8_onclick_%EC%9D%B4%EB%B2%A4%ED%8A%B8
					script에 function을 만들고, button에 onclick으로 해당 메소드 실행 방식으로 구현*/
				$("button[id*='Change']").click(function(){
					let btnId = $(this).attr("id");
					
					if(btnId.includes('nick')){
						let input = prompt('변경할 닉네임을 입력하세요.');
						
						alert(`당신이 변경할 닉네임은 ${input}입니다.`);
					} else if(btnId.includes('pw')){
						let input = prompt('변경할 비밀번호을 입력하세요.');
						
						alert(`당신이 변경할 닉네임은 ${input}입니다.`);
					} 
				});
			});
		</script>
</head>
<body>
	<!-- header --------------------------------------------------------------->
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="js/header.js"></script>
	<!-- header end ----------------------------------------------------------->
	<!-- div container -------------------------------------------------------->
    <div class="container">

		<div class="box">
			<!-- mainTitle ---------------------------------------------------------->
			<div class="page-header" id="mainTitle">
				<h1>마이페이지</h1>
			</div>
			<!-- mainTitle end ------------------------------------------------------>
			<!-- wrapDiv ------------------------------------------------------------>
			<div id="wrap">
				<!-- userInfoDiv -------------------------------------------------------->
				<div id="userInfoDiv">
					<h3>개인 정보 관리</h3>
					<p class="userInfo_Name">{사용자 이름} 님</p>

					<!-- Button ----------------------------------------------------------->
					<form action="#">
						<button id="nickChange" class="btn nickChange">닉네임 변경</button>
						<br />
						<button id="pwChange" class="btn pwChange">비밀번호 변경</button>
						<br />
						<button class="btn myPost">내 글 보기</button>
						<br />
					</form>
					<!--// Button end ----------------------------------------------------->

				</div>
				<!--// userInfoDiv end -------------------------------------------------->

				<!-- userNewsDiv -------------------------------------------------------->
				<div id="userNewsDiv">
					<h3>내 소식</h3>
					<!-- 의문점: 1. 암호 화페명 뒤에 얼마나 거래 됐는지.. 개수가 x...
			               ex) 비트코인 <<12.3>>개가 체결 되었씁니다.
			               
			               2. 알림의 종류가 정확히 뭔지 모르겠음... 거래 체결 알림만 있는 건지,,, 그 외 알림도 있는 건지..?
			    -->
					<label class="userNewsContext">{거래 상태} 알림 - {거래 대상 암호 화폐명}
						{거래 결과}가 체결되었습니다. ({거래 체결가})</label> <label class="userNewsTime">{알림
						시간 형식: YYYY-MM-DD HH:mm}</label><br /> <label class="userNewsContext">거래
						체결 알림 - 비트코인 매수가 체결되었습니다. (1234.1234)</label> <label class="userNewsTime">2022-06-06
						00:00</label><br /> <label class="userNewsContext">거래 체결 알림 - 비트코인
						매도가 체결되었습니다. (1234.1234)</label> <label class="userNewsTime">2022-06-06
						00:00</label><br />
				</div>
				<!--// userNewsDiv end -------------------------------------------------->
			</div>
			<!--// wrap end ----------------------------------------------------------->
		</div>
	<!--// div container end -------------------------------------------------->
	</div>
	<!-- footer ------------------------------------------------------------->
		<%@include file="footer.jsp" %>
		<!-- footer end --------------------------------------------------------->
	
</body>
</html>