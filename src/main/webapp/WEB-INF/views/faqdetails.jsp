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
<script src="${CP_RES}/js/eUtil.js"></script>
<script src="${CP_RES}/js/eclass.js"></script>

<!--자바스크립트 코드-->
<script type="text/javascript">
 $(document).ready(function(){
    console.log("document ready");
    
    
    function moveToList() {
        window.location.href="${CP}/faq/faqView.do";
    }
    
    function moveToDetails() {
        let faqSeq = $("#fSeq").val();
        window.location.href="${CP}/faq/doSelectOne.do?fSeq="+faqSeq;
    }
    
    $("#btnList").on("click", function(){
        moveToList();
    });
    
    $("#btnUpdate").on("click", function(){
        let faqSeq = $("#fSeq").val();
        window.location.href="${CP}/faq/doMod.do?fSeq="+faqSeq;
    });
  
    $("#btnDelete").on("click",function(e){
        console.log("doDelete");
        let boardId = $("#uId").val();
        let faqSeq = $("#fSeq").val();
        console.log("boardId:"+boardId);
        console.log("faqSeq:"+faqSeq);
        
        if(confirm("게시물을 삭제 하시겠습니까?")==false)return;
        
        let url = "${CP}/faq/doDelete.do";
        let method = "POST";
        let async  = true;
        let parameters = {
                "uId":boardId,
                "fSeq":faqSeq
        };
        
        EClass.callAjax(url, parameters, method, async, function(data) {
            console.log("data.msgId:"+data.msgId);
            console.log("data.msgContents:"+data.msgContents);     
            if("1" == data.msgId){
                alert(data.msgContents);
                moveToList();
            }else{
                
                alert(data.msgContents);
            }                
                            
        });       
          
    });
    
 });
</script>

<head>
<title>게시물 상세</title>
<style>
@import
    url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
    ;
</style>

<!--스타일 시트 -->
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/header.css">
<link rel="stylesheet" type="text/css" href="${CP_RES}/css/footer.css">
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
}

#all {
    width: 90%;
    margin: 0 auto;
    margin-top: 30px;
    margin-bottom: 30px;
}

.buttonDiv {
    width: 90%;
    height: 50px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: right;
}

.buttonDiv .btn {
    width: 50px;
    height: 30px;
    border: 1px solid #333333;
    background: white;
    border-radius: 2px;
    margin-left: 10px;
}

.main {
    width: 90%;
    border: 1px solid #333;
    box-sizing: content-box;
    height: 500px;
    margin: 0 auto;
}

.boardTitle {
    width: 90%;
    height: 70px;
    line-height: 70px;
    border-bottom: 1px solid #333;
    box-sizing: content-box;
    margin: 0 auto;
}

.boardMulti {
    width: 90%;
    height: 30px;
    line-height: 30px;
    margin: 0 auto;
    font-size: 10px;
    display: flex;
}

.boardMulti p {
    font-weight: bold;
    margin-right: 5px;
}

.boardMulti span {
    margin-right: 15px;
}

.boardContent {
    width: 90%;
    box-sizing: content-box;
    margin: 0 auto;
    height: 320px;
    padding-top: 20px;
}

#all a {text-decoration: none;}
</style>

<!--자바스크립트 코드 -->
<script type="text/javascript">
</script>
</head>

<body>
    <%@include file="header.jsp" %>
    <script type="text/javascript" src="${CP_RES}/js/header.js"></script>
    <!-- main div 열림 -->
    <div id="all">
        <form action="#" method="post">
            <!-- 버튼으로 목록 수정 삭제 만들기 -->
            <div class="buttonDiv">
                <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
                <button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
                <button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
            </div>
            <!-- 버튼으로 목록 수정 삭제 종료 -->
           
            <!-- 제목,작성시간,조회수,작성자,내용 -->
            <div class="main">
                <!-- 제목 -->
                <div class="boardTitle">
                    <table class="boardView">
                        <tr>
                            <td><c:out value='${vo.fTitle}'/></td>
                        </tr>
                    </table>
                </div>
                <!-- 제목 끝 -->
           
                <!-- 멀티 -->
                <div class="boardMulti">
                    <p>등록일</p>
                    <span><c:out value='${vo.regDt}'/></span>
                    <p>작성자</p>
                    <span>관리자</span>
                    <p>조회수</p>
                    <span><c:out value='${vo.fReadCnt}'/></span>
                </div>
                <!-- 멀티 끝 -->
                <input type="hidden" id="uId" value='${vo.uId}'>
                <input type="hidden" id="fSeq" value='${vo.fSeq}'>
                <!-- 내용 -->
                <div class="boardContent">
                    <p><c:out value='${vo.fContents}'/></p>
                </div>
                <!-- 내용 끝 -->
            </div>
            <!-- main div끝 -->
        </form>
        <!-- 폼 끝 -->
    </div>
    <!-- main div 닫음 -->
    <%@include file="footer.jsp" %>
</body>
</html>