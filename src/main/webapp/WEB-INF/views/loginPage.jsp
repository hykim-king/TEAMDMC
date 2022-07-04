<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="resources" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${resources}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="/studyhtml5/favicon.ico">

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- 사용자 정의 function, ISEmpty -->
    <script src="${CP_RES}/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES}/js/eclass.js"></script>

<!--reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css"> -->
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

.LoginFrm {
	width: 90%;
	height: 400px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.loginbox {
	width: 60%;
	height: auto;
	margin: 0 auto;
}

.idbox {
	width: 500px;
	margin: 0 auto;
	margin-top: 20px;
}

.idbox input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.idbox label {
	text-align: left;
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
}

.msgErr1, .msgErr2 {
	color: #37385d;
	margin-top: 0;
	text-align: left;
	margin-left: 100px;
	font-size: 13px;
}

.pwbox {
	width: 500px;
	margin: 0 auto;
	margin-top: 20px;
}

.pwbox input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.pwbox label {
	text-align: left;
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
}

.bt {
	width: 300px;
	display: flex;
	justify-content: space-around;
	margin: 0 auto;
	padding-top: 20px;
}

.bt input {
	background: white;
	border: 1px solid #333;
	border-radius: 2px;
	width: 100px;
	height: 30px;
}
</style>

<title>KEMIE-로그인</title>
            
        <script type="text/javascript">
      $(document).ready(function(){
        console.log("document.ready");  
        
        
        //숫자만 입력
        //속성
        // $("input:text[numberOnly]").on("keyup",function(e){
        //      console.log("$(this).val():"+$(this).val());  
        //});
        
        //검색어 Enter
/*         $("#passwd").on("keypress",function(e){
            console.log("passwd"+e.which);  
            if(13==e.which){
                e.preventDefault();
              //trigger통한 호출: 로그인 호출
                $( "#doLogin" ).trigger( "click" );
            }
        }); */
        
        
        $("#doLogin").on("click",function(){
            console.log("doLogin");
            
            if(eUtil.ISEmpty($("#uId").val())){
                alert("아이디를 입력 하세요.")
                $("#uId").focus();
                return;
            }
            
            if(eUtil.ISEmpty($("#passwd").val())){
                alert("비밀번호를 입력 하세요.")
                $("#passwd").focus();
                return;
            }           
            
            if(confirm("로그인 하시겠습니까?")==false)return;
            
            let url = "${CP}/login/doLogin.do";
            let method = "POST";
            let async  = true;
            let parameters = {
                    "uId": $("#uId").val(),
                    "passwd":$("#passwd").val()
            };
            
            EClass.callAjax(url, parameters, method, async, function(data) {
                
                if("10" == data.msgId){//ID확인
                    alert(data.msgContents);
                    $("#uId").focus();
                }else if("20" == data.msgId){//비번확인
                    alert(data.msgContents);
                    $("#passwd").focus();
                }else if("30" == data.msgId){//id/비번 통과
                    alert(data.msgContents);
                    //특정페이지로 이동: main
                    
                    window.location.href ="${CP}/main/mainView.do";
                    
                }else{
                    alert(data.msgContents);
                    $("#uId").focus();
                } 
                
            });
            
        });//doLogin========================================
        
/*         
        $("#forgetPw").on("click", function() {
            console.log("forgetPass");
        });
        
         */  
      });
    </script>
    
</head>

<body>
    <%@include file="header.jsp" %>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    <div id="wrap">
        <form action="${CP}/login/doLogin.do" class="LoginFrm" method="post">
            <h1>로그인</h1>
            <!-- 아이디, 비밀번호 미 입력시 validation -->
            <div class="loginbox">
                <div class="idbox">
                    <label for="uId">아이디</label> 
                    <input id="uId" type="text" placeholder="아이디를 입력하세요">
                    <p class="msgErr1">아이디를 입력하세요.</p>
                </div>
                <div class="pwbox">
                    <label for="passwd">비밀번호</label>
                    <input id="passwd" type="password" placeholder="비밀번호를 입력하세요">
                    <p class="msgErr2">아이디 또는 비밀번호를 잘못 입력했습니다.</p>
                </div>
            </div>
            <div class="bt">
                <input type="button" value="비밀번호 찾기" name="forgetPw" id="forgetPw" >
                <input type="button" value="로그인" name="doLogin" id="doLogin" onclick="doLogin();" >
<!--                 <button id="forgetPw">비밀번호찾기</button>
                <button id="doLogin">로그인</button> -->
            </div>
        </form>
    </div>
    <%@include file="footer.jsp" %>
    
</body>
</html>