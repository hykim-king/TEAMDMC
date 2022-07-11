<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>
<!-- Html comment -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<style>
@import
  url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
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
  color: #333;
}

.container {
  width: 100%;
  height: 800px;
  /* padding top> right> bottom> left */
  position: relative;
  color: #333;
}

.mainBox {
  width: 90%;
  height: 730px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}

/* 사용자 보유 자산 div */
#userBalancesDiv {
  width: 30%;
  height: 620px;
  border: 1px solid #333;
  box-sizing: border-box;
  overflow-y: scroll;
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

.userBalancesTable thead td {text-align: center;}
.userBalancesTable thead td:nth-child(1) {width: 35%;}
.userBalancesTable thead td:nth-child(2) {width: 30%;}
.userBalancesTable thead td:nth-child(3) {width: 45%;}
.uBTBody>tr { cursor: pointer; }
.uBTBody .right {text-align: right; padding-right: 5px;}
.uBTBody .left {padding-left: 5px;}

/* 메인 입출금 div */
#mainBalancesDiv {
  width: 30%;
  height: 620px;
  border: 1px solid #333;
  box-sizing: border-box;
}

#mainBalancesDiv label {
  margin-left: 10px;
}

.mainBalancesTab>ul>li {
  box-sizing: border-box;
  cursor: pointer;
  text-align: center;
  border-collapse: collapse;
}

.mainBalancesTab>ul>li:nth-child(1) {
border-right: 1px solid #333;
}
.mainBalancesTab>ul>li:nth-child(2) {
border-right: 1px solid #333;
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
  box-sizing: border-box;
}

.mainBalancesTabContextDivB, .mainBalancesTabContextDivC {
  width: 95%;
  margin: 0 auto;
  display: none;
  box-sizing: border-box;
}

.mainBalancesTabContextDivAInputDiv, .mainBalancesTabContextDivBInputDiv,
  .mainBalancesTabContextDivCInputDiv {
  width: 95%;
  margin: 0 auto;
  margin-top: 10px;
  font-size: 15px;
}

..mainBalancesTabContextDivAInputDiv input, .mainBalancesTabContextDivBInputDiv input,
  .mainBalancesTabContextDivCInputDiv input {

 margin-left: 10px;
  height: 30px;
  border: 1px solid #333;
  border-radius: 2px;
  }

.mainBalancesTabContextDivAInputDiv label, .mainBalancesTabContextDivBInputDiv label,
  .mainBalancesTabContextDivCInputDiv label {
  width: 100px;
  }

.mainBalancesTabContextDivAWarnning, .mainBalancesTabContextDivBWarnning,
  .mainBalancesTabContextDivCWarnning {
  width: 90%;
  margin: 0 auto;
  margin-top: 20px;
  font-size: 13px;
}

.mainBalancesTabContextDivAWarnning p, .mainBalancesTabContextDivBWarnning p,
  .mainBalancesTabContextDivCWarnning p {
  margin-top: 10px;
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
  font-size: 15px;
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

.mainBalacesTabButton {
  width: 100px;
  padding-top: 20px;
  margin: 0 auto;
}

.amountBtn{
  width: 100px;
  background: #37385d;
  color: white;
  height: 30px;
  border-radius: 2px;
   margin: 0 auto;
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
.contextTopofTop label {width: 100px;}
.contextTopofTop p {float: right;}

.contextBottomofBottom label {width: 100px;}
.contextBottomofBottom p {float: right;}

/* 코인 시세 div */
#coinCharDiv {
  width: 30%;
  height: 620px;
  border: 1px solid #333;
  box-sizing: border-box;
}

#cointableDiv {
  width: 100%;
  height: 620px;
  overflow-y: scroll;
  font-size: 14px;
}

#cointableHeaderDiv {
  margin-top: 20px;
  width: 100%;
}

#cointableHeaderDiv {
  margin-top: 20px;
  width: 100%;
}

#cointable {border-collapse: collapse;}

#cointableHeader th{
  position: sticky;
  top: 0px;
  background-color: lightgray;
  height: 20px;
}
#cointableHeader a {font-weight: bold; font-size:15px;}
#cointableHeader a:hover{font-size:15px;}
td {
  height: 30px;
  border: 1px solid lightgray;
  padding: 0 10px 0 10px;
}

td:nth-child(1) {
  width: 30%;
}

td:nth-child(2) {
  width: 22%;
  text-align: right;
}

