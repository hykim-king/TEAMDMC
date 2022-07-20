<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="keywords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<!--스타일 시트 -->
<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 사용자 정의 function, ISEmpty -->
<script src="${CP_RES}/js/eUtil.js"></script>
<!-- 사용자 정의 function, callAjax -->
<script src="${CP_RES}/js/eclass.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- google chart  -->
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${CP_RES}/js/sorttable.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<style type="text/css">
.red {
	background: #f5c5c5;
}

.blue {
	background: #cae0ff;
}

* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

th a {
	color: black;
	text-decoration: none;
}

td a {
	color: black;
	text-decoration: none;
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
	height: 850px;
	position: relative;
	color: #333;
}

#wrap a:hover {
	color: #333;
}

.mainExchangeTabContextDivB, .mainExchangeTabContextDivC {
	display: none;
}

.orderBreakdownContextDivBInputDiv {
	display: none;
}

.orderBreakdownContextDivDInputDiv {
	display: none;
}

.mainExchangeTabContextDivCaVote {
	display: none;
}

.main {
	width: 90%;
	box-sizing: content-box;
	height: 660px;
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
	height: 350px;
}

#coinGraph {
	width: 63%;
	border: 1px solid #333;
	height: 350px;
}

#coinGraph h2 {
	margin-left: 15px;
	margin-top: 10px;
}

.graph {
	width: 100%;
	max-width: 1200px;
	height: 300px;
	margin-bottom: 100px;
	text-align: center;
	line-height: 300px;
	font-size: 20px;
}

.coinPrice {
	width: 32%;
	border: 1px solid #333;
	overflow-y: scroll;
	font-size: 14px;
}

#coinPrice2 {
	border-collapse: collapse;
	width: 100%;
}

#coinPrice2 th {
	border-bottom: 1px solid lightgray;
	height: 20px;
}

#coinPrice2 tr {
	height: 40px;
	border-bottom: 1px solid lightgray;
}

#coinPrice2 .big {
	width: 20%;
}

#coinPrice2 .small {
	width: 10%;
}

#uicTable {
	width: 100%;
	border-collapse: collapse;
}

#uicTable h2 {
	font-size: 16px;
}

#uicTable th {
	border-bottom: 1px solid lightgray;
	height: 20px;
	text-align: center;
	width: 25%;
}

#uicTable tr {
	height: 40px;
	border-bottom: 1px solid lightgray;
}

#uicTable .text-right {
	text-align: right;
	padding-right: 3px;
}

.coinPrice a {
	font-size: 15px;
	font-weight: bold
}

.coinPrice a:hover {
	font-size: 15px;
}

#coinPrice2 .text-left {
	text-align: left;
	padding-left: 3px;
}

#coinPrice2 .text-right {
	text-align: right;
	padding-right: 3px;
}

#coinPrice2 .text-center {
	text-align: center;
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
	overflow-y: scroll;
	border: 1px solid #333;
}

.sellBuy {
	width: 29%;
	border: 1px solid #333;
}

.mETbox {
	width: 100%;
	display: flex;
	height: 40px;
}

.mETbox li {
	list-style: none;
	flex: 1;
	text-align: center;
	line-height: 40px;
	margin-top: 10px;
}

.mETbox li:nth-child(1) {
	border-right: 1px solid #333;
}

.mETbox li:nth-child(2) {
	border-right: 1px solid #333;
}

.interestCoin {
	width: 32%;
	border: 1px solid #333;
	overflow-y: scroll;
	font-size: 14px;
}

.interestCoin h2 {
	margin: 10px 0 0 10px;
}

label {
	margin-right: 8px;
}

.anOpenVote {
	border: 1px solid #333;
	width: 100%;
	border-collapse: collapse;
}

.aVote {
	border: 1px solid black;
	width: 100%;
	border-collapse: collapse;
}

.nothing {
	border: 1px solid #333;
	width: 100%;
	border-collapse: collapse;
}

