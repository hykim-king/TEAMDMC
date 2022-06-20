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
	href="/studyhtml5/favicon (3).ico">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<!--reset 스타일 시트 -->
<!--<link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css">  -->
<!--스타일 시트 -->
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css"><style type="text/css">
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

.box {
	width: 90%;
	height: 700px;
	font-size: 16px;
	margin: 0 auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.bu {
	width: 90%;
	height: 50px;
	text-align: right;
	margin: 0 auto;
	display: flex;
	align-items: center;
	justify-content: right;
}

.bu button {
	width: 50px;
	height: 30px;
	border: 1px solid #333333;
	background: white;
	border-radius: 2px;
	margin-left: 10px;
}

.titlebox {
	width: 100%;
	height: 70px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.titlebox input {
	height: 40px;
	width: 90%;
	border: none;
	border-bottom: 1px solid #333;
	font-size: 15px;
}

.writebox {
	width: 90%;
	background: skyblue;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.writebox textarea {
	height: 400px;
	width: 100%;
	border: 1px solid #333;
}

.filebox {
	width: 90%;
	height: 40px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

#fileadd {
	width: 88%;
	height: 40px;
	border: 1px solid #333;
	border-radius: 2px;
	box-sizing: border-box;
}

#addbt {
	width: 10%;
	height: 40px;
	border: 1px solid #333;
	border-radius: 2px;
	box-sizing: border-box;
}

#wrap a {text-decoration: none; color: black;}
</style>
<title>Insert title here</title>

<!--jquery-->
<script type="text/javascript"
	src="/studyhtml5/asset/js/jquery-1.12.4.js"></script>


</head>
<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="${CP_RES}/js/header.js"></script>
	<!-- 내용 -->
	<div id="wrap">
		<div class="box">
			<!-- button -->
			<div class="bu">
			    <button type="button"><a href="board.do">목록</a></button>
				<button type="button"><a href="#">등록</a></button>
			</div>
			<!-- button -------------------------------------------------->
			<div class="titlebox">
				<!-- title -->
				<input type="text" id="title" placeholder="제목을 입력하세요">
			</div>
			<!-- title -------------------------------------------------->
			<!-- contents -->
			<div class="writebox">
				<textarea name="contents" id="contents"></textarea>
			</div>
			<!-- contents ----------------------------------------------->
			<!-- fileAdd -->
			<div class="filebox">
				<input type="text" id="fileadd" placeholder="첨부하실 파일을 선택하세요">
				<input type="button" id="addbt" value="첨부">
			</div>
			<!-- fileAdd ------------------------------------------------>
		</div>
	</div>
	<!-- 내용 ----------------------------------------------------------->
	<%@include file="footer.jsp" %>
	<!--자바스크립트 코드 -->

	<!--자바스크립트 코드 -->
	<script type="text/javascript">
    $(document).ready(function(){
    
    	
     });   
</script>
</body>
</html>