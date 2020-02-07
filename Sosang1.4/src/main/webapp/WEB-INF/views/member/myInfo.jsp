<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원 접근시 controller에서 차단 후 home.jsp로 redirect -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<script src="https://kit.fontawesome.com/8661be4044.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/check.js"></script>
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
</style>
</head>
<body>
	<form class="memberChangeInfoForm" method="post" name="memberChangeInfoForm">

		<div class="wrapper">
			<div class="logoSpace"><img src="../resources/images/Logo.png" alt="logo" style="width: 100%;
    padding: 0%;"></div>
	
			<div class="title">나의 정보보기 </div>
		<h4 style="text-align: center; font-weight: italic;">이곳에서는 정보보기만 가능합니다.</h4>
		<h4 style="text-align: center;">수정을 원하시면 정보수정 페이지를 이용해 주세요.</h4>
		<br>
				<div class="input_field">
					<input type="text" placeholder="Name" class="name" name="name" id="name" value="${name}" style="color:#785655" readonly>
					<i class="fas fa-portrait"></i>
				</div>
				<div class="input_field" >
					<input type="text" placeholder="Phone Number" class="tel" id="tel" name="tel" maxlength="11" value="${tel}" style="color:#785655" readonly>
					<i class="fas fa-phone"></i>
				</div>
				<div class="input_field">
					<input type="text" placeholder="User ID" class="id" name="id" id="id" value="${id}"style="color:#785655" readonly>
					<i class="fas fa-user"></i>
					
				</div>
				<div class="input_field">
					<input type="text" placeholder="Email" class="Email" name="email" id="email" value="${email}" style="color:#785655" readonly>
					<i class="fas fa-envelope"></i>
				
				
				<div class="btn">
					<!--<input type="button" onClick="location.href='memberChangeInfoForm.do'" value="정보수정 페이지로 가기">-->
					<input type="button" onClick="location.href='checkPassword.do'" value="정보수정 페이지로 가기">
				</div>
			</div>
   		 </div>
	</form>
	<a href="../home.jsp" id="homebtn">HOME</a>


</body>
</html>