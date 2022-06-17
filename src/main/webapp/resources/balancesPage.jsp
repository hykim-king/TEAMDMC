<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Html comment -->
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
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

/* 전체 container div */
.container a {
	color: black;
}

.container {
	width: 100%;
	height: calc(100vh - 80px);
	/* padding top> right> bottom> left */
	position: relative;
}

.mainBox {
	width: 90%;
	height: auto;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	/*background : yellow;*/
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
/* 사용자 보유 자산 div */
#userBalancesDiv {
	width: 30%;
	height: 550px;
	border: 1px solid #333;
	box-sizing: border-box;
}

.userTotalBalances {
	width: 85%;
	margin: 0 auto;
	margin-bottom: 20px;
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
}

.userBalancesTableDiv {
	width: 95%;
	margin: 0 auto;
	box-sizing: border-box;
	margin-top: 30px;
}

.userBalancesTable {
	width: 95%;
	margin: 0 auto;
	border: 1px solid gray;
	border-collapse: collapse;
	font-size: 15px;
	text-align: 30px;
}

.uBTBody>tr {
	cursor: pointer;
}

/* 메인 입출금 div */
#mainBalancesDiv {
	width: 30%;
	height: 550px;
	border: 1px solid #333;
	box-sizing: border-box;
}

#mainBalancesDiv input {
	margin-left: 10px;
	height: 30px;
	border: 1px solid #333;
	border-radius: 2px;
	background: white;
}

#mainBalancesDiv label {
	margin-left: 10px;
}

.mainBalancesTab>ul>li {
	border: 1px solid #333;
	box-sizing: border-box;
	cursor: pointer;
	text-align: center;
}
/* 입금/ 출금/ 입출금 내역 컨텐츠 DIV */
/* class=on을 이용하여 div display 변경하기 */
div.on {
	width: 95%;
	margin: 0 auto;
	display: block;
}

.mainBalancesTabContextDivA {
	width: 95%;
	margin: 0 auto;
	display: block;
	border: 1px solid #333;
	box-sizing: border-box;
}

.mainBalancesTabContextDivB, .mainBalancesTabContextDivC {
	width: 95%;
	margin: 0 auto;
	display: none;
	border: 1px solid #333;
	box-sizing: border-box;
}

.mainBalancesTabContextDivAInputDiv, .mainBalancesTabContextDivBInputDiv,
	.mainBalancesTabContextDivCInputDiv {
	width: 95%;
	margin: 0 auto;
	margin-top: 10px;
}

.mainBalancesTabContextDivAWarnning, .mainBalancesTabContextDivBWarnning,
	.mainBalancesTabContextDivCWarnning {
	width: 90%;
	margin: 0 auto;
	margin-top: 20px;
}

.mainBalancesTab {
	width: 95%;
	margin: 0 auto;
	height: 40px;
}

.mainBalancesTab>ul {
	display: flex;
	justify-content: space-around;
}

.mainBalancesTab>ul>li {
	width: 100%;
	list-style: none;
	line-height: 40px;
}

.mainBalancesTab>ul>li>a {
	width: 100%;
	text-align: center;
}

.mainBalancesTitle {
	width: 95%;
	margin: 0 auto;
	margin-top: 20px;
}

.mainBalancesContext {
	width: 95%;
	margin: 0 auto;
	margin-top: 10px;
}

.temp {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.temp:nth-child(1) {
	margin-top: 30px;
}

.temp:nth-child(2) {
	margin-top: 10px;
	margin-bottom: 20px;
}
/* 코인 시세 div */
#coinCharDiv {
	width: 30%;
	height: 550px;
	border: 1px solid #333;
	box-sizing: border-box;
}

td {
	height: 30px;
	border: 1px solid lightgray;
	padding: 0 10px 0 10px;
}

td:nth-child(1) {
	width: 30%;
}

td:nth-child(2) {
	width: 25%;
	text-align: right;
}

td:nth-child(3) {
	width: 45%;
	text-align: right;
}

.contextTop, .contextBottom {
	width: 95%;
	margin: 0 auto;
	display: flex;
	height: 30px;
	align-items: center;
	justify-content: space-between;
}

.contextBottom input {
	width: 300px; height : 30px;
	border: 1px solid #333;
	border-radius: 2px;
	box-sizing: border-box;
	height: 30px;
}
</style>

<title>Insert title here</title>
<!-- reset.css를 직접참조하여 가져오기 
        <link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css"> -->

<!-- jQuery를 직접참조하여 설정 -->
<!-- <script type="text/javascript" src="/studyhtml5/asset/js/jquery-1.12.4.js"></script> -->

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 직접참조하여 favicon설정 -->
<link rel="shortcut icon" type="image/x-icon"
	href="/studyhtml5/favicon.ico">

