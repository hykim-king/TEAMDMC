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

<!-- jQuery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- 사용자 정의 function, ISEmpty -->
    <script src="${CP_RES}/js/eUtil.js"></script>
    <!-- 사용자 정의 function, callAjax -->
    <script src="${CP_RES}/js/eclass.js"></script>

<!--reset 스타일 시트 -->
<!--<link rel="stylesheet" type="text/css" href="/studyhtml5/asset/css/reset.css">  -->
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<!--스타일 시트 -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

</style>

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

.txtbox {
	width: 500px;
	height: 630px;
	font-size: 16px;
	margin: 0 auto;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.txtbox h1 {
	margin-bottom: 20px;
}

.box {
	width: 100%;
	height: 80px;
}

.box input {
	width: 400px;
	display: block;
	box-sizing: border-box;
	height: 30px;
	border: 1px solid #dedede;
}

.box label {
	width: 100px;
	height: 30px;
	line-height: 30px;
	display: block;
	float: left;
	text-align: left;
}

.msgErr1, .msgErr2, .msgErr3 {
	color: #37385d;
	margin-top: 0;
	text-align: left;
	margin-left: 100px;
	font-size: 13px;
}

.gaib {
	width: 100%;
	height: 50px;
	text-align: center;
	margin-top: 20px;
}

.gaib input {
	width: 90px;
	height: 50px;
	margin: 0 auto;
	border: 1px solid #333;
	background: white;
	border-radius: 2px;
}

 #idCheck{
    width: 80px;
    height: 30px;
    border-radius: 15px;
    text-align: center;
    font-size: 13px;
    background: #38385d;
    color: white;
    float: right;
 }

 #nickCheck{
    width: 80px;
    height: 30px;
    border-radius: 15px;
    text-align: center;
    font-size: 13px;
    background: #38385d;
    color: white;
    float: right;
 }
 
</style>
<title>KEMIE-회원가입</title>

    <script type="text/javascript">
    
    $(document).ready(function(){
/*         function checkForm() {
            var empC = /\s/g;
            var nameRegExp = /^[가-힣]{2,5}$/;
            var idRegExp = /^[a-zA-z0-9]{4,20}$/;
            var nickC = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
            var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{5,}$/;
            var phoneExp /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
            }
        }//checkForm========================================= */
        
        //=======등록
        $("#doInsert").on("click",function(){
            console.log("doInsert");  
            
            if(eUtil.ISEmpty($("#uId").val())){
                alert("아이디를 입력하세요.");
                $("#uId").focus();
                return;                 
            }
            
            if(eUtil.ISEmpty($("#passwd").val())){
                alert("비밀번호를 입력하세요.");
                $("#passwd").focus();
                return;                 
            }           
            
            if(eUtil.ISEmpty($("#passCheck").val())){
                alert("비밀번호를 다시 입력하세요.");
                $("#passCheck").focus();
                return;                 
            }
            
            if(eUtil.ISEmpty($("#name").val())){
                alert("이름을 입력하세요.");
                $("#name").focus();
                return;                 
            }  
            
            
            if(eUtil.ISEmpty($("#pNum").val())){
                alert("휴대폰 번호를 입력하세요.");
                $("#pNum").focus();
                return;                 
            }    
            
            if(eUtil.ISEmpty($("#nick").val())){
                alert("닉네임을 입력하세요.");
                $("#nick").focus();
                return;                 
            }               
            
            if(confirm("등록 하시겠습니까?")==false )return;      
            
            let url = "${CP}/userinfo/doInsert.do";
            let method = "POST";
            let parameters = {
                    "uId": $("#uId").val(),
                    "passwd": $("#passwd").val(),
                    "name": $("#name").val(),
                    "pNum": $("#pNum").val(),
                    "nick": $("#nick").val()
/*                     "type": $("#type").val(),
                    "regDt": $("#regDt").val() */
            };
            
            let async;
            EClass.callAjax(url,parameters,method,async,function(data){
                console.log("data.msgId:"+data.msgId);
                console.log("data.msgContents:"+data.msgContents);
                if("1"==data.msgId){
                    alert(data.msgContents);
                //    doRetrieve(1);
                }else{
                    alert(data.msgContents);
                }               
                
            });
            
        });//회원가입 등록========================================
            
         //id중복 Check : 등록된 경우만 동작!!!
        $("#idCheck").on("click",function(){
            console.log("idCheck");
            if(eUtil.ISEmpty($("#uId").val())){
                alert("아이디를 입력하세요.");
                $("#uId").focus();
                return;
            }
          
            let url = "${CP}/userinfo/idCheck.do";
            let method ="GET";
            let async  = true;
            
            let parameters = {
                    "uId": $("#uId").val()  
            };
            
            EClass.callAjax(url, parameters, method, async, function(data) {
                console.log('data:'+data);
                if("1" == data.msgId){//id중복
                    alert(data.msgContents); 
                    //사용할수 없음
                    $("#idCheckYN").val("0");
                    
                }else{//id사용 가능
                    alert(data.msgContents); 
                    //사용할수 있음
                    $("#idCheckYN").val("1");                   
                }
            });
        }); 
        //idCheck============================================================= */
        
    });
    //----------------------------------------------$(document).ready
    </script>

