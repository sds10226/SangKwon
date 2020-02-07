<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("../home.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://kit.fontawesome.com/8661be4044.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/changeinfo.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="../resources/css/memberChangeInfo.css">
<style>
	#homebtn {
		position: absolute;
		bottom: 2%;
		right: 2%;
		background-color: rgb(47, 33, 33);
		color: #fff;
		
		width: 70px;
		height: 30px;
		line-height: 30px;
		text-align: center;
		border-radius: 10px;
	}
	#homebtn:link {
		color: #fff;
	}
	#homebtn:visited {
		color: #fff;
	}
	#password::placeholder,
	#confirmPassword::placeholder {
		color: lightgray;
	}
</style>
</head>

<body>
	<form class="memberChangeInfoForm" method="POST" name="memberChangeInfoForm">

		<div class="wrapper">
			<div class="logoSpace"><img src="../resources/images/Logo.png" alt="logo" style="width: 100%;
    padding: 0%;"></div>
	
			<div class="title"> 회원정보변경</div>
			<h3 style="text-align:center;">${message }</h3>
				<div class="input_field">
					<input type="text" placeholder="User ID" class="id" name="id" id="id" value="${id}" style="color:#785655" readonly>
					<i class="fas fa-user"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="Name" class="name" name="name" id="name" value="${name}" style="color:#785655" readonly>
					<i class="fas fa-portrait"></i>
				</div>
				<div class="input_field" >
					<input type="text" placeholder="Phone Number" class="tel" id="tel" name="tel" maxlength="11" value="${tel}">
					<i class="fas fa-phone"></i>
				</div>
				<div class="input_field" >
					<input type="password" placeholder="Password" class="password" id="password" name="password" maxlength="10" value="">
					<i class="fas fa-key"></i>
				</div>
				<div class="input_field" >
					<input type="password" placeholder="Check Password" class="confirmPassword" id="confirmPassword" name="confirmPassword" maxlength="10" value="">
					<i class="fas fa-lock"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="Email" class="Email" name="email" id="email" style="width: 80%;" value="${email}" onchange="inputEmailChk1()">
					<i class="fas fa-envelope"></i>
					<button type="button" class="IDcheck" onclick="emailCheck1()">Check</button>
					<input type="hidden" name="emailDuplication" value="emailChecked">
				<div class="btn">
					<input type="button" onclick="memberUpdateCheckForm(this.form)" value="변경하기"> 
				</div>
			</div>
   		 </div>
	</form>
	
	<a href="../home.jsp" id="homebtn">HOME</a>


</body>
</html>

<% } %>