td:nth-child(3) {
  width: 22%;
  text-align: right;
}
td:nth-child(4) {
  width: 26%;
  text-align: right;
}

.contextTopofTop, .contextBottomofBottom {
  width: 95%;
  margin: 0 auto;
  height: 30px;
}

.contextBottomofBottom {margin-top: 10px;}
.contextTop, .contextBottom {
  width: 95%;
  margin: 0 auto;
  display: flex;
  height: 30px;
  align-items: center;
  justify-content: space-between;
}

.contextBottom input {
  width: 250px; height : 30px;
  border: 1px solid #333;
  border-radius: 2px;
  box-sizing: border-box;
  height: 30px;
}

.pbtbox {padding-top: 10px; display: flex; justify-content: space-between;
width: 95%; margin: 0 auto;}

.pbtbox .pricebt {
    width: 70px; height: 30px; 
    border: 1px solid #333;
    border-radius: 2px;
    box-sizing: border-box;
    height: 30px;
}

.mainBalancesTabContextDivCWarnning {
  width: 100%;
  height: 350px;
  overflow-y: scroll;
}

</style>

<title>KEMIE</title>
<!-- reset.css를 직접참조하여 가져오기 
    <link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css"> -->

<!-- jQuery를 직접참조하여 설정 -->
<!-- <script type="text/javascript" src="/studyhtml5/asset/js/jquery-1.12.4.js"></script> -->

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 직접참조하여 favicon설정 -->
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml5/favicon.ico">
<!-- 사용자 정의 function, ISEmpty -->
<script src="${CP_RES}/js/eUtil.js"></script>
<!-- 사용자 정의 function, callAjax -->
<script src="${CP_RES}/js/eclass.js"></script>
<!-- 자바스크립트 -->
<script type="text/javascript">
      /* 자바스크립트 코드 */
      function getDepo(){
    	  $("#getDepoTableBody").empty();
    	  
          let url = "${CP}/getDeposit.do";
          let method ="GET";
          let async  = true;
          let parameters = {
              "currency": $('.mainBalancesTitle').text().substr(0, $('.mainBalancesTitle').text().lastIndexOf(" "))  
          };
          
          EClass.callAjax(url, parameters, method, async, function(data) {
            let parseData = data;
            let htmlData="";
            
            if(!eUtil.ISEmpty(parseData)){
                $.each(data, function(index, value){
                  htmlData += "<tr>                                   ";
                  htmlData += "  <td class='text-center'>"+value.amount+"&nbsp;"+value.currency+"</td>";
                  
                  if(value.transaction_type == "default") value.transaction_type = "일반입금";
                  else value.transaction_type = "바로입금";
                  
                  htmlData += "  <td class='text-center'>"+value.transaction_type+"</td>";
                  htmlData += "  <td class='text-center'>"+value.created_at+"</td>";
                  
                  if(eUtil.ISEmpty(value.done_at)==true || value.done_at == null ) value.done_at = "입금 실패";
                  
                  htmlData += "  <td class='text-center'>"+value.done_at+"</td>";
                  htmlData += "</tr>                                  ";  
                });
            }else htmlData += " <tr><td colspan='99' class='text-center'>No data found</td></tr>" ;
            
            $("#getDepoTableBody").append(htmlData);
          })
        }
        
        function getWithdraws(){
        	$("#getDepoTableBody").empty();
        	
              let url = "${CP}/getWithdraws.do";
              let method ="GET";
              let async  = true;
              let parameters = {
                  "currency": $('.mainBalancesTitle').text().substr(0, $('.mainBalancesTitle').text().lastIndexOf(" "))  
              };
              
              EClass.callAjax(url, parameters, method, async, function(data) {
                let parseData = data;
                let htmlData="";
                
                if(!eUtil.ISEmpty(parseData)){
                    $.each(data, function(index, value){
                      console.log(index+", "+value.created_at);
                      htmlData += "<tr>                                   ";
                      htmlData += "  <td class='text-center'>"+value.amount+"&nbsp;"+value.currency+"</td>";
                      
                      if(value.transaction_type == "default") value.transaction_type = "일반출금";
                      else value.transaction_type = "바로출금";
                      
                      htmlData += "  <td class='text-center'>"+value.transaction_type+"</td>";
                      htmlData += "  <td class='text-center'>"+ value.created_at +"</td>";
                      
                      if(eUtil.ISEmpty(value.done_at)==true || value.done_at == null ) value.done_at = "출금 실패";
                      
                      htmlData += "  <td class='text-center'>"+value.done_at+"</td>";
                      htmlData += "</tr>                                  ";  
                    });
                }else htmlData += " <tr><td colspan='99' class='text-center'>No data found</td></tr>" ;
                
                $("#getDepoTableBody").append(htmlData);
              })
            }
      
      $(document).ready(function(){
    	  
    	  $("#depoSelectValue").on("change", function(){
              // depoSelectValue
              //     10: 입금 내역
              //     20: 출금 내역
              if( $('#depoSelectValue').val() == 10) getDepo();
              if( $('#depoSelectValue').val() == 20) getWithdraws();
    	  });
    	  
        $(".amount").on("keypress", function(e){
          console.log(".amount: "+e.which);
          
          if(13==e.which){
            
            if($(this).parents().attr("class", "mainBalancesTabContextDivA")) {
              if($(this).val() < 5000) {
            	  alert("최소 입금 금액은 5000원입니다.");
            	  return;
              }
              else {
                if(confirm("원화 입금 금액은 "+$(this).val()+"입니다. 정말 입금하시겠습니까?")==false)return;
                
                let url = "${CP}/depositKRW.do";
                let method ="POST";
                let async  = true;
                let parameters = {
                    "amount": $(this).val()  
                };
                
                EClass.callAjax(url, parameters, method, async, function(data) {
                  console.log('data:'+data);
                  if("1" == data){
                  $('.mainBalancesTabContextDivA').css('display', 'none');
                  $('.mainBalancesTabContextDivB').css('display', 'none');
                  $('.mainBalancesTabContextDivC').css('display', 'none');
                  
                  $('.contextBottom input[type="text"]').removeClass('amount');
                  
                  $('.mainBalancesTabContextDivC').css('display', 'block');
                  $('.mainBalancesTabContextDivC .contextBottom input[type="text"]').addClass('amount');
                  
                  alert("입금 요청 성공!"); 
                  }else {
                	  alert("입금 요청 실패!");
                	  return;
                  }
                  });
              }
            }
            
            if($(this).parents().attr("class", "mainBalancesTabContextDivB")) {
              
            }
          }
          });
        
        $(".uBTBody>tr").click(function(){
          console.log($(this), "click!");

          if($(this).children().eq(0).text() == "KRW"){
            $('.mainBalancesTitle').text('KRW 입출금');
            $('.mainBalancesContextValueDivOwn').text('보유금액');
            $('#mBTa').children().eq(0).text('KRW충전');
            $('.mainBalancesTabContextDivBInputDiv').css('display', 'block');
          }
          else {
            $('.mainBalancesTitle').text($(this).children().eq(0).text()+' 입출금');
            $('.mainBalancesContextValueDivOwn').text('보유수량');
            $('#mBTa').children().eq(0).text('입금주소');
            $('.mainBalancesTabContextDivBInputDiv').css('display', 'none');
          }
          
          if( $('#depoSelectValue').val() == 10) getDepo();
          if( $('#depoSelectValue').val() == 20) getWithdraws();
          
          $('.mainBalancesContextValueDivOwnValue').text($(this).children().eq(1).text()+" "+$(this).children().eq(0).text());
          $('.mainBalancesContextValueDivWaitValue').text($('.uBTBody').children().eq(0).val()+" "+$(this).children().eq(0).text());
          
        });
        
        /* a태그의 id의 마지막 문자열을 추출하여 원하는 div on */
        $(".mainBalancesTab li[id *= 'mBT']").click(function(){
          let mBTLastWord = ($(this).attr("id")).substr(($(this).attr("id")).length -1);
          
          $('.mainBalancesTabContextDivA').css('display', 'none');
          $('.mainBalancesTabContextDivB').css('display', 'none');
          $('.mainBalancesTabContextDivC').css('display', 'none');
          
          $('.contextBottom input[type="text"]').removeClass('amount');
          
          switch(mBTLastWord){
          case 'a':
            $('.mainBalancesTabContextDivA').css('display', 'block');
            $('.mainBalancesTabContextDivA .contextBottom input[type="text"]').addClass('amount');
            
            console.log('mainBalancesTabContextDivA의 class에 on추가하기');
            
            break;
            
          case 'b':
            $('.mainBalancesTabContextDivB').css('display', 'block');
            $('.mainBalancesTabContextDivB .contextBottom input[type="text"]').addClass('amount');
            console.log('mainBalancesTabContextDivB의 class에 on추가하기');
            break;
            
          case 'c':
            $('.mainBalancesTabContextDivC').css('display', 'block');
            
            console.log('mainBalancesTabContextDivA의 class에 on추가하기');
            
            // depoSelectValue
            //     10: 입금 내역
            //     20: 출금 내역
            if( $('#depoSelectValue').val() == 10) getDepo();
            if( $('#depoSelectValue').val() == 20) getWithdraws();
            
            break;
            default:
              console.log("선언되지 않은 div");
              return;
          }
        });

        $(".amountBtn").click(function(){
          console.log(".amountBtn Clicked!!");
          console.log($('.amount').val());
          
          if($(this).parents().attr("id", "mainBalancesTabContextDivA")){
            if($('.amount').val() < 5000) alert("최소 입금 금액은 5000원입니다.");
            else {
              if(confirm("원화 입금 금액은 "+$(this).val()+"입니다. 정말 입금하시겠습니까?")==false)return;
              
              let url = "${CP}/depositKRW.do";
              let method ="POST";
              let async  = true;
              let parameters = {
                  "amount": $(this).val()  
              };
              
              EClass.callAjax(url, parameters, method, async, function(data) {
                console.log('data:'+data);
                if("1" == data){
                $('.mainBalancesTabContextDivA').css('display', 'none');
                $('.mainBalancesTabContextDivB').css('display', 'none');
                $('.mainBalancesTabContextDivC').css('display', 'none');
                
                $('.contextBottom input[type="text"]').removeClass('amount');
                
                $('.mainBalancesTabContextDivC').css('display', 'block');
                $('.mainBalancesTabContextDivC .contextBottom input[type="text"]').addClass('amount');
                
                alert("입금 요청 성공!"); 
                }else alert("입금 요청 실패!");         
              });
            }
          }
        });
      });
    </script>
