<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="../resources/css/logoutStyle.css">
</head>
<body>
	<div class="wrapper">
        <div class="logoutImg">
            <img src="../resources/images/Logo.png" alt="로그아웃이미지">
        </div>

        <h1 class="title"> ${message}</h1> 
        <br>
        <div class="btnSpace">
        <input type="button" id="mainBtn" value="메인페이지" onclick="location.href='../home.jsp'">
        </div>

	</div><!--end of wrapper-->

		

</body>
</html>