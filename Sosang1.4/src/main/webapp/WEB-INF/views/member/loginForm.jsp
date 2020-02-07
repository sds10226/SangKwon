<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String) session.getAttribute("id");
	if(id == null) {
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://kit.fontawesome.com/8661be4044.js" crossorigin="anonymous"></script>
<script src="../resources/js/check.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="../resources/css/loginForm.css">
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
</style>
</head>
<body>
	<div class="back"></div>
	<form class="loginForm" method="POST" name="loginForm" id="loginForm">

		<div class="wrapper">
			<div class="logoImg">
				<img src="../resources/images/Logo.png" alt="로고">
			</div>
			<div class="title">로그인 </div>
		 	<h2 style="text-align: center">${message}</h2>
			<br>
			<div class="form">
			
				<div class="input_field">
					<input type="text" placeholder="User ID" class="id" name="id" id="id" required>
					<i class="fas fa-user"></i>
				</div>
				
				<div class="input_field">
					<input type="password" placeholder="Password" class="password" name="password" id="password"  required>
					<i class="fas fa-key"></i>
				</div>
				<br>
				<div class="input_field">
					<a href="${pageContext.request.contextPath}/member/memberRegisterForm.do"><strong>아직 회원이 아니세요?</strong></a>
					<br><br>
					<a href="${pageContext.request.contextPath}/member/findIdPasswordForm.do"><strong> ID / Password를 잊어버리셨나요?</strong></a>
				</div>
					
				
				<div class="btn">
					<input type="button" id="LoginBtn" onclick="loginCheck(this.form)" value="로그인">
				</div>
			</div> <!--end of form-->
   		</div> <!--wrapper-->
	</form>
	
	<a href="../home.jsp" id="homebtn">HOME</a>
	

</body>
</html>

<% } else { 
	response.sendRedirect("../home.jsp");
} %>