.orderPo, .orderPrice, .orderNum, .orderAll {
	width: 90%;
	display: flex;
	align-items: center;
	height: 40px;
	margin: 0 auto;
	justify-content: space-between;
}

.mainExchangeTabContextDivABuying, .mainExchangeTabContextDivBSelling {
	width: 60%;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.mainExchangeTabContextDivABuying input,
	.mainExchangeTabContextDivBSelling input {
	border: 1px solid #333;
	border-radius: 2px;
	background: white;
	height: 30px;
	width: 80px;
}

.radio {
	width: 200px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.mainExchangeTabContextDivABuying input:nth-child(2) {
	margin-left: 10px;
}

.mainExchangeTabContextDivBSelling input:nth-child(2) {
	margin-left: 10px;
}

.orderNum input, .orderAll input {
	height: 25px;
	border: 1px solid #333;
	border-radius: 2px;
	width: 200px;
	box-sizing: border-box;
	text-align: right;
}

.orderPrice input {
	height: 25px;
	border: 1px solid #333;
	border-radius: 2px;
	width: 150px;
	box-sizing: border-box;
}

.mainExchangeTab2 {
	font-size: 14px;
}

.orderBreakdownA, .orderBreakdownB, .orderBreakdownC {
	width: 90%;
	display: flex;
	align-items: center;
	height: 40px;
	justify-content: space-between;
	margin: 0 auto;
	margin-top: 20px;
}

.opbox {
	display: flex;
	align-items: center;
}

.opbox .minus, .opbox .plus {
	width: 25px;
	height: 25px;
	border: 1px solid #333;
	text-align: center;
	line-height: 25px;
	box-sizing: border-box;
	color: #333;
}

#realBox {
	width: 100%;
	font-size: 14px;
	border-collapse: collapse;
	color: #37385d;
}

#realBox tr {
	height: 25px;
}

#realBox td {
	padding-left: 5px;
}

#realBox .realsmall {
	width: 23%;
}

#realBox .realbig {
	width: 27%;
}

#table1 tr td {
	text-align: center;
	word-break: keep-all;
}

.fullCoin tr td {
	text-align: center;
	word-break: keep-all;
}