</head>
<body>
  <!-- header --------------------------------------------------------------->
  <%@include file="header.jsp"%>
  <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
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
          <h3 class="uTB">${sum} 원</h3>
        </div>
        <!-- userTotalBalances end -------------------------------------------->

        <!-- userBalancesDiv -------------------------------------------------->
        <div class="userBalancesTableDiv">
          <!-- userBalances table ------------------------------------------->
          <table class="userBalancesTable">
            <thead>
              <tr>
                <td>코인명</td>
                <td>보유 수량</td>
                <td>평가 금액</td>
              </tr>
            </thead>
            <tbody class="uBTBody">
              <c:choose>
         <%-- data가 있는 경우 --%>
         <c:when test="${list.size()>0}">
           <c:forEach var="vo" items="${list }" varStatus="status">
             <input type="hidden" value="${vo.locked}">
             <tr>
               <td>${vo.currency }</td>
               <td class="right">${vo.balance }</td>
               <td class="right">${Math.round(mListList.get(status.index).get(0).getTrade_price() * vo.balance)} ${vo.unit_currency}</td>
             </tr>
           </c:forEach>
         </c:when>
         <%-- data가 없는 경우 --%>
         <c:otherwise>
           <tr>
             <td colspan="99" class="text-center">no data found</td>
           </tr>
         </c:otherwise>
        </c:choose>
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
            <label class="mainBalancesContextValueDivOwn">보유금액</label>
            <label class="mainBalancesContextValueDivOwnValue">${list.get(0).balance} KRW</label>
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
              <label>연계계좌</label><p>10*******2332 코리아뱅크</p><p>홍길동</p>
            </div>
            <div class="contextBottom">
              <!-- 아래 placeholder의 값은 선택한 코인에 따라 달라짐 -->
              <label>입금금액</label><input type="text" class="amount" placeholder="최소 5,000KRW" />
            </div>
          </div>
          <!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

          <div class="mainBalancesTabContextDivAWarnning">
           <p>KRW 입금 신청 시 연결된 실명 확인 계좌에서 신청 금액 만큼 출금이체 됩니다.</p>
           <p>원화 입급 금액 만큼 24시간 동안 가상 자산 출금이 제한됩니다.</p>
           <p>점검 시간에는 진행이 원활하지 않을 수 있습니다.</p>
           <p>입금 가능 금액은 연결된실명확인 계좌의 출금 가능 금액과 동일하며, 연결 계좌의 이체 한도 범위등을 벗어나는 경우 입금이 정상적으로 진행되지 않을 수 있습니다.</p>
          </div>
          <div class="mainBalacesTabButton">
            <input type="button" class="amountBtn" name="amountBtn" value="입금 신청"/>
          </div>
        </div>
        <!--// mainBalancesTabContextDivA end ---------------------------------------->
        <!-- mainBalancesTabContextDivB ---------------------------------------------->
        <div class="mainBalancesTabContextDivB">

          <!-- mainBalancesTabContextDivAInputDiv ---------------------------------->
          <div class="mainBalancesTabContextDivBInputDiv">
            <div class="contextTopofTop">
              <label>출금가능</label><p>${list.get(0).balance} KRW</p>
            </div>
            <div class="contextTop">
              <label>출금계좌</label><p>10*******2332 코리아뱅크</p><p>홍길동</p>
            </div>
            <div class="contextBottom">
              <!-- 아래 placeholder의 값은 선택한 코인에 따라 달라짐 -->
              <label>출금금액</label><input type="text" placeholder="최소 5,000KRW" />
            </div>
              <div class="pbtbox">
              <input type="button" class="pricebt" value="25%" />
              <input type="button" class="pricebt" value="50%" />
              <input type="button" class="pricebt" value="최대" />
              <input type="button" class="pricebt" value="10%" />
              </div>
            <div class="contextBottomofBottom">
              <div><label>출금수수료(부가세 포함)</label><p>1,000 KRW</p></div>
              <div><label>총출금(수수료 포함)</label><p>1,000 KRW</p></div>
            </div>
          </div>
          <!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

          <div class="mainBalancesTabContextDivBWarnning">
           <p>고객 확인 미등록 계정은 원화 출금이 불가합니다.</p>  
           <p>출금 신청 시 심사가 진행되며 심사 결과에 따라 본인확인 후 최대 72시간 지연될 수 있으며 부정 거래가 의심될 경우 출금이 제한될 수 있습니다.</p>
           <p>출금 수수료 1,000원이 별도 부과됩니다.</p>
           <p>출금 시스템 점검 시간 및 은행별 점검 시간에는 출금 요청을 하실 수 없으니 유의하시기 바랍니다.</p>    
          </div>
          <div class="mainBalacesTabButton">
            <input type="button" class="amountBtn" name="amountBtn" value="출금 신청"/>
          </div>
        </div>
        <!--// mainBalancesTabContextDivB end ---------------------------------------->
        <!-- mainBalancesTabContextDivC ---------------------------------------------->
        <div class="mainBalancesTabContextDivC">

          <!-- mainBalancesTabContextDivAInputDiv ---------------------------------->
          <div class="mainBalancesTabContextDivCInputDiv">
            <div class="selectDiv" style="float:right;">
              <select id="depoSelectValue">
	              <option value="10" selected="selected">입금</option>
	              <option value="20">출금</option>
              </select>
              <hr/>
            </div>
          </div>
          <!--// mainBalancesTabContextDivAInputDiv end ---------------------------->

          <div class="mainBalancesTabContextDivCWarnning">
            <table>
            <tbody id="getDepoTableBody">
            </tbody>
            </table>
          </div>
        </div>
        <!--// mainBalancesTabContextDivC end ---------------------------------------->
        
      </div>
      <!--// mainBalancesDiv end ----------------------------------------------------->

      <!-- coinChartDiv -------------------------------------------------------------->
      <div id="coinCharDiv">
        <div id="cointableDiv">
      <table id="cointable">
          <thead id="cointableHeader">
          <tr>
          <th><a href="#">코인명</a></th>
          <th><a href="#">현재가<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
          <th><a href="#">전일대비<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
          <th><a href="#">거래대금<img src="${CP_RES}/img/exchange.icon2.png" alt=""></a></th>
          </tr>
        </thead> 
          <tbody id="fullCoin">
           <c:choose>
           <c:when test="${tickerList.size()>0}">
             <c:forEach var="ticker" items="${tickerList}">
             <tr>
               <td>${ticker.market}</td>
               <td><fmt:formatNumber value="${ticker.trade_price}" pattern="###,###,###,###" /></td>
               <td><fmt:formatNumber value="${ticker.signed_change_rate*100}" pattern="0.000"/>%</td>
               <td><fmt:formatNumber value="${Math.ceil(ticker.acc_trade_price_24h/1000000)}" pattern="###,###,###,###" />백만</td>
             </tr>
             </c:forEach>
           </c:when>
           <c:otherwise>
             <tr><td colspan="99" class="text-center">no data found</td></tr>
           </c:otherwise>
           </c:choose>
          </tbody>
      </table>
    </div>
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
