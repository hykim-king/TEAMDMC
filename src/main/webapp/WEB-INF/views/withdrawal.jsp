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

</style>

<title>KEMIE-회원 탈퇴</title>

<script type="text/javascript">
	
/* 	$(document).ready(function(){
	    
          //삭제
          $("#doDelete").on("click", function(){
                console.log("doDelete");
                
                let url = "${CP}/user/doDelete.do";
                
                if(eUtil.ISEmpty($("#uId").val())){
                    alert("아이디를 입력하세요.");
                    $("#uId").focus();
                    return;
                }
                
                let parameters = {
                        "uId": $("#uId").val(),
                        "passwd": $("#passwd").val()
                };
                
                let method ="GET";
                let async  = true;
                
                if(confirm("삭제 하시겠습니까?")==false)return;
                EClass.callAjax(url, parameters, method, async, function(data) {
                    console.log('data:'+data);  
                    
                    if("1"==data.msgId){
                        alert(data.msgContents);
                        //1. 목록조회
                        doRetrieve(1);
                        //2. 관리초기화
                        init();
                    }else{
                        alert(data.msgContents);
                    }
                });
          //--삭제      
          });
	    	
	    } */

</script>

</head>
<body>

    <form action="#" id="withdrawal" name="withdrawal" method="post">
        <div id="wrap">
            <div class="txtbox">
				<div class="wdbox">
					<input type="text" id="uId" name="uId" placeholder="아이디를 입력하세요.">
				</div>
				<div class="wdbox">
					<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="wdbox">
					<input type="password" id="passwd2" name="passwd2" placeholder="비밀번호를 다시 입력하세요.">
				</div>
				<div class="wdbtn">
					<input type="button" id="doDelete" name="doDelete" value="회원 탈퇴">
				</div>
			</div>
        </div>
    </form>

</body>
</html>