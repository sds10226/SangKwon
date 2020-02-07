<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = (String) session.getAttribute("id");
	if(id != null) {
		response.sendRedirect("../home.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		text-decoration: none;
		font-family: 'KBIZHanmaumGothic'; 
	}
	
	/* font 링크 */
    @font-face {
        font-family: 'KBIZHanmaumGothic'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')format('woff'); 
        font-weight: normal; 
        font-style: normal; 
    }
    
    .resPwBox {
   		outline: 2px solid #f1c40f;
    	height: 199px;
    	width: 499px;
    }
    
    .resPw {
    	margin: 0 auto;
    	display: block;
    	width: 499px;
    	text-align: center;
    	line-height: 199px;
    }
    
    
</style>
</head>
<body>

<c:set var="findPassword" value="${findPassword }" />

<c:choose>
    <c:when test="${empty findPassword }">
	    <div class="resPwBox">
	        <span class="resPw">해당하는 데이터가 없습니다.</span>
        </div>
    </c:when>
 
    <c:otherwise>
	    <div class="resPwBox">
	        <span class="resPw">비밀번호 찾기 결과를 가입하신 메일로 보내드렸습니다.</span>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>

<% } %>