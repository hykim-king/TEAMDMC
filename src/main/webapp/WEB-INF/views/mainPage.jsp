<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>    
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
    <!-- jQuery cdn -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="${CP_RES }/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES }/js/eclass.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
        
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

        for(let a = 0; a < 6; a++){
            let marketArr = ["KRW-BTC", "KRW-ETH", "KRW-XRP", "KRW-ADA", "KRW-SOL", "KRW-DOGE"];
            let settings2 = {
                    "async": true,
                      "crossDomain": true,
                      "url": "https://api.upbit.com/v1/candles/minutes/1?market="+marketArr[a]+"&count=1",
                      "method": "GET",
                      "headers": {
                      "Accept": "application/json"
                      }
            };
        
            $.ajax(settings2).done(function (response1) {
                let htmlData = "";
                let array = [0, 1, 32, 47, 249, 232];
                
                for(let i = 0; i < array.length; i++){
                    
                    let value = array[i];
                    htmlData += "<tr>                                                                                          ";
                    htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+"시가 : "+response1[value].opening_price+ "</td>";
                    htmlData += "<tr>                                                                                          ";
                    htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+"고가 : "+response1[value].high_price+ "</td> ";
                    htmlData += "<tr>                                                                                          ";
                    htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+"저가 : "+response1[value].low_price+ "</td> ";
                    htmlData += "<tr>                                                                                              ";
                    htmlData += " <td class='text-left   col-sm-2 col-md-2 col-lg-2'>"+"종가 : "+response1[value].trade_price+ "</td> ";
                    htmlData += "<tr>                                                                                           ";
                    
                    $("#coin"+(a+1)).append(htmlData);
                    
                    htmlData = "";
                }
            });
        }
        function convertDateFormat(date) {
            let year = date.getFullYear();
            let month = date.getMonth() + 1;
            month = month >= 10 ? month : '0' + month;
            let day = date.getDate();
            day = day >= 10 ? day : '0' + day;
            return [year, month, day].join('');
        }

        let pubdate = new Date();
        let convertedDate = convertDateFormat(new Date());
        console.log(pubdate);
        console.log(convertedDate);  
        
        $("#date").append(convertedDate);
      
            /* 클릭 이벤트로 ajax
            console.log("doRetrieve");
            let url = "${CP}/naver/doRetrieve.do";
            let method = "GET";
            let async = true;
            let parameters = {};
            
            EClass.callAjax(url, parameters, method, async, function(data) {
                console.log("EClass.callAjax.data"+ data);
                let parsedData = data;
                let htmlData = ""; //동적으로 tbody아래 데이터 생성
                
                $("#blog_table > tbody").empty();//기존 데이터 삭제
                
                //조회 데이터가 있는 경우
                if(null != parsedData && parsedData.length > 0){
                    $.each(parsedData, function(i, item) {
                        console.log("item"+ item);
                        htmlData += " <tr>                                                                        ";
                        htmlData += " <td class='text-left col-sm-7 col-md-7 col-lg-9'>  "+<c:out value='item.title'/>+"</td>   ";
                        htmlData += " </tr>                                                                       ";
                      });
                }else{
                    htmlData += " <tr>                                                      ";
                    htmlData += "   <td colspan='99' class='text-center'>No data found</td> ";
                    htmlData += " </tr>                                                     ";
                }
                //조회 데이터가 없는 경우
                $("#blog_table > tbody").append(htmlData);
                
            }); */
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
#coin a{
    text-decoration: none; color: black;
}
</style>
<title>Insert title here</title>

</head>


<body>
    <%@include file="header.jsp" %>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    <!-- 전체 div======================================================================== -->
    <div id="wrap">
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
                                        <td name="date"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <!-- //코인 뉴스=========================== -->
        </div>
    </div>
    <!-- //전체 div======================================================================== -->
    <%@include file="footer.jsp" %>

</body>
</html>