.priceIndex tr th{
  position: sticky;
  top: 0px;
  background-color: lightgray;
  text-align: center;
}
</style>
<title>KEMIE</title>
<!--자바스크립트 코드 -->
<script type="text/javascript">
		$(document).ready(function() { /* a태그의 id의 마지막 문자열을 추출하여 원하는 div on */
			
			
		  $('.priceIndex tr th').each(function (column) {
			  $(this).click(function() {
		      if($(this).is('.asc')) {
		        $(this).removeClass('asc');
		        $(this).addClass('desc');
		        sortdir=-1;
	
		      } else {
		        $(this).addClass('asc');
		        $(this).removeClass('desc'); sortdir=1;
		      }
	
		      $(this).siblings().removeClass('asc');
		      $(this).siblings().removeClass('desc');
	
		      var rec = $('#coinPrice2').find('tbody>tr').get();
		      let text = $(this).text();
		      
			      rec.sort(function (a, b) {
			        var val1 = $(a).children('td').eq(column).text().toUpperCase();
			        var val2 = $(b).children('td').eq(column).text().toUpperCase();
			        
			        if(text != "코인명"){
			        	val1 = Number(val1.replace(/[^0-9]/gi, ""));
			          val2 = Number(val2.replace(/[^0-9]/gi, ""));
			        }
			        
			        if(text == "관심등록"){
			          val1 = $(a).children('td').eq(column).children('input').val();
			          if(val1 == "관심등록") val2 = "삭제";
			          else val2 = "관심등록";
			        }
			        
			        return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
			      });

		      $.each(rec, function(index, row) {
		          $('.fullCoin').append(row);
		      });
		    });
			});
		  
		  $('#uicTable tr th').each(function (column) {
        $(this).click(function() {
          if($(this).is('.asc')) {
            $(this).removeClass('asc');
            $(this).addClass('desc');
            sortdir=-1;
  
          } else {
            $(this).addClass('asc');
            $(this).removeClass('desc'); sortdir=1;
          }
  
          $(this).siblings().removeClass('asc');
          $(this).siblings().removeClass('desc');
  
          var rec = $('#uicTable').find('tbody>tr').get();
          
          if($(this).text() == "코인명"){
            rec.sort(function (a, b) {
              var val1 = $(a).children('td').eq(column).text().toUpperCase();
              var val2 = $(b).children('td').eq(column).text().toUpperCase();
              
              return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
            });
          }else{
            rec.sort(function (a, b) {
              var val1 = $(a).children('td').eq(column).text();
              var val2 = $(b).children('td').eq(column).text();
              
              val1 = Number(val1.replace(/[^0-9]/gi, ""));
              val2 = Number(val2.replace(/[^0-9]/gi, ""));
              
              return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
            });
          }
  
          $.each(rec, function(index, row) {
        	  $('#table1').append(row);
          });
        });
      });
				       
		   $('[id*="interCoin"]').on('click', function(){
			 	 let settings = {
			             "async": true,
			             "url": "${CP}/addOrDelete.do",
			             "method": "GET",
			             "data": {
			            	 "uicMarket": $(this).parent().siblings('[id*="uicMarket"]').text(),
			               "uId": $("#admin").val()
			             }
			 	 };

				 if($(this).val() == "삭제") $(this).val("관심등록");
				 else $(this).val("삭제");
				 
			 	 $.ajax(settings).done(function (data){
			 	   console.log(data);
			 		 
			 		 alert(data.msgContents);
			 	   
						settings.url = "${CP}/getAll.do";
						settings.parameters = {"uId": $("#admin").val()};
						$.ajax(settings).done(function (uicdata){
							console.log(uicdata);
							$("#table1").empty();
							  
							  let htmData = "";
							  
							  for(let i=0; i<uicdata.length; i++){
							      htmData += "<tr>";
							      htmData += "     <td >"+ uicdata[i].uicMarket +"</td>";
							      htmData += "     <td class='text-right'>"+ $('td:contains('+ uicdata[i].uicMarket +')').next().text()+"</td>";
							      htmData += "     <td class='text-right'>"+ $('td:contains('+ uicdata[i].uicMarket +')').next().next().text()+"</td>";
							      htmData += "     <td class='text-right'>"+ $('td:contains('+ uicdata[i].uicMarket +')').next().next().next().text()+"</td>";
							      htmData += "</tr>";
							  }
							  $("#table1").append(htmData);
						});
					});
		    });
		
		   $('[id*="uicMarket"]').on('click', function(){
			   let marketCoin= $(this).text();
			   //호가창
			   let really = {
			     "async": true,
			     "crossDomain": true,
			     "url": "https://api.upbit.com/v1/orderbook?markets="+marketCoin,
			     "method": "GET",
			     "headers": {
			       "Accept": "application/json"
			     }
			   };
		       
		     $.ajax(really).done(function (real){
			     let htmlData = "";
			     
			     $("#realBox").empty();
			     
			     htmlData += "<tr>";
			     htmlData += "<td class='realsmall red'>"+ '매도총량'+"</td>";
			     htmlData += "<td class='realbig red'>"+ (real[0].total_ask_size).toFixed(3)+"</td>";
			     htmlData += "<td class='realbig red'></td>";
			     htmlData += "<td class='realsmall red'></td>";
			     htmlData += "</tr>";
			     
			     for(let i=real[0].orderbook_units.length-1; i>0; i--){
			       htmlData += "<tr>";   
			       htmlData += "<td class='text-left red'>"+ real[0].orderbook_units[i].ask_price +"</td>";
			       htmlData += "<td class='text-left red'>"+ real[0].orderbook_units[i].ask_size +"</td>";
			       htmlData += "<td class='text-left red'></td>";
			       htmlData += "<td class='text-left red'></td>";
			       htmlData += "</tr>";
			     }
			     
			     for(let i=0; i<real[0].orderbook_units.length; i++){
			       htmlData += "<tr>";
			       htmlData += "<td class='text-left blue'></td>";
			       htmlData += "<td class='text-left blue'></td>";
			       htmlData += "<td class='text-left blue'>"+ real[0].orderbook_units[i].bid_size +"</td>";
			       htmlData += "<td class='text-left blue'>"+ real[0].orderbook_units[i].bid_price +"</td>";
			       htmlData += "</tr>";
			     }  
			     
		       htmlData += "<tr>";
		       htmlData += "<td class='text-left blue'></td>";
		       htmlData += "<td class='text-left blue'></td>";
		       htmlData += "<td class='text-left blue'>"+ (real[0].total_bid_size).toFixed(3) +"</td>";
		       htmlData += "<td class='text-left blue'>"+ '매수총량' +"</td>";
		       htmlData += "</tr>";
		
			     $("#realBox").append(htmlData);
		     });
		     //호가창 끝
		       
		     //그래프
		     google.charts.load('current', {'packages':['corechart']});
		     // google.charts.setOnLoadCallback(drawCharts($(this).text()));
		     
		     google.charts.setOnLoadCallback(function(){
		    	 really.url = "https://api.upbit.com/v1/candles/minutes/60?market="+marketCoin+"&count=30";
		       
		       $.ajax(really).done(function (response1){
		         response1.reverse();
		         
		         var candleData = response1.map(data => {
		           let time = new Date(data.candle_date_time_kst);
		           let printTime = `${time.getHours()}:00`
		    
		           return [time, data.low_price, data.opening_price, data.trade_price, data.high_price];
		         });
		
		         console.log(candleData);
		  
		         var visualizedData = new google.visualization.arrayToDataTable(candleData, true);
		         var options = {legend: 'none'};
		         var chart = new google.visualization.CandlestickChart(document.getElementById(`coin${a+1}`))
		  
		         chart.draw(visualizedData, options)
		       });
		     });
		   });
		   //업비트 오픈소스 끝
		   
		   if(!eUtil.ISEmpty("${market}")){
         $('td:contains("${market}"):first').trigger("click");
       }
		   
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
		               console.log('orderBreakdownContextDivDInputDiv의 class에 ojavascript contains first 찾기n추가하기');
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
	<%@include file="header.jsp"%>
	<script type="text/javascript" src="${CP_RES}/js/header.js"></script>
	<!-- 와렙 -->
	<input type="hidden" id="admin" value="${sessionScope.user.uId}">
	<div id="wrap">
		<!-- 메인 -->
		<div class="main">
			<!-- 탑박스 -->
			<div class="topbox">
				<!-- 코인그래프 -->
				<div id="coinGraph">
					<h2>실시간 코인 시세</h2>
					<!-- 코인 그래프 박스 영역=========== -->
					<div class="graph" id="coin1">코인을 선택해주세요</div>
					<!-- //코인 그래프 박스 영역=========== -->
				</div>
				<!-- //주요 코인 시세=========================== -->

				<!-- 코인시세 -->
				<div class="coinPrice">
					<table id="coinPrice2" class="tablesorter">
						<thead class="priceIndex">
							<tr>
                <th class="big"><a href="#">코인명<img
                    src="${CP_RES}/img/exchange.icon2.png"></a></th>
                <th class="big"><a href="#">현재가<img
                    src="${CP_RES}/img/exchange.icon2.png"></a></th>
                <th class="big"><a href="#">전일대비<img
                    src="${CP_RES}/img/exchange.icon2.png"></a></th>
                <th class="big"><a href="#">거래대금<img
                    src="${CP_RES}/img/exchange.icon2.png"></a></th>
                <th class="big"><a href="#">관심등록<img
                    src="${CP_RES}/img/exchange.icon2.png"></a></th>
              </tr>
						</thead>
						<tbody class="fullCoin">
							<c:choose>
								<c:when test="${tickerList.size() > 0}">
									<c:forEach var="vo" items="${tickerList}" varStatus="status">
										<tr>
											<td id="uicMarket${status.index}">${vo.market}</td>
											<td id="uicNowPrice${status.index}"><fmt:formatNumber
													value="${vo.trade_price}" pattern="###,###,###,###" /></td>
											<td id="uicToFixed${status.index}"><fmt:formatNumber
													value="${vo.signed_change_rate*100}" pattern="0.000" />%</td>
											<td id="uicPrice24h${status.index}"><fmt:formatNumber
													value="${Math.ceil(vo.acc_trade_price_24h/1000000)}"
													pattern="###,###,###,###" />
												<p>백만</p></td>
												<c:set var="uIC" value="관심등록" />
												<c:forEach var="vo2" items="${uicTickerList}">
												  <c:choose>
												    <c:when test="${vo.market == vo2.market}"><c:set var="uIC" value="삭제" /></c:when>
												  </c:choose>
												</c:forEach>
												<td class='text-center'><input type='button'
													id='interCoin${status.index}' value='<c:out value="${uIC}"/>' /></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="99">no data found</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- //코인시세 끝 -->
			</div>
			<!-- //탑박스 끝 -->
			<!-- 바텀박스 -->
			<div class="bottombox">
				<!-- 실시간 체결내역 -->
				<div class="realTransaction">
					<table id="realBox"></table>
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
									<p>주문구분</p>
									<div class="radio">
										<input id="oBa" type="radio" name="chk_info1" value="주문가"
											checked> <label for="oBa">주문가</label> <input id="oBb"
											type="radio" name="chk_info1" value="시장가"> <label
											for="oBb">시장가</label>
									</div>
								</div>
								<!-- //orderBreakdownA 끝 -->
								<!-- orderBreakdownContextDivAInputDiv -->
								<div class="orderBreakdownContextDivAInputDiv">
									<div class="orderPo">
										<p>주문가능</p>
										<p>0 KRW</p>
									</div>
									<div class="orderPrice">
										<p>매수가격(KRW)</p>
										<div class="opbox">
											<input type="text" class="txt" value=""> <a href="#"
												class="minus" title="-">-</a> <a href="#" class="plus"
												title="+">+</a>
										</div>
									</div>
									<div class="orderNum">
										<p>주문수량(BTC)</p>
										<input type="text" class="txtBuy" placeholder="0" value="">
									</div>
									<div class="orderAll">
										<p>주문총액</p>
										<input type="text" class="txtAll" placeholder="0" value="">
									</div>
								</div>
								<!-- //orderBreakdownContextDivAInputDiv 끝 -->
								<!-- orderBreakdownContextDivBInputDiv -->
								<div class="orderBreakdownContextDivBInputDiv">
									<div class="orderPo">
										<p>주문가능</p>
										<p>0 KRW</p>
									</div>
									<div class="orderAll">
										<p>주문총액</p>
										<input type="text" class="txtAll" placeholder="0" value="">
									</div>
								</div>
								<!-- //orderBreakdownContextDivBInputDiv 끝 -->
								<!-- mainExchangeTabContextDivABuying -->
								<div class="mainExchangeTabContextDivABuying">
									<input type="button" value="초기화"> <input type="button"
										value="매수">
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
									<p>주문구분</p>
									<div class="radio">
										<input id="eBa" type="radio" name="chk_info2" value="주문가"
											checked> <label for="eBa">주문가</label> <input id="eBb"
											type="radio" name="chk_info2" value="시장가"> <label
											for="eBb">시장가</label>
									</div>
								</div>
								<!-- //orderBreakdownB 끝 -->
								<!-- orderBreakdownContextDivCInputDiv -->
								<div class="orderBreakdownContextDivCInputDiv">
									<div class="orderPo">
										<p>주문가능</p>
										<p>0 KRW</p>
									</div>
									<div class="orderPrice">
										<p>매도가격(KRW)</p>
										<div class="opbox">
											<input type="text" class="txt" value=""> <a href="#"
												class="minus" title="-">-</a> <a href="#" class="plus"
												title="+">+</a>
										</div>
									</div>
									<div class="orderNum">
										<p>주문수량(BTC)</p>
										<input type="text" class="txtSell" placeholder="0" value="">
									</div>
									<div class="orderAll">
										<p>주문총액</p>
										<input type="text" class="txtAll" placeholder="0" value="">
									</div>
								</div>
								<!-- //orderBreakdownContextDivCInputDiv 끝 -->
								<!-- orderBreakdownContextDivDInputDiv -->
								<div class="orderBreakdownContextDivDInputDiv">
									<div class="orderPo">
										<p>주문가능</p>
										<p>0 KRW</p>
									</div>
									<div class="orderAll">
										<p>주문총액</p>
										<input type="text" class="txtAll" placeholder="0" value="">
									</div>
								</div>
								<!-- //orderBreakdownContextDivDInputDiv 끝 -->
								<!-- mainExchangeTabContextDivBSelling -->
								<div class="mainExchangeTabContextDivBSelling">
									<input type="button" value="초기화"> <input type="button"
										value="매도">
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
								<p>주문구분</p>
								<div class="radio">
									<input id="nBa" type="radio" name="chk_info3" value="미채결"
										checked> <label for="nBa">미채결</label> <input id="nBb"
										type="radio" name="chk_info3" value="채결"> <label
										for="nBb">채결</label>
								</div>
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
										<th rowspan="2">2022.06.22<br>13:22
										</th>
										<th>비트코인</th>
										<th>5,000,000</th>
										<th rowspan="2">30</th>
									</tr>
									<tr>
										<th>미체결</th>
										<th>5,000,000</th>
									</tr>
								</table>
							</div>
							<!-- //mainExchangeTabContextDivCAnOpenVote 끝 -->
							<!-- mainExchangeTabContextDivCaVote -->
							<div class="mainExchangeTabContextDivCaVote">

								<table class="aVote">
									<tr>
										<td rowspan="2">주문시간</td>
										<td>마켓명</td>
										<td>체결가격</td>
										<td rowspan="2">체결수량</td>
									</tr>
									<tr>
										<td>구분</td>
										<td>체결금액</td>
									</tr>
								</table>
								<table class="nothing">
									<tr>
										<td rowspan="2">2022.06.22<br>13:22
										</td>
										<td>비트코인</td>
										<td>5,000,000</td>
										<td rowspan="2">30</td>
									</tr>
									<tr>
										<td>체결</td>
										<td>5,000,000</td>
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
					<table id="uicTable" class="">
						<thead>
							<tr>
								<th class="big"><a href="#">코인명<img
										src="${CP_RES}/img/exchange.icon2.png"></a></th>
								<th class="big"><a href="#">현재가<img
										src="${CP_RES}/img/exchange.icon2.png"></a></th>
								<th class="big"><a href="#">전일대비<img
										src="${CP_RES}/img/exchange.icon2.png"></a></th>
								<th class="big"><a href="#">거래대금<img
										src="${CP_RES}/img/exchange.icon2.png"></a></th>
							</tr>
						</thead>
						<tbody id="table1">
							<c:choose>
								<c:when test="${uicTickerList.size()>0}">
									<c:forEach var="vo" items="${uicTickerList}" varStatus="status">
										<tr>
											<td>${vo.market}</td>
											<td><fmt:formatNumber value="${vo.trade_price}"
													pattern="###,###,###,###" /></td>
											<td><fmt:formatNumber
													value="${vo.signed_change_rate*100}" pattern="0.000" />%</td>
											<td><fmt:formatNumber
													value="${Math.ceil(vo.acc_trade_price_24h/1000000)}"
													pattern="###,###,###,###" />
												<p>백만</p></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="99" class="text-center">등록된 관심코인이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- //관심코인 끝 -->
			</div>
			<!-- //바텀박스끝 -->
		</div>
		<!-- //메인끝 -->
	</div>
	<!-- //와렙 끝 -->
	<%@include file="footer.jsp"%>
</body>
</html>
