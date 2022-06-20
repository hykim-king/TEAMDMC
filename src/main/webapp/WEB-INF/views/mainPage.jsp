<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="/studyhtml5/favicon.ico">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
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

.box {
	width: 90%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#coinGraph {
	width: 100%;
	height: 500px;
	margin: 0 auto;
}

.graphBox {
	margin-top: 20px;
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.graph {
	width: 30%;
	height: 200px;
	background: turquoise;
	border: 1px solid #333;
}

#coinNews {
	width: 100%;
	height: 200px;
	margin: 0 auto;
	border: 1px solid #333;
	margin-top: 30px;
}

#coinNews h2 {
	margin-top: 10px;
	margin-left: 10px;
}

.newsArea .newsone {
	display: flex;
	width: 90%;
	justify-content: space-between;
	margin: 0 auto;
	margin-top: 10px;
}
</style>
<title>Insert title here</title>

</head>


<body>
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="js/header.js"></script>
	<!-- 전체 div======================================================================== -->
	<div id="wrap">
		<div class="box">
			<!-- 주요 코인 시세=========================== -->
			<div id="coinGraph">
				<h2>주요 코인 시세</h2>
				<!-- 코인 그래프 박스 영역=========== -->
				<div class="graphBox">
					<div class="graph">1</div>
					<div class="graph">2</div>
					<div class="graph">3</div>
				</div>
				<div class="graphBox">
					<div class="graph">4</div>
					<div class="graph">5</div>
					<div class="graph">6</div>
				</div>
				<!-- //코인 그래프 박스 영역=========== -->
			</div>
			<!-- //주요 코인 시세=========================== -->

			<!-- 코인 뉴스=========================== -->
			<div id="coinNews">
				<h2>코인 뉴스</h2>
				<!-- div는 화면의 가로 전체를 사용, span은 콘텐츠만큼만 공간을 차지 -->
				<div class="newsArea">
					<div class="newsone">
						<p>코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.</p>
						<span>2022.06.09</span>
					</div>
					<div class="newsone">
						<p>코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.</p>
						<span>2022.06.09</span>
					</div>
					<div class="newsone">
						<p>코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.코인 뉴스 제목 영역입니다.</p>
						<span>2022.06.09</span>
					</div>
				</div>
			</div>
			<!-- //코인 뉴스=========================== -->
		</div>
	</div>
	<!-- //전체 div======================================================================== -->
	<%@include file="footer.jsp" %>

</body>
</html>