<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="/studyhtml5/favicon (3).ico">

<!--reset 스타일 시트 -->
<!--<link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css">  -->
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<!--스타일 시트 -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

</style>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

#wrap {
	width: 100%;
	height: calc(100vh - 80px);
	position: relative;
}

.txtbox {
	width: 500px;
	height: 630px;
	font-size: 16px;
	margin: 0 auto;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.txtbox h1 {
	margin-bottom: 20px;
}

.box {
	width: 100%;
	height: 80px;
}

.box input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.box label {
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
	text-align: left;
}

.msgErr1, .msgErr2, .msgErr3 {
	color: #37385d;
	margin-top: 0;
	text-align: left;
	margin-left: 100px;
	font-size: 13px;
}

.gaib {
	width: 100%;
	height: 50px;
	text-align: center;
	margin-top: 20px;
}

.gaib input {
	width: 90px;
	height: 50px;
	margin: 0 auto;
	border: 1px solid #333;
	background: white;
	border-radius: 2px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="${CP_RES}/js/header.js"></script>
	<!-- 내용 -->
	<div id="wrap">
		<div class="txtbox">
			<h1>회원가입</h1>
			<!-- id -->
			<div class="box">
				<label for="id">아이디</label> <input id="id" type="text"
					placeholder="아이디를 입력하세요">
				<p class="msgErr1">아이디 베리데이션 노출 영역.</p>
			</div>
			<!-- id ------------------------------------------------------->
			<!-- passwd -->
			<div class="box">
				<label for="password">비밀번호</label> <input id="password"
					type="password" placeholder="비밀번호를 입력하세요">
				<p class="msgErr2">비밀번호 베리데이션 노출 영역.</p>
			</div>
			<!-- passwd --------------------------------------------------->
			<!-- passwdCheck -->
			<div class="box">
				<label for="pwcheck">비밀번호 확인</label> <input id="pwcheck"
					type="password" placeholder="비밀번호를 다시 입력하세요">
				<p class="msgErr3">비밀번호 베리데이션 노출 영역.</p>
			</div>
			<!-- passwdCheck ---------------------------------------------->
			<!-- name -->
			<div class="box">
				<label for="name">이름</label> <input id="name" type="text"
					placeholder="이름을 입력해주세요">
			</div>
			<!-- name ----------------------------------------------------->
			<!-- cell -->
			<div class="box">
				<label for="phone">휴대폰번호</label> <input id="phone" type="text"
					placeholder="휴대폰번호를 입력해주세요">
			</div>
			<!-- cell ----------------------------------------------------->
			<!-- nickName -->
			<div class="box">
				<label for="nickname">닉네임</label> <input id="nickname" type="text"
					placeholder="닉네임을 입력해주세요">
			</div>
			<!-- nickName ------------------------------------------------->
			<!-- button -->
			<div class="gaib">
				<input type="button" value="회원가입">
			</div>
			<!-- button --------------------------------------------------->
		</div>

	</div>

	<%@include file="footer.jsp" %>
	<!-- 내용 ----------------------------------------------------------->
	<!--자바스크립트 코드 -->
	<script type="text/javascript">
    $(document).ready(function(){
   
     });   
</script>
</body>
</html>