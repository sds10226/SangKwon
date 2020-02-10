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
<title>아이디 찾기</title>

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
    
    .resIdBox {
   		outline: 2px solid #f1c40f;
    	height: 199px;
    	width: 499px;
    }
    
    .resId {
    	margin: 0 auto;
    	display: block;
    	width: 300px;
    	text-align: center;
    	line-height: 199px;
    }
</style>
</head>
<body>

<c:set var="findId" value="${findId }" />

<c:choose>
    <c:when test="${empty findId }">
	    <div class="resIdBox">
	        <span class="resId">해당하는 데이터가 없습니다.</span>
        </div>
    </c:when>
 
    <c:otherwise>
    	<div class="resIdBox">
        	<span class="resId">아이디 찾기 결과 : ${findId }</span>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>

<% } %>