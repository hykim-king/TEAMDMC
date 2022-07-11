<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    height: 800px;
    position: relative;
}

.txtbox {
    width: 600px;
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
    display: flex;
}


#idCheckYN {display: none;}



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
    text-align: left;
    font-size: 15px;
}

.gaib {
    width: 100%;
    height: 50px;
    text-align: center;
    margin-top: 20px;
}

.gaib input {
    width: 90px;
    height: 30px;
    margin: 0 auto;
    border: 1px solid #333;
    background: white;
    border-radius: 2px;
}

 #idCheck{
    width: 80px;
    height: 30px;
    border-radius: 10px;
    text-align: center;
    font-size: 13px;
    background: #38385d;
    color: white;
    margin-left: 15px;
 }

 #nickCheck{
    width: 80px;
    height: 30px;
    border-radius: 10px;
    text-align: center;
    font-size: 13px;
    background: #38385d;
    color: white;
    margin-left: 15px;
 }
 
 .necess{
    font-size: 13px;
    color: tomato;
    text-ailgn: right;
    display: block;
    margin-bottom: 20px;
 }
 
 #doInsert {}
</style>
<title>KEMIE</title>

      <script type="text/javascript">
    
    $(document).ready(function(){
        
/*         function checkForm() {
            var empC = /\s/g;
            var nameC = /^[가-힣]{2,5}$/;
            var idpwC = /^[a-zA-z0-9]{4,20}$/;
            var nickC = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
            var pNumC /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
                        숫자만  /^[0-9]+$/;        /^[0-9]*$/;     /^\d{3}-\d{3,4}-\d{4}$/;
        }//checkForm=========================================  */
        
/*         
        
        //아이디
        $("#uId").on("keydown", function(e){
            let idC = /^[a-zA-z0-9]+$/;
            let str = $("#uId").val();
            
            if(!str.match(idC)&&||str.length<20){
                $("#uId").val(str.slice(0, -1));                
            }
        });
        
        //ㅂㅣ번
        $("#passwd").on("keydown", function(e){
            let pwC = /^[a-zA-z0-9]+$/;
            let str = $("#passwd").val();
            
            if(!str.match(pwC)){
                $("#passwd").val(str.slice(0, -1));             
            }
        });
        
        //비번체크
        $("#passCheck").on("keydown", function(e){
            let pwC = /^[a-zA-z0-9]+$/;
            let str = $("#passCheck").val();
            
            if(!str.match(pwC)){
                $("#passCheck").val(str.slice(0, -1));              
            }
        });
        
        //이름
        $("#name").on("keydown", function(e){
            let nameC = /^[가-힣]+$/;
            let str = $("#name").val();
            
            if(!str.match(nameC)){
                $("#name").val(str.slice(0, -1));               
            }
        });
        
        //폰번호
        $("#pNum").on("keydown", function(e){
            let pNumC = /^\d{3}-\d{3,4}-\d{4}$/;
            let str = $("#pNum").val();
            
            if(!str.match(pNumC)){
                $("#pNum").val(str.slice(0, -1));               
            }
        });
        
        //닉네임
        $("#nick").on("keydown", function(e){
            let nickC = /^[a-zA-z0-9]+$/;
            let str = $("#nick").val();
            
            if(!str.match(nickC)){
                $("#nick").val(str.slice(0, -1));               
            }
        }); 
        */

        //=======등록
        //1(성공)/ 0(실패)
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
            
            if(confirm("등록 하시겠습니까?")==false)return;
            else {
            	if($("#idCheckYN").val() == "0"){
            		alert("아이디를 확인해 주세요.");	
            	}
            	
            	
            	if($("#nickCheckYN").val() == "0"){
                    alert("닉네임을 확인해 주세요."); 
                }
            }
            
            let url = "${CP}/userinfo/doInsert.do";
            let method = "POST";
            let parameters = {
                    "uId": $("#uId").val(),
                    "passwd": $("#passwd").val(),
                    "name": $("#name").val(),
                    "pNum": $("#pNum").val(),
                    "nick": $("#nick").val()
                    
/*                      "type": $("#type").val(),
                    "regDt": $("#regDt").val() */
                    
            };
            
            let async;
            EClass.callAjax(url,parameters,method,async,function(data){
                console.log("data.msgId:"+data.msgId);
                console.log("data.msgContents:"+data.msgContents);
                if("1"==data.msgId){
                    alert(data.msgContents);
                }else{
                    alert(data.msgContents);
                }               
                window.location.href = "${CP}/login/doGetLogin.do?uId="+$("#uId").val()+"&passwd="+$("#passwd").val();
            });
            
        });//회원가입 등록========================================
            
        //id중복 Check
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
                if("1" == data.msgId){
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
        //idCheck=============================================================
            
            
        //중복 Check
        $("#nickCheck").on("click",function(){
            console.log("nick");
            if(eUtil.ISEmpty($("#nick").val())){
                alert("닉네임을 입력하세요.");
                $("#nick").focus();
                return;
            }
          
            let url = "${CP}/userinfo/nickCheck.do";
            let method ="GET";
            let async  = true;
            
            let parameters = {
                    "nick": $("#nick").val()  
            };
            
            EClass.callAjax(url, parameters, method, async, function(data) {
                console.log('data:'+data);
                if("1" == data.msgId){
                    alert(data.msgContents); 
                    //사용할수 없음
                    $("#nickCheckYN").val("0");
                    
                }else{//id사용 가능
                    alert(data.msgContents); 
                    //사용할수 있음
                    $("#nickCheckYN").val("1");                   
                }
            });
        }); 
        //nickCheck=============================================================
  
        	
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
            <p class="necess">*는 필수 입력 항목입니다.</p>
            <!-- id : 중복 확인 검사, 유효성 검사 필요 idRegExp = /^[a-zA-z0-9]{4,20}$/; -->
            <div class="box">
                <input type="text" name="idCheckYN" id="idCheckYN" value="0">
                <label for="uId">*아이디</label> 
                <input id="uId" type="text" placeholder="아이디를 입력하세요." required="required" />
                <input type="button" value="중복확인"  id="idCheck" name="idCheck" />
                <p class="msgErr1"></p>
            </div>
            <!-- id idRegExp = /^[a-zA-z0-9]{4,20}$/; ------------------------------------------------------->
            
            <!-- passwd /^[a-zA-z0-9]{4,20}$/; -->
            <div class="box">
                <label for="passwd">*비밀번호</label> 
                <input name="pass" id="passwd" type="password" placeholder="비밀번호를 입력하세요." required="required" autocomplete="off" />
                <div class="msgErr2" id="pw1"></div>
            </div>
            <!-- passwd var  --------------------------------------------------->
            
            <!-- passCheck-->
            <div class="box">
                <label for="pwcheck">*비밀번호확인</label> 
                <input id="passCheck" type="password" placeholder="비밀번호를 다시 입력하세요." required="required" autocomplete="off" />
                <div class="msgErr3" id="pw2"></div>
            </div>
            <!-- passCheck ---------------------------------------------->
            
            <!-- name /^[가-힣]{2,5}$/; -->
            <div class="box">
                <label for="name">*이름</label> 
                <input id="name" type="text" placeholder="이름을 입력하세요." required="required" />
            </div>
            <!-- name ----------------------------------------------------->
            
            <!-- pNum  -->
            <div class="box">
                <label for="pNum">*휴대폰번호</label> 
                <input id="pNum" type="text" placeholder="ex) 010-xxxx-xxxx" required="required" />
            </div>
            <!-- pNum ----------------------------------------------------->
            
            <!-- nick : ^[a-zA-Z0-9]*$/ 20BYTE /로그인 시 아이디가 아닌 닉네임으로 보여줌-->
            <div class="box">
                <label for="nick">*닉네임</label> 
                <input type="hidden" name="nickCheckYN" id="nickCheckYN" value="0">
                <input id="nick" type="text" placeholder="닉네임을 입력하세요." required="required" />
                <input type="button" value="중복확인" id="nickCheck" name="nickCheck" onclick="nickCheck" />
            </div>
            <!-- nick ------------------------------------------------->
            
            <!-- button -->
                    <form action="${CP}/userinfo/doInsert.do" method="post" id="signFrm" >
                <div class="gaib">
                    <input type="button" value="회원가입" id="doInsert" name="doInsert" >
                </div>
                      </form>
            <!-- button --------------------------------------------------->

				<!-- button -->
<%-- 				<form action="${CP}/userinfo/doDelete.do" method="post" id="signFrm" >
				<div class="test">
					<input type="button" value="회원 탈퇴" id="doDelete" name="doDelete" onclick="withPop">
				</div>
				</form> --%>
				<!-- button --------------------------------------------------->

			</div>
   
    </div>

    <%@include file="footer.jsp" %>
    <!-- 내용 ----------------------------------------------------------->
    
</body>
</html>