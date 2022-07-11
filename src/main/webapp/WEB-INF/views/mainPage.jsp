<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>    
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="${CP_RES }/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <!-- 사용자 정의 function, isEmpty -->
    <script src="${CP_RES }/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES }/js/eclass.js"></script>
    
    <script src="${CP_RES }/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${CP_RES }/js/jquery.bootpag.js"></script>
    <!-- google chart  -->
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <!-- jquery_bootstrap paging -->
    <script type="text/javascript" src="${CP_RES}/js/jquery.bootpag.js"></script>

 <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawCharts);
    console.log(google.charts)
    
        //코인이름
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
            let array = [0, 1, 32, 47, 249, 232];
            
            for(let i = 0; i < array.length; i++){
                $("#coin"+(i+1)).empty();
                
                let value = array[i];
                
                htmlData += "<tr>                                                                                       ";
                htmlData += " <td class='text-center col-sm-1 col-md-1 col-lg-1'>"+ response[value].market +"</td>      ";
                htmlData += "<tr>                                                                                       ";
                htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+ response[value].korean_name +"</td> ";
                htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+ response[value].english_name +"</td>";
                htmlData += "<tr>                                                                                       ";
                
                $("#coin"+(i+1)).append(htmlData);
                
                htmlData = "";
            }
        });
        
        //주요코인 차트
        function drawCharts() {
            for(let a = 0; a < 6; a++){
                let marketArr = ["KRW-BTC", "KRW-ETH", "KRW-XRP", "KRW-ADA", "KRW-SOL", "KRW-DOGE"];
                let marketkoreaArr = ["비트코인", "이더리움", "리플", "에이다", "솔라나", "도지코인"];
                let settings2 = {
                        "async": true,
                        "crossDomain": true,
                        "url": "https://api.upbit.com/v1/candles/minutes/60?market="+marketArr[a]+"&count=30",
                        "method": "GET",
                        "headers": {
                        "Accept": "application/json"
                        }
                };
            
                $.ajax(settings2).done(function (response1) {
                let htmlData = "";
                let array = [0, 1, 32, 47, 249, 232];
                
                response1.reverse();
                
                // 업비트 캔들 데이터를 구글차트 캔들스틱 table 데이터 양식에 맞게 변경하는 작업
                var candleData = response1.map(function(data) {
                    var time = new Date(data.candle_date_time_kst);
                    var printTime = `${time.getHours()}:00`

                    return [time, data.low_price, data.opening_price, data.trade_price, data.high_price];
                });

                // 현재 배열을 구글차트가 읽을 수 있는 DataTable 타입으로 변경
                var visualizedData = google.visualization.arrayToDataTable(candleData, true);

                var options = {
                    legend: 'none',
                    title: marketkoreaArr[a],
                    titlePosition: 'out',
                };

                // 해당 element ID 에 차트를 출력
                var chart = new google.visualization.CandlestickChart(document.getElementById('coin'+(a+1)));

                chart.draw(visualizedData, options);
            });  
                
                
        }
    }
        $(document).ready(function(){
        	//차트 클릭시 거래소 이동
        	for(let i = 0; i <= 6; i++){
		        $("#coin"+(i+1)).on("click", function(){
		        	console.log("거래소");
		        	window.location.href = "${CP}/exchange.do";
		        });
        	}
        	
        });
        
    </script>
<head>

<link rel="shortcut icon" type="image/x-icon"
    href="/studyhtml5/favicon.ico">

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
    height: 1250px;
    position: relative;
    color: #333;
}
.box {
    width: 90%;
    position: absolute;
    left :50%;
    transform: translate(-50%);
    top: 400px;
}    
.mainpageimg {
    background-image: url("${CP_RES}/img/mainpageimg.jpg");
    text-align: center;
    background-size: cover;
    width: 100%;
    height: 400px;
    position: absolute;
    top: 0;
    left: 0;
}
.imgbox {
    width: 100%; height: 100%; background: white; opacity: 0.7;
    position: absolute; top: 0; left: 0;
       z-index: 1;}

.imgtext {width: 100%;
    position: absolute;
    top: 140px;
    z-index: 99;}
    
    
.mainpageimg h3{
    font-size: 35px;

}
.mainpageimg p{
    margin-top: 30px;

}

.mainpageimg h2{
    margin-top: 10px;
    font-size: 40px;
}

#coinGraph {
    width: 100%;
    height: 500px;
    margin: 0 auto;
    text-align: center;
    margin-top: 50px;
}

#coinGraph h2 {
    font-size: 30px;
    border-bottom: 1px solid lightgray;
    padding-bottom: 15px;
}
.graphBox {
    margin-top: 20px;
    width: 100%;
    display: flex;
    justify-content: space-between;
}
.graph {
    width: 60%;
    height: 200px;
}

#coinNews {
    width: 100%;
    height: 200px;
    margin: 0 auto;
    margin-top: 60px;
    margin-bottom: 50px;
    
}
#coinNews h2 {
    margin-top: 10px;
    margin-bottom: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid lightgray;
}
.newsArea .newsone {
    display: flex;
    width: 90%;
    justify-content: space-between;
    margin: 0 auto;
    margin-top: 10px;
    font-size: 15px;
}
#coin a{
    text-decoration: none; color: black;
    font-size: 15px;
}
.date{
    text-align: right;
    font-size: 15px;
}
.graph:hover {
    transform: scale(1.1);
    transition: transform .5s;
}
#coin{
    width: 100%;
    margin-bottom: 50px;
}
</style>
<title>KEMIE</title>

</head>


<body>
    <%@include file="header.jsp" %>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    <!-- 전체 div======================================================================== -->
    <div id="wrap">
        <div class="mainpageimg">
           <div class="imgbox"></div>
           <div class="imgtext">
           <h3>한국 전자 화폐 투자 거래소</h3>
           <p>Korea Electronic Money Investment Exchange</p> 
           <h2>KEMIE</h2>
           </div>
         </div>
        <div class="box">
            <!-- 주요 코인 시세=========================== -->
            <div id="coinGraph">
                <h2>주요 코인 시세</h2>
                <!-- 코인 그래프 박스 영역=========== -->
                <div class="graphBox">
                    <div class="graph" id="coin1">1</div>
                    <div class="graph" id="coin2">2</div>
                    <div class="graph" id="coin3">3</div>
                </div>
                <div class="graphBox">
                    <div class="graph" id="coin4">4</div>
                    <div class="graph" id="coin5">5</div>
                    <div class="graph" id="coin6">6</div>
                </div>
                <!-- //코인 그래프 박스 영역=========== -->
            </div>
            <!-- //주요 코인 시세=========================== -->

            <!-- 코인 뉴스=========================== -->
            <div id="coinNews">
                <h2>코인 뉴스</h2>
                <table id="coin">
                    <thead>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${list.size()>0}">
                                <c:forEach var="vo" items="${list}">
                                    <tr>
                                        <td><a href="${vo.link}">${vo.title}</a></td>
                                        <td class="date">${vo.pubDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <!-- //코인 뉴스=========================== -->
        <!-- pagenation -->
        <div class="text-center col-sm-12 col-md-12 col-lg-12">
            <div id="page-selection" class="text-center page"></div>
        </div>
        <!-- pagenation ---------------------------------------->
        </div>
    </div>
    <!-- //전체 div======================================================================== -->
    <%@include file="footer.jsp" %>

</body>
</html>