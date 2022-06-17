<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="keywords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<!--스타일 시트 -->
<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
@import
    url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
    ;
</style>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
}
li a {
    color: black;
    text-decoration: none;
}
input {
	color: black;
    text-decoration: none;
}
#wrap {
    width: 100%;
    height: 100vh;
    background: yellow;
    position: relative;
}
.mainExchangeTabContextDivB, .mainExchangeTabContextDivC{
    display: none;
}
.orderBreakdownContextDivBInputDiv{
	display: none;
}
.orderBreakdownContextDivDInputDiv{
	display: none;
}
.mainExchangeTabContextDivCaVote{
	display: none;
}
.main {
    width: 90%;
    border: 1px solid #333;
    box-sizing: content-box;
    height: 660px;
    background: orange;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    top: 50%;
}
.topbox {
    width: 100%;
    display: flex;
    justify-content: space-between;
    height: 320px;
}
.graph {
    width: 63%;
    border: 1px solid #333;
}
.coinPrice {
    width: 32%;
    border: 1px solid #333;
    overflow: scroll;
}
.bottombox {
    width: 100%;
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    height: 320px;
}
.realTransaction {
    width: 29%;
    border: 1px solid #333;
}
.sellBuy {
    width: 29%;
    border: 1px solid #333;
}
.mETbox {
    width: 100%;
    background: blue;
    display: flex;
    height: 40px;
}
.mETbox li {
    list-style: none;
    flex: 1;
    text-align: center;
    line-height: 40px;
    border: 1px solid #333;
}
.interestCoin {
    width: 32%;
    border: 1px solid #333;
    overflow: scroll;
}
label {
    margin-right: 8px;
}
.sellBuy input {
    border: 1px solid #333;
    border-radius: 2px;
    background: white;
    height: 30px;
}
.anOpenVote{
	border: 1px solid black; 
}
.aVote{
	border: 1px solid black; 
}
</style>
<title>Insert title here</title>
<!--자바스크립트 코드 -->
<script type="text/javascript">
    $(document).ready(function() { /* a태그의 id의 마지막 문자열을 추출하여 원하는 div on */
    	$(".mainExchangeTab li[id *= 'mET']").click(function() {
	    	let mETLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length - 1);
	    	
	    	$('.mainExchangeTabContextDivA').css('display', 'none');
	        $('.mainExchangeTabContextDivB').css('display', 'none');
	        $('.mainExchangeTabContextDivC').css('display', 'none');
	        switch (mETLastWord) {
		    	case 'a':
		        	$('.mainExchangeTabContextDivA').css('display', 'block');
		            console.log('mainExchangeTabContextDivA의 class에 on추가하기');
		            break;
		        case 'b':
		            $('.mainExchangeTabContextDivB').css('display', 'block');
		            console.log('mainExchangeTabContextDivB의 class에 on추가하기');
		            break;
		        case 'c':
		            $('.mainExchangeTabContextDivC').css('display', 'block');
		            console.log('mainExchangeTabContextDivC의 class에 on추가하기');
		            break;
		        default:
		            console.log("선언되지 않은 div");
		            return;
			}
		});
    	$(".orderBreakdownA [id *= 'oB']").click(function() {
    		let oBLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length - 1);
    		
    		$('.orderBreakdownContextDivAInputDiv').css('display', 'none');
            $('.orderBreakdownContextDivBInputDiv').css('display', 'none');
            switch (oBLastWord) {
        	case 'a':
            	$('.orderBreakdownContextDivAInputDiv').css('display', 'block');
                console.log('orderBreakdownContextDivAInputDiv의 class에 on추가하기');
                break;
            case 'b':
                $('.orderBreakdownContextDivBInputDiv').css('display', 'block');
                console.log('orderBreakdownContextDivBInputDiv의 class에 on추가하기');
                break;
            default:
                console.log("선언되지 않은 div");
                return;
			}
		});
    		$(".orderBreakdownB [id *= 'eB']").click(function() {
    			let oBLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length - 1);
    			
    			$('.orderBreakdownContextDivCInputDiv').css('display', 'none');
				$('.orderBreakdownContextDivDInputDiv').css('display', 'none');
               	switch (oBLastWord) {
            	case 'a':
                	$('.orderBreakdownContextDivCInputDiv').css('display', 'block');
                    console.log('orderBreakdownContextDivCInputDiv의 class에 on추가하기');
                    break;
                case 'b':
                    $('.orderBreakdownContextDivDInputDiv').css('display', 'block');
                    console.log('orderBreakdownContextDivDInputDiv의 class에 on추가하기');
                    break;
                default:
                    console.log("선언되지 않은 div");
                    return;
				}
		});
   		$(".orderBreakdownC [id *= 'nB']").click(function() {
   			let oBLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length - 1);
   			
   			$('.mainExchangeTabContextDivCanOpenVote').css('display', 'none');
            $('.mainExchangeTabContextDivCaVote').css('display', 'none');
           	switch (oBLastWord) {
	        	case 'a':
	            	$('.mainExchangeTabContextDivCanOpenVote').css('display', 'block');
	                console.log('mainExchangeTabContextDivCanOpenVote의 class에 on추가하기');
	                break;
	            case 'b':
	                $('.mainExchangeTabContextDivCaVote').css('display', 'block');
	                console.log('mainExchangeTabContextDivCaVote의 class에 on추가하기');
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
	<%@include file="header.jsp" %>
	<script type="text/javascript" src="header.js"></script>
    <!-- 와렙 -->
    <div id="wrap">
    	<!-- 메인 -->
        <div class="main">
        	<!-- 탑박스 -->
            <div class="topbox">
                <!-- 코인그래프 -->
                <div class="graph">
                    <h2>그래프 영역</h2>
                </div>
                <!-- //코인그래프 끝 -->
                <!-- 코인시세 -->
                <div class="coinPrice">
                    <h2>코인 시세 영역</h2>
                </div>
	            <!-- //코인시세 끝 -->
            </div>
            <!-- //탑박스 끝 -->
            <!-- 바텀박스 -->
            <div class="bottombox">
                <!-- 실시간 체결내역 -->
                <div class="realTransaction">
                    <h2>실시간 체결내역</h2>
                </div>
                <!-- //실시간 체결내역 끝 -->
                <!-- 매수 매도 거래내역 -->
				<div class="sellBuy">
                    <!-- mainExchangeTab -->
                    <div class="mainExchangeTab">
                        <ul class="mETbox">
                            <li id="mETa"><a href="#" class="">매수</a></li>
                            <li id="mETb"><a href="#" class="">매도</a></li>
                            <li id="mETc"><a href="#" class="">거래내역</a></li>
                        </ul>
                    </div>
                    <!--// mainExchangeTab end --------------------------------------------------->
                    <!-- mainExchangeTab2" -->
                    <div class="mainExchangeTab2">
                        <!-- mainExchangeTabContextDivA ---------------------------------------------->
                        <div class="mainExchangeTabContextDivA">
                            <!-- mainExchangeTabContextDivAInputDiv ---------------------------------->
                            <div class="mainExchangeTabContextDivAInputDiv">
                            	<!-- orderBreakdownA -->
                               	<div class="orderBreakdownA">
	                                주문구분
	                                <input id="oBa" type="radio" name="chk_info1" value="주문가" checked>
	                                <label for="oBa">주문가</label>
	                                <input id="oBb" type="radio" name="chk_info2" value="시장가">
	                                <label for="oBb">시장가</label>
	                            </div>
	                            <!-- //orderBreakdownA 끝 -->
	                            <!-- orderBreakdownContextDivAInputDiv -->
	                            <div class="orderBreakdownContextDivAInputDiv">
	                                주문가능
	                                <div>0 KRW</div>
	                                매수가격(KRW)
	                                	<input type="text" class="txt" value="">
	                                	<a href="#" class="minus" title="-">-</a>
	                                	<a href="#" class="plus" title="+">+</a><br />
	                                주문수량(BTC)
	                                <input type="text" class="txtBuy" placeholder="0" value=""><br /> 
	                                주문총액
	                                <input type="text" class="txtAll" placeholder="0" value="">
	                            </div>
	                            <!-- //orderBreakdownContextDivAInputDiv 끝 -->
	                            <!-- orderBreakdownContextDivBInputDiv -->
	                            <div class="orderBreakdownContextDivBInputDiv">
	                            	주문가능
	                                <div>0 KRW</div>
	                            	주문총액
	                                <input type="text" class="txtAll" placeholder="0" value="">
	                            </div>
	                            <!-- //orderBreakdownContextDivBInputDiv 끝 -->
	                            <!-- mainExchangeTabContextDivABuying -->
	                            <div class="mainExchangeTabContextDivABuying">
									<input type="button" value="초기화">
									<input type="button" value="매수">
								</div>
								<!-- //mainExchangeTabContextDivABuying 끝 -->
                            </div>
                            <!-- //mainExchangeTabContextDivAInputDiv 끝 -->
                        </div>
                        <!--// mainExchangeTabContextDivA 끝 ---------------------------------------->
                        <!-- mainExchangeTabContextDivB ---------------------------------------------->
                        <div class="mainExchangeTabContextDivB">
                            <!-- mainExchangeTabContextDivBInputDiv ---------------------------------->
                            <div class="mainExchangeTabContextDivBInputDiv">
                                <!-- orderBreakdownB -->
                                <div class="orderBreakdownB">
	                                주문구분
	                                <input id="eBa" type="radio" name="chk_info3" value="주문가" checked>
	                                <label for="eBa">주문가</label>
	                                <input id="eBb" type="radio" name="chk_info4" value="시장가">
	                                <label for="eBb">시장가</label>
	                            </div>
	                            <!-- //orderBreakdownB 끝 -->
	                            <!-- orderBreakdownContextDivCInputDiv -->
	                            <div class="orderBreakdownContextDivCInputDiv">
	                                주문가능
	                                <div>0 KRW</div>
	                                매수가격(KRW)
	                                	<input type="text" class="txt" value="">
	                                	<a href="#" class="minus" title="-">-</a>
	                                	<a href="#" class="plus" title="+">+</a><br />
	                                주문수량(BTC)
	                                <input type="text" class="txtBuy" placeholder="0" value=""><br /> 
	                                주문총액
	                                <input type="text" class="txtAll" placeholder="0" value="">
	                            </div>
	                            <!-- //orderBreakdownContextDivCInputDiv 끝 -->
	                            <!-- orderBreakdownContextDivDInputDiv -->
	                            <div class="orderBreakdownContextDivDInputDiv">
	                            	주문가능
	                                <div>0 KRW</div>
	                            	주문총액
	                                <input type="text" class="txtAll" placeholder="0" value="">
	                            </div>
	                            <!-- //orderBreakdownContextDivDInputDiv 끝 -->
                                <!-- mainExchangeTabContextDivBSelling -->
                                <div class="mainExchangeTabContextDivBSelling">
                                <input type="button" value="초기화">
								<input type="button" value="매도">
								</div>
								<!-- //mainExchangeTabContextDivBSelling 끝 -->
                            </div>
                            <!-- //mainExchangeTabContextDivBInputDiv 끝 -->
                        </div>   
                        <!-- //mainExchangeTabContextDivB 끝 ---------------------------------------->
                        <!-- mainExchangeTabContextDivC ---------------------------------------------->
                        <div class="mainExchangeTabContextDivC">
                                <!-- orderBreakdownC ---------------------------------->
                                <div class="orderBreakdownC">
	                                주문구분
	                                <input id="nBa" type="radio" name="chk_info5" value="미채결" checked>
	                                <label for="nBa">미채결</label>
	                                <input id="nBb" type="radio" name="chk_info6" value="채결">
	                                <label for="nBb">채결</label>
                                </div>
                                <!-- //orderBreakdownC 끝 -->
                                <!-- mainExchangeTabContextDivCanOpenVote -->
                                <div class="mainExchangeTabContextDivCanOpenVote">
	                                <table class="anOpenVote">
		                                <tr>
			                                <th rowspan="2">주문시간</th>
			                                <th>마켓명</th>
			                                <th>주문량</th>
			                                <th rowspan="2">취소</th>
		                                </tr>
		                                <tr>
			                                <th>구분</th>
			                                <th>미체결량</th>
		                                </tr>
		                             </table>
		                             <table class="nothing">
		                                <tr>
			                                <th rowspan="2">주문시간</th>
			                                <th>마켓명</th>
			                                <th>주문량</th>
			                                <th rowspan="2">취소</th>
		                                </tr>
		                                <tr>
			                                <th>구분</th>
			                                <th>미체결량</th>
		                                </tr>
		                             </table>
                                </div>
                                <!-- //mainExchangeTabContextDivCAnOpenVote 끝 -->
                                 <!-- mainExchangeTabContextDivCaVote -->
                                <div class="mainExchangeTabContextDivCaVote">
                                	<table class="aVote">
		                                <tr>
			                                <th rowspan="2">주문시간</th>
			                                <th>마켓명</th>
			                                <th>채결가격</th>
			                                <th rowspan="2">채결수량</th>
		                                </tr>
		                                <tr>
			                                <th>구분</th>
			                                <th>채결금액</th>
		                                </tr>
		                             </table>
		                             <table class="nothing">
		                                <tr>
			                                <th rowspan="2">주문시간</th>
			                                <th>마켓명</th>
			                                <th>채결가격</th>
			                                <th rowspan="2">채결수량</th>
		                                </tr>
		                                <tr>
			                                <th>구분</th>
			                                <th>채결금액</th>
		                                </tr>
		                             </table>
                                	
                                </div>
                                <!-- //mainExchangeTabContextDivCaVote 끝 -->
                        </div> 
                        <!--// mainExchangeTabContextDivC 끝 ---------------------------------------->
					</div>
                    <!--// mainExchangeTab2" 끝 -->
                </div>
                <!-- //매수 매도 거래내역 끝 -->
                    <!-- 관심코인 -->
                    <div class="interestCoin">
                        <h2>관심코인</h2>
                    </div>
               		<!-- //관심코인 끝 -->
            </div>
            <!-- //바텀박스끝 -->
        </div>
        <!-- //메인끝 -->
    </div>  
    <!-- //와렙 끝 -->
    <%@include file="footer.jsp" %>
</body>
</html>