</head>
<body>
    <%@include file="header.jsp" %>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    
    <!-- 내용 -->
    <div id="wrap">

        <div class="txtbox">
            <h1>회원가입</h1>
            <!-- id : 중복 확인 검사, 유효성 검사 필요 -->
            <div class="box">
                <input type="hidden" name="idCheckYN" id="idCheckYN">
                <label for="uId">아이디</label> 
                <input id="uId" type="text" placeholder="아이디를 입력하세요." required="required" maxlength="20" />
                <input type="button" value="중복확인"  id="idCheck" name="idCheck" onclick="idCheck();" />
                <p class="msgErr1">아이디 베리데이션 노출 영역.</p>
            </div>
            <!-- id ------------------------------------------------------->
            
            <!-- passwd -->
            <div class="box">
                <label for="passwd">비밀번호</label> 
                <input name="pass" id="passwd" type="password" placeholder="비밀번호를 입력하세요." required="required" maxlength="20" />
                <p class="msgErr2">비밀번호 베리데이션 노출 영역.</p>
            </div>
            <!-- passwd --------------------------------------------------->
            
            <!-- passCheck-->
            <div class="box">
                <label for="pwcheck">비밀번호 확인</label> 
                <input id="passCheck" type="password" placeholder="비밀번호를 다시 입력하세요." required="required" maxlength="20" />
                <p class="msgErr3">비밀번호 베리데이션 노출 영역.</p>
            </div>
            <!-- passCheck ---------------------------------------------->
            
            <!-- name -->
            <div class="box">
                <label for="name">이름</label> 
                <input id="name" type="text" placeholder="이름을 입력하세요." required="required" maxlength="5" />
            </div>
            <!-- name ----------------------------------------------------->
            
            <!-- pNum : 휴대폰 : ^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$ / 000-0000-0000 -->
            <div class="box">
                <label for="pNum">휴대폰번호</label> 
                <input id="pNum" type="text" placeholder="ex) 010-xxxx-xxxx" required="required" />
            </div>
            <!-- pNum ----------------------------------------------------->
            
            <!-- nick : 영어 & 숫자만 : ^[a-zA-Z0-9]*$/20BYTE /로그인 시 아이디가 아닌 닉네임으로 보여줌-->
            <div class="box">
                <label for="nick">닉네임</label> 
                <input id="nick" type="text" placeholder="닉네임을 입력하세요." required="required" maxlength="10" />
                <input type="button" value="중복확인" id="nickCheck" name="nickCheck" onclick="nickCheck();" />
            </div>
            <!-- nick ------------------------------------------------->
            
            <!-- button -->
                <form action="/doInsert.do" method="post" id="signFrm" >
                <div class="gaib">
                    <input type="button" value="회원가입" id="doInsert" name="doInsert" >
                </div>
                </form>
            <!-- button --------------------------------------------------->
        </div>
 
    </div>

    <%@include file="footer.jsp" %>
    <!-- 내용 ----------------------------------------------------------->

</body>
</html>