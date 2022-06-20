<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>
<!--html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- reset 스타일 시트-->
<!--<link rel="stylesheet" type="text/css" href="/stutyhtml5/asset/css/reset.css">-->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<!--스타일시트 -->
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

#wrap {
	width: 100%;
	height: calc(100vh - 80px);
	margin-top: 20px;
}

.top {
	width: 90%;
	height: 100px;
	margin: 0 auto;
	position: relative;
}

.search {
	width: 150px;
	height: 43px;
	text-align: center;
	box-sizing: border-box;
	border: 1px solid lightgray;
	margin-right: 10px;
}

.textbox {
	width: 250px;
	height: 43px;
	box-sizing: border-box;
	border: 1px solid lightgray;
	margin-right: 10px;
}

.scbox {
	position: absolute;
	right: 0;
	top: 10px;
}

.faq {
	height: 45px;
	width: 100px;
	line-height: 45px;
	font-size: 25px;
	position: absolute;
	left: 0;
	top: 10px;
}

.bt {
	height: 45px;
	width: 100px;
	line-height: 45px;
	color: #fff;
	font-size: 15px;
	background-color: #0062df;
	border-radius: 2px;
	box-sizing: border-box;
	border: none;
}

.board {
	width: 90%;
	height: auto;
	margin: 0 auto;
}

table, td, th {
	border-collapse: collapse;
}

table {
	border-spacing: 0;
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
}

td, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

tr {
	border-top: 1px solid lightgray;
	height: 30px;
}

.paging {
	width: 90%;
	margin: 0 auto;
	text-align: center;
	padding-top: 10px;
}

.paging p {
	cursor: pointer;
}
</style>

<title>Insert title here</title>

<!-- jQuery local server에서 접근 -->
<script type="text/javascript"
	src="/stutyhtml5/asset/js/jquery-1.12.4.js"></script>

</head>

<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="${CP_RES}/js/header.js"></script>
	<!-- 전체 박스 시작 -->
	<div id="wrap">
		<!-- 글쓰기, 검색영역 -->
		<div class="top">
			<div class="faq">
				<h3>FAQ</h3>
			</div>
			<!-- 검색영역 div -->
			<div class="scbox">
				<select class="search" name="search">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="tico">제목 + 내용</option>
				</select> <input type="text" class="textbox" placeholder="  검색어를 입력해주세요.">
				<input type="submit" class="bt" value="검색">
			</div>
			<!-- 검색영역 div 끝 -->
		</div>
		<!-- 글쓰기, 검색영역 끝 -->
		<!-- 게시판 목록 영역 -->
		<table class="board">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>제목 예시입니다.</td>
					<td>작성자</td>
					<td>2022.06.06</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>제목 예시입니다.2</td>
					<td>작성자</td>
					<td>2022.06.06</td>
					<td>1</td>
				</tr>
				<tr>
					<td>3</td>
					<td>제목 예시입니다.3</td>
					<td>작성자</td>
					<td>2022.06.06</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
		<!-- 게시판 목록 끝 -->
		<!-- 페이징 영역 -->
		<div class="paging">
			<p>< 1 2 3 4 5 6 7 8 9 10 ></p>
		</div>
		<!-- 페이징 끝 -->
	</div>
	<!-- 전체영역 끝 -->

	<%@include file="footer.jsp" %>
</body>

<!--자바스크립트 코드-->
<script type="text/javascript">
  $(document).ready(function(){
	  
	  console.log('yunam *** document');
  });
</script>
</html>