<!-- 자바스크립트 -->
<script type="text/javascript">
            /* 자바스크립트 코드 */
            $(document).ready(function(){
                console.log('PCWK *** document');
            
                $(".uBTBody tr[id *= 'tr']").click(function(){
                    console.log($(this), "click!");
                    let trLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length-3);
                    
                    console.log("trLastWord: ", $(trLastWord));
                    
                    $('.mainBalancesContextValueDivOwnValue').text(trLastWord);
                    $('.mainBalancesContextValueDivWaitValue').text(trLastWord);
                    console.log("change succed");
                });
                
                /* a태그의 id의 마지막 문자열을 추출하여 원하는 div on */
                $(".mainBalancesTab li[id *= 'mBT']").click(function(){
                    let mBTLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length -1);
                    
                    $('.mainBalancesTabContextDivA').css('display', 'none');
                    $('.mainBalancesTabContextDivB').css('display', 'none');
                    $('.mainBalancesTabContextDivC').css('display', 'none');
                    
                    switch(mBTLastWord){
                    case 'a':
                        /* $('.mainBalancesTabContextDivB').removeClass('on');
                        $('.mainBalancesTabContextDivC').removeClass('on');
                        $('.mainBalancesTabContextDivA').addClass('on'); */
                        $('.mainBalancesTabContextDivA').css('display', 'block');
                        
                        console.log('mainBalancesTabContextDivA의 class에 on추가하기');
                        break;
                        
                    case 'b':
                        /* $('.mainBalancesTabContextDivA').removeClass('on');
                        $('.mainBalancesTabContextDivC').removeClass('on');
                        $('.mainBalancesTabContextDivB').addClass('on'); */
                        $('.mainBalancesTabContextDivB').css('display', 'block');
                        
                        console.log('mainBalancesTabContextDivB의 class에 on추가하기');
                        break;
                        
                    case 'c':
                        /* $('.mainBalancesTabContextDivA').removeClass('on');
                        $('.mainBalancesTabContextDivB').removeClass('on');
                        $('.mainBalancesTabContextDivC').addClass('on'); */
                        $('.mainBalancesTabContextDivC').css('display', 'block');
                        
                        console.log('mainBalancesTabContextDivA의 class에 on추가하기');
                        break;
                        default:
                            console.log("선언되지 않은 div");
                            return;
                    }
                });
            });
        </script>
