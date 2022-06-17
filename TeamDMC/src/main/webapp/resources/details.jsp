<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="keywords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>

<!--스타일 시트 -->
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

#all {
	width: 90%;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

.buttonDiv {
	width: 90%;
	height: 50px;
	margin: 0 auto;
	display: flex;
	align-items: center;
	justify-content: right;
}

.buttonDiv .btn {
	width: 50px;
	height: 30px;
	border: 1px solid #333333;
	background: white;
	border-radius: 2px;
	margin-left: 10px;
}

.main {
	width: 90%;
	border: 1px solid #333;
	box-sizing: content-box;
	height: 500px;
	margin: 0 auto;
}

.boardTitle {
	width: 90%;
	height: 70px;
	line-height: 70px;
	border-bottom: 1px solid #333;
	box-sizing: content-box;
	margin: 0 auto;
}

.boardMulti {
	width: 90%;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
	font-size: 10px;
	display: flex;
}

.boardMulti p {
	font-weight: bold;
	margin-right: 5px;
}

.boardMulti span {
	margin-right: 15px;
}

.boardContent {
	width: 90%;
	box-sizing: content-box;
	margin: 0 auto;
	height: 320px;
	padding-top: 20px;
}

.commentsList {
	width: 90%;
	box-sizing: content-box;
	margin: 0 auto;
	height: 150px;
	border: 1px solid #333;
	box-sizing: content-box;
	margin-top: 20px;
}

.commentOne {
	width: 90%;
	height: 40px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 5px;
	border-bottom: 1px solid #dedede;
}

.commentOne li {
	list-style: none;
	line-height: 40px;
}

.commentsList .nic {
	width: 10%;
	font-size: 15px;
}

.commentsList .reply {
	width: 65%;
	font-size: 15px;
}

.commentsList .commentsDate {
	width: 15%;
	font-size: 15px;
}

#replyRemove {
	width: 40px;
	height: 20px;
	border: 1px solid #333;
	border-radius: 2px;
	background: white;
	font-size: 12px;
	line-height: 20px;
}

.commentsMain {
	width: 90%;
	border: 1px solid #333;
	box-sizing: content-box;
	margin: 0 auto;
	height: 200px;
	margin-top: 20px;
}

.comments {
	width: 90%;
	margin: 0 auto;
	height: 50px;
	line-height: 50px;
}

.commentsbox {
	width: 90%;
	height: 130px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

#replytext {
	width: 87%;
}

#btnReply {
	width: 10%;
}
</style>

<title>Insert title here</title>
<!--자바스크립트 코드 -->
<script type="text/javascript">
</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="js/header.js"></script>
	<!-- main div 열림 -->
	<div id="all">
		<form action="">
			<!-- 버튼으로 목록 수정 삭제 만들기 -->
			<div class="buttonDiv">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
			</div>
			<!-- 버튼으로 목록 수정 삭제 종료 -->
			<!-- 제목,작성시간,조회수,작성자,내용 -->
			<div class="main">
				<!-- 제목 -->
				<div class="boardTitle">
					<table class="boardView">
						<tr>
							<td>제목입니다. 제목 영역입니다.</td>
						</tr>
					</table>
				</div>
				<!-- 제목 끝 -->
				<!-- 멀티 -->
				<div class="boardMulti">
					<p>등록일</p>
					<span>2022.06.11</span>
					<p>작성자</p>
					<span>홍길동</span>
					<p>조회수</p>
					<span>1</span>
				</div>
				<!-- 멀티 끝 -->

				<!-- 내용 -->
				<div class="boardContent">
					<p>내용입니다. 내용 영역입니다.</p>
					<p>내용은 이렇게 보여집니다.</p>
				</div>
				<!-- 내용 끝 -->
			</div>
			<!-- main div끝 -->
		</form>
		<!-- 폼 끝 -->

		<!-- 댓글 목록 -->
		<div class="commentsList">
			<ul class="commentOne">
				<li class="nic">홍길동</li>
				<li class="reply">댓글입니다. 댓글은 이렇게 보여집니다.</li>
				<li class="commentsDate">2022.06.12</li>
				<li><button type="button" id="replyRemove">삭제</button></li>
			</ul>
			<ul class="commentOne">
				<li class="nic">홍길동</li>
				<li class="reply">댓글입니다. 댓글은 이렇게 보여집니다.</li>
				<li class="commentsDate">2022.06.12</li>
				<li><button type="button" id="replyRemove">삭제</button></li>
			</ul>
			<ul class="commentOne">
				<li class="nic">홍길동</li>
				<li class="reply">댓글입니다. 댓글은 이렇게 보여집니다.</li>
				<li class="commentsDate">2022.06.12</li>
				<li><button type="button" id="replyRemove">삭제</button></li>
			</ul>
		</div>
		<!-- 댓글 목록 끝 -->
		<!-- 댓글 작성 -->
		<div class="commentsMain">
			<div class="comments">
				<strong>댓글 작성</strong>
			</div>
			<div class="commentsbox">
				<textarea id="replytext" placeholder="댓글내용을 입력하세요"></textarea>
				<button type="button" id="btnReply">등록</button>
			</div>
		</div>
		<!-- 댓글 작성 끝 -->
	</div>
	<!-- main div 닫음 -->
	<%@include file="footer.jsp" %>
</body>
</html>