<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--html comment-->
<!DOCTYPE html>
<html>
<body>
	<div id="header">
        <div class="hdbox">
            <ul class="menu">
                <li class="logo"><a href="${CP}/mainPage.do"><img src="${CP_RES}/img/logo_white.png"></a></li>
                <li><a href="${CP}/exchange.do">거래소</a></li>
                <li><a href="${CP}/balancesPage.do">입출금</a></li>
                <li><a href="${CP}/board/boardView.do">커뮤니티</a></li>
                <li><a href="${CP}/faq.do">고객센터</a></li>
            </ul>
            <ul class="user">
	            <c:choose>
		            <c:when test="${null !=sessionScope.user}">
		            <li>
		              <a href="${CP}/login/doLogout.do">
			              <span>${sessionScope.user.nick}님</span>
			              <span class="glyphicon glyphicon-log-out">&nbsp;로그아웃</span>
		              </a>
		            </li>  
		            </c:when>
		            <c:otherwise>
		              <li>
		                  <a href="${CP }/login/loginView.do">
		                     <span class="glyphicon glyphicon-log-in">&nbsp;로그인</span>
		                  </a>
		              </li>
		            </c:otherwise>
                </c:choose>
                <li><a href="signin.do">회원가입</a></li>
            </ul>
        </div>
    </div>
	
</body>
</html>