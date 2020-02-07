<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>회원가입</title>
<script src="https://kit.fontawesome.com/8661be4044.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link href="../resources/css/registerStyle.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/check.js"></script>
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

	<form class="memberRegisterForm" method="post" name="memberRegisterForm" id="memberRegisterForm">

		<div class="wrapper">
			<div class="logoImg">
				<img src="../resources/images/Logo.png" alt="로고">
			</div>
			<div class="title">회원가입</div>



			<div class="form">
				<div class="input_field">
					<input type="text" placeholder="Name" class="name" name="name"
						id="name" required> <i class="fas fa-portrait"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="Phone Number" class="tel" id="tel"
						name="tel" maxlength="11" required> <i
						class="fas fa-phone"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="User ID" class="id" name="id"
						id="id" style="width: 80%;" onkeydown="inputIdChk()" required>
					<i class="fas fa-user"></i> <input type="button" class="IDcheck"
						onclick="confirmId()" value="Check"
						style="width: 18%; height: 46px; display: inline-block; background-color: #f1c40f; border: none; color: #785655; text-align: center; font-size: 15px; padding: 11px; cursor: pointer; margin: 0px;">
					<input type="hidden" name="idDuplication" value="idUncheck">
				</div>
				<div class="input_field">
					<input type="password" placeholder="Password" class="password"
						name="password" id="password" required> <i
						class="fas fa-key"></i>
				</div>
				<div class="input_field">
					<input type="password" placeholder="Confirm Password"
						class="confirmPassword" id="confirmPassword"
						name="confirmPassword" required> <i class="fas fa-lock"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="Email" class="email" name="email"
						id="email" style="width: 80%;" onkeydown="inputEmailChk()"
						required> <i class="fas fa-envelope"></i> <input
						type="button" class="Emailcheck" onclick="emailCheck()"
						value="Check"
						style="width: 18%; height: 46px; display: inline-block; background-color: #f1c40f; border: none; color: #785655; text-align: center; font-size: 15px; padding: 11px; cursor: pointer; margin: 0px;">
					<input type="hidden" name="emailDuplication" value="emailUncheck">
				</div>
				<div class="btn">
					<input type="button" id="insertCustomer" value="회원가입"
						style="border: none; width: 200px; display: inline-block; border-radius: 25px; color: #785655; text-align: center; font-size: 20px; padding: 13px; padding-left: 16px; cursor: pointer; margin: 0px; background-color: #f1c40f;"
						onclick="memberInsertCheckForm(this.form)">
				</div>
			</div>
			<!-- end of form -->
		</div>
		<!-- end of wrapper-->
	</form>
	
	<a href="../home.jsp" id="homebtn">HOME</a>

</body>
</html>
<% } %>