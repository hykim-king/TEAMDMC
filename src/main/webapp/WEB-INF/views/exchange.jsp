<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
@import
    url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
    ;
</style>
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<style type="text/css">

.red{
 background:red;
}
.blue{
background:blue;
}
* {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
}
th a {color: black;
    text-decoration: none;}

td a {color: black;
    text-decoration: none;}
    
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
    position: relative;
}

#wrap a:hover {color: #333;}
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
    height: 320px;
}

#coinGraph {
    width: 63%;
    border: 1px solid #333;
}

.graph {
    width: 100%;
    max-width: 1200px;
    height: 300px;
    border: 1px solid #333;
    margin-bottom: 100px;
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
    overflow: scroll;
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

.anOpenVote {
    border: 1px solid #333;
    width: 100%;
    border-collapse: collapse;
}

th, td, tr {
    border: 1px solid #333;
}

.aVote {
    border: 1px solid black;
    width: 100%;
    border-collapse: collapse;
}

th {
    width: 25%;
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



</style>
<title>Insert title here</title>
<!--자바스크립트 코드 -->
<script type="text/javascript">
    $(document).ready(function() { /* a태그의 id의 마지막 문자열을 추출하여 원하는 div on */
        //업비트 오픈 소스 시작
              let full = {
                        "async": true,
                        "crossDomain": true,
                        "url": "https://api.upbit.com/v1/market/all?isDetails=false",
                        "method": "GET",
                        "headers": {
                        "Accept": "application/json"
                        }
              };
              $.ajax(full).done(function (response) {
                  let i = 0;
                  let htmlData = "";
                  let marketNames = "";
                  $(".fullCoin").empty();
                  
                  console.log(response);
                  
                  for(i=0; i<response.length; i++){
                     let str = (response[i].market).substring(0, (response[i].market).indexOf('-'));
                     let arr;
                     if( str == 'KRW' ) {
                           arr = response[i].market;
                           marketNames += response[i].market + '%2C';
                     }
                  }
                  
                  marketNames = marketNames.substr(0, marketNames.length-3);

                  let full2 = {
                          "async": true,
                          "crossDomain": true,
                          "url": "https://api.upbit.com/v1/ticker?markets="+marketNames,
                          "method": "GET",
                          "headers": {
                            "Accept": "application/json"
                          }
                  };
                  $.ajax(full2).done(function (data) {
                      console.log(data);
                      
                      for(i=0; i<data.length; i++){
                          
                          var no = Math.ceil(data[i].acc_trade_price_24h/1000000);
                          no = String(no).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                          
                          htmlData += "<tr>                                                                                                                                    ";
                          htmlData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicMarket"+i+"'>"+ data[i].market +"</td>                                   ";
                          htmlData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicNowPrice"+i+"'>"+ data[i].trade_price +"</td>                            ";
                          htmlData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicToFixed"+i+"'>"+ (data[i].signed_change_rate*100).toFixed(3)  +"%</td>   ";
                          htmlData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicPrice24h"+i+"'>"+ no +"백만</td>                                           ";
                          htmlData += "     <td class='text-left'> <input type='button' id='look"+i+"' value='관심등록' /> </td>                                                    ";
                          htmlData += "<tr>                                                                                                                ";
                      }
                      $(".fullCoin").append(htmlData);
                      
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
                          
                          $.ajax(really).done(function (real) {
                              let i = 0;
                              let htmlData = "";
                              $(".realTransaction").empty();
                            
                            for(i=0; i<real.length; i++){
                                    htmlData += "<tr>                                                                            ";
                                    htmlData += "<td class='text-left red'>"+ '매도총량'+"</td>             ";
                                    htmlData += "<td class='text-left red'>"+ (real[i].total_ask_size).toFixed(3)+"</td>             ";
                                    htmlData += "<tr>                                                                            ";
                                for(j=14; j>=0; j--){
                                    htmlData += "<tr>                                                                            ";   
                                    htmlData += "<td class='text-left red'>"+ real[i].orderbook_units[j].ask_price +"</td>           ";
                                    htmlData += "<td class='text-left red'>"+ real[i].orderbook_units[j].ask_size+"</td>             ";
                                    htmlData += "<tr>                                                                            ";
                                }
                                for(j=0; j<15; j++){
                                    htmlData += "<tr>                                                                            ";            
                                    htmlData += "<td class='text-left blue'>"+ real[i].orderbook_units[j].bid_price +"</td>           ";
                                    htmlData += "<td class='text-left blue'>"+ real[i].orderbook_units[j].bid_size+"</td>             ";
                                    htmlData += "<tr>                                                                            ";
                                }  
                                    htmlData += "<tr>                                                                            ";
                                    htmlData += "<td class='text-left blue'>"+ '매수총량' +"</td>             ";
                                    htmlData += "<td class='text-left blue'>"+ (real[i].total_bid_size).toFixed(3)+"</td>             ";
                                    htmlData += "<tr>                                                                            ";
                            }
                            $(".realTransaction").append(htmlData);
                          });
                          //호가창 끝
                          
                        //그래프
                          google.charts.load('current', {'packages':['corechart']});
                          google.charts.setOnLoadCallback(drawCharts);
                          console.log(google.charts)
                          let settings = {
                                  "async": true,
                                  "crossDomain": true,
                                  "url": "https://api.upbit.com/v1/market/all?isDetails=false",
                                  "method": "GET",
                                  "headers": {
                                  "Accept": "application/json"
                                  }
                          };
                          
                          $.ajax(settings).done(function (response) {
                              let htmlData = "";
                              let array = [0];
                              
                              for(let i = 0; i < array.length; i++){
                                  $("#coin").empty();
                                  
                                  let value = array[i];
                                  
                                  htmlData += "<tr>                                                                                       ";
                                  htmlData += " <td class='text-center col-sm-1 col-md-1 col-lg-1'>"+ response[value].market +"</td>      ";
                                  htmlData += "<tr>                                                                                       ";
                                  htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+ response[value].korean_name +"</td> ";
                                  htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+ response[value].english_name +"</td>";
                                  htmlData += "<tr>                                                                                       ";
                                  
                                  $("#coin").append(htmlData);
                                  htmlData = "";
                              }
                          });
                          function drawCharts() {
                                  let settings2 = {
                                          "async": true,
                                          "crossDomain": true,
                                          "url": "https://api.upbit.com/v1/candles/minutes/60?market="+marketCoin+"&count=30",
                                          "method": "GET",
                                          "headers": {
                                          "Accept": "application/json"
                                          }
                                  };
                                  
                                  $.ajax(settings2).done(function (response1) {
                                  let htmlData = "";
                                  let array = [0];
                                  
                                  response1.reverse();
                                  console.log(response1)
                                  
                                  const candleData = response1.map(data => {
                                      const time = new Date(data.candle_date_time_kst);
                                      const printTime = `${time.getHours()}:00`
                  
                                      return [time, data.low_price, data.opening_price, data.trade_price, data.high_price];
                                  });
                  
                                  console.log(candleData)
                  
                                  const visualizedData = google.visualization.arrayToDataTable(candleData, true);
                  
                                  const options = {
                                      legend: 'none'
                                  };
                  
                                  const chart = new google.visualization.CandlestickChart(document.getElementById(`coin${a+1}`))
                  
                                  chart.draw(visualizedData, options)
                  
                              });  
                          }
    				            //그래프끝
                      });
                       
                    	  
                      })
                    
                      $('[id*="look"]').on("click", function() {
                          alert("관심코인이 등록되었습니다.");
                          console.log($(this).attr("id"));
                          let t1 = $(this).attr("id");
                          t1 = t1.substring(t1.lastIndexOf("k")+1, t1.length);
                          console.log(`uicMarket${'${t1}'}`);
                          let uicMarket = "uicMarket"+t1;
                          let uicNowPrice = "uicNowPrice"+t1;
                          let uicToFixed = "uicToFixed"+t1;
                          let uicPrice24h = "uicPrice24h"+t1;
                          let uId = "uId"+t1;
                          console.log(uicMarket);
                          console.log(uicNowPrice);
                          console.log(uicToFixed);
                          console.log(uicPrice24h);
                          console.log(uId);
                          $(this).parents().attr("id", "${uicMarket}").text();
                        	  
                          let url = "${CP}/insert.do99";
                          let method ="POST";
                          let async  = true;
                          let parameters = {
                                "uicMarket": ($(this).parents().attr("id", uicMarket)).text(),
                                "uicNowPrice": ($(this).parents().attr("id", uicNowPrice)).text(),
                                "uicToFixed": ($(this).parents().attr("id", uicToFixed)).text(),
                                "uicPrice24h": ($(this).parents().attr("id", uicPrice24h)).text(),
                                "uId": ($(this).parents().attr("id", uId)).text()
                          };
                            EClass.callAjax(url, parameters, method, async, function(data) {
                                console.log('data:'+data);
                                //alert(data.msgContents); 
                                if("1" == data.msgId){//id중복
                                    alert(data.msgContents); 
                                    //사용할수 없음
                                    $(".look").val("0");
                         //           uicTable
                         //           let hData;
                                    
                         //           hData += "<tr>                                                                                                                                    ";
                           //         hData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicMarket"+i+"'>"+ data[i].market +"</td>                                   ";
                             //       hData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicNowPrice"+i+"'>"+ data[i].trade_price +"</td>                            ";
                               //     hData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicToFixed"+i+"'>"+ (data[i].signed_change_rate*100).toFixed(3)  +"%</td>   ";
                                 //   hData += "     <td class='text-left   col-sm-2 col-md-2 col-lg-2' id='uicPrice24h"+i+"'>"+ no +"백만</td>                                           ";
                                   // hData += "     <td class='text-left'> <input type='button' id='look"+i+"' value='관심등록' /> </td>                                                    ";
                                    //hData += "<tr>                                                                                                                ";
                                }else{//id사용 가능
                                    alert(data.msgContents); 
                                    //사용할수 있음
                                    $(".look").val("관심등록");                   
                                }
                            });
                      }); 
              }); 
       //관심목록 끝
             
           
             
           //실시간 체결 내역
           /*   let settings = {
                     "async": true,
                     "crossDomain": true,
                     "url": "https://api.upbit.com/v1/market/all?isDetails=false",
                     "method": "GET",
                     "headers": {
                     "Accept": "application/json"
                     }
           };
           $.ajax(settings).done(function (response) {
               let i = 0;
               let htmlData = "";
               let marketNames = "";
               $(".mainExchangeTabContextDivCaVote").empty();
               
               console.log(response);
               
               for(i=0; i<response.length; i++){
                  let str = (response[i].market).substring(0, (response[i].market).indexOf('-'));
                  let arr;
                  if( str == 'KRW' ) {
                        arr = response[i].market;
                        marketNames += response[i].market + '%2C';
                  }
               }
               
               marketNames = marketNames.substr(0, marketNames.length-3);

               let settings = {
                       "async": true,
                       "crossDomain": true,
                       "url": "https://api.upbit.com/v1/trades/ticks?market=KRW-BTC&count=10",
                       "method": "GET",
                       "headers": {
                         "Accept": "application/json"
                       }
               };
               $.ajax(settings).done(function (data) {
                   console.log(data);
                   
                   for(i=0; i<data.length; i++){
                       
                       
                       htmlData += "<tr>                                                                                                        ";
                       htmlData += "     <td class='text-left   '>"+ data[i].trade_date_utc +'-'+ data[i].trade_time_utc +"</td>                ";
                       htmlData += "     <td class='text-left   '>"+ response[0].market+"</td>                                                 ";   
                       htmlData += "     <td class='text-left   '>"+ data[i].trade_price +"</td>                                               ";  
                       htmlData += "     <td class='text-left   '>"+ data[i].trade_volume +"</td>                                               ";   
                       htmlData += "<tr>                                                                                                        ";
                   }
                   $(".mainExchangeTabContextDivCaVote").append(htmlData);
               });  
             
            
                   }); */
                          
  
             
            	 
            	 
          
            //업비트 오픈소스 끝
            
            
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
    <%@include file="header.jsp"%>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    <!-- 와렙 -->
    <form>
    <input type="text" id="admin" value="admin">
    </form>
    <div id="wrap">
        <!-- 메인 -->
        <div class="main">
            <!-- 탑박스 -->
            <div class="topbox">
                <!-- 코인그래프 -->
                <div id="coinGraph">
                <h2>코인 그래프</h2>
                <!-- 코인 그래프 박스 영역=========== -->
                <div class="graph" id="coin1">1</div>
                <!-- //코인 그래프 박스 영역=========== -->
            </div>
            <!-- //주요 코인 시세=========================== -->

                <!-- 코인시세 -->
                <div class="coinPrice">
                    <table id="coinPrice2" class="tablesorter">
                        <thead class="priceIndex">
                           <tr>
                             <th><a href="#">코인명</a></th>
                             <th><a href="#">현재가<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
                             <th><a href="#">전일대비<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
                             <th><a href="#">거래대금<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
                           </tr>   
                        </thead>   
                        <tbody class="fullCoin">
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
                    <table id="uicTable">
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
