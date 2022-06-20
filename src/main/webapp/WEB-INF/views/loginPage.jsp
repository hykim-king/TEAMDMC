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
<link rel="shortcut icon" type="image/x-icon"
	href="/studyhtml5/favicon.ico">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css"> -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<!--스타일 시트 -->
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

.LoginFrm {
	width: 90%;
	height: 400px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.loginbox {
	width: 60%;
	height: auto;
	margin: 0 auto;
}

.idbox {
	width: 500px;
	margin: 0 auto;
	margin-top: 20px;
}

.idbox input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.idbox label {
	text-align: left;
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
}

.msgErr1, .msgErr2 {
	color: #37385d;
	margin-top: 0;
	text-align: left;
	margin-left: 100px;
	font-size: 13px;
}

.pwbox {
	width: 500px;
	margin: 0 auto;
	margin-top: 20px;
}

.pwbox input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.pwbox label {
	text-align: left;
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
}

.bt {
	width: 300px;
	display: flex;
	justify-content: space-around;
	margin: 0 auto;
	padding-top: 20px;
}

.bt button {
	background: white;
	border: 1px solid #333;
	border-radius: 2px;
	width: 100px;
	height: 30px;
}
</style>

<title>Insert title here</title>

</head>

<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="${CP_RES}/js/header.js"></script>
	<div id="wrap">
		<form action="#" class="LoginFrm">

			<h1>로그인</h1>
			<div class="loginbox">
				<div class="idbox">
					<label for="id">아이디</label> <input id="id" type="text"
						placeholder="아이디를 입력하세요">
					<p class="msgErr1">아이디를 입력하세요.</p>
				</div>
				<div class="pwbox">
					<label for="password">비밀번호</label> <input id="password"
						type="password" placeholder="비밀번호를 입력하세요">
					<p class="msgErr2">아이디 또는 비밀번호를 잘못 입력했습니다.</p>
				</div>
			</div>

			<div class="bt">
				<button id="btnForgetPw">비밀번호찾기</button>
				<button id="btnLogin">로그인</button>
			</div>

		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>