</head>
<body>
	<!-- header --------------------------------------------------------------->
	<%@include file="header.jsp"%>
	<script type="text/javascript" src="js/header.js"></script>
	<!-- header end ----------------------------------------------------------->

	<!-- div container -------------------------------------------------------->
	<div class="container">

		<!-- mainBox ---------------------------------------------------------->
		<div class="mainBox">
			<!-- userBalancesDiv ---------------------------------------------------->
			<div id="userBalancesDiv">
				<!-- userTotalBalances ------------------------------------------------>
				<div class="userTotalBalances">
					<h3 class="uTB">총 보유 자산</h3>
					<h3 class="uTB">{보유금액}원</h3>
				</div>
				<!-- userTotalBalances end -------------------------------------------->

				<!-- userBalancesDiv -------------------------------------------------->
				<div class="userBalancesTableDiv">
					<!-- userBalances table ------------------------------------------->
					<table class="userBalancesTable">
						<thead>
							<tr>
								<td>코인명</td>
								<td>보유 비율</td>
								<td>보유 수량(평가 금액)</td>
							</tr>
							<tr>
								<td>{코인 이름}</td>
								<td>{보유 비율}</td>
								<td>{보유 수량} {단위}</td>
							</tr>
						</thead>
						<tbody class="uBTBody">

							<tr id="trKRW">
								<td>원화</td>
								<td>12.34%</td>
								<td>10,000 KRW</td>
							</tr>
							<tr id="trBTC">
								<td>BTC</td>
								<td>12.34%</td>
								<td>40.00 BTC</td>
							</tr>
						</tbody>
					</table>
					<!--// userBalances table end ------------------------------------->
				</div>
				<!--// userBalancesDiv end -------------------------------------------->
			</div>
			<!--// userBalancesDiv end ---------------------------------------------->

			<!-- mainBalancesDiv ---------------------------------------------------->
			<div id="mainBalancesDiv">

				<!-- mainBalancesTitleDiv --------------------------------------------->
				<div class="mainBalancesTitleDiv">
					<!-- 해당 mBT 태그 내용은 userBalancesDiv의 userBalances tr요소를 클릭시 선택된 코인에 따라 변경됨 -->
					<h3 class="mainBalancesTitle">KRW 입출금</h3>
				</div>
				<!--// mainBalancesTitleDiv end --------------------------------------->

				<!-- mainBalancesContext ---------------------------------------------->
				<!-- userBalances tr요소 클릭시 선택된 코인에 따라 내용이 변동됨 -------------------->
				<div class="mainBalancesContext">
					<div class="temp">
						<label class="mainBalancesContextValueDivOwn">보유금액</label><label
							class="mainBalancesContextValueDivOwnValue">0 KRW</label>
					</div>
					<div class="temp">
						<label class="mainBalancesContextValueDivWait">거래대기</label><label
							class="mainBalancesContextValueDivWaitValue">0 KRW</label>
					</div>
				</div>
				<!--// mainBalancesContext end ----------------------------------------->

				<!-- mainBalancesTab --------------------------------------------------->
				<div class="mainBalancesTab">
					<ul>
						<li id="mBTa"><a href="#" class="">KRW충전</a></li>
						<li id="mBTb"><a href="#" class="">출금신청</a></li>
						<li id="mBTc"><a href="#" class="">입출금내역</a></li>
					</ul>
				</div>
				<!--// mainBalancesTab end --------------------------------------------------->

				<!-- mainBalancesTabContextDivA ---------------------------------------------->
				<div class="mainBalancesTabContextDivA">

					<!-- mainBalancesTabContextDivAInputDiv ---------------------------------->
					<div class="mainBalancesTabContextDivAInputDiv">
						<div class="contextTop">
							<label>연계계좌</label><label>10*******2332 코리아뱅크</label><label>홍길동</label>
						</div>
						<div class="contextBottom">
							<!-- 아래 placeholder의 값은 선택한 코인에 따라 달라짐 -->
							<label>입금금액</label><input type="text" placeholder="최소 5,000KRW" />
						</div>
					</div>
					<!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

					<div class="mainBalancesTabContextDivAWarnning">입금 주의 사항
						영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.입금 주의 사항
						영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.입금 주의 사항
						영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.입금 주의 사항 영역입니다.</div>
				</div>
				<!--// mainBalancesTabContextDivA end ---------------------------------------->
				<!-- mainBalancesTabContextDivB ---------------------------------------------->
				<div class="mainBalancesTabContextDivB">

					<!-- mainBalancesTabContextDivAInputDiv ---------------------------------->
					<div class="mainBalancesTabContextDivBInputDiv">
						<div class="contextTop">
							<label>연계계좌</label><label>10*******2332 코리아뱅크</label><label>홍길동</label>
						</div>
						<div class="contextBottom">
							<!-- 아래 placeholder의 값은 선택한 코인에 따라 달라짐 -->
							<label>출금금액</label><input type="text" placeholder="최소 5,000KRW" />
						</div>
					</div>
					<!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

					<div class="mainBalancesTabContextDivBWarnning">출금 주의 사항
						영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.출금 주의 사항
						영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.출금 주의 사항
						영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.출금 주의 사항 영역입니다.</div>
				</div>
				<!--// mainBalancesTabContextDivB end ---------------------------------------->
				<!-- mainBalancesTabContextDivC ---------------------------------------------->
				<div class="mainBalancesTabContextDivC">

					<!-- mainBalancesTabContextDivAInputDiv ---------------------------------->
					<div class="mainBalancesTabContextDivAInputDiv">
						<div class="contextTop">
							<label>연계계좌</label><label>10*******2332 코리아뱅크</label><label>홍길동</label>
						</div>
						<div class="contextBottom">
							<!-- 아래 placeholder의 값은 선택한 코인에 따라 달라짐 -->
							<label>입금금액</label><input type="text" placeholder="최소 5,000KRW" />
						</div>
					</div>
					<!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

					<div class="mainBalancesTabContextDivAWarnning">입출금 영역입니다~
						입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~
						입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~ 입출금 영역입니다~
					</div>
				</div>
				<!--// mainBalancesTabContextDivC end ---------------------------------------->
			</div>
			<!--// mainBalancesDiv end ----------------------------------------------------->

			<!-- coinChartDiv -------------------------------------------------------------->
			<div id="coinCharDiv">
				<h3>코 인 시 세 영 역</h3>
			</div>
			<!-- coinChartDiv end --------------------------------------------------------->
		</div>
		<!-- mainBox end -------------------------------------------------------->
	</div>
	<!--// div container end -------------------------------------------------------->

	<!-- footer --------------------------------------------------------------------->
	<%@include file="footer.jsp"%>
	<!-- footer end --------------------------------------------------------------------->
</body>
</html>
