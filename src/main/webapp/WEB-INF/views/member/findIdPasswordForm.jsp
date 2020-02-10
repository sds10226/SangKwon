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
<title>아이디/비밀번호 찾기</title>
<script src="https://kit.fontawesome.com/8661be4044.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="../resources/css/findIdPassword_Style.css">
<style>
	#homebtn {
		position: fixed;
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
	<div class="findIdPasswordForm" name="findIdPasswordForm" style="margin: 0 auto; width: 450px;">
		<div class="wrapper">
			<div class="findIdImg">
				<img src="../resources/images/findId.png" alt="아이디찾기그림">
			</div>
			<div class="findIdWord">
				<h2>아이디/비밀번호를 잊으셨나요?</h2>
				<h4>아이디와 비밀번호가 생각나지 않으시면</h4>
				<h4>회원가입시 등록하신 메일주소를 입력해주세요.</h4>
			</div>
			<br>
			<hr>
			<br>

			<form class="searchID" method="GET" name="searchID">
				<label class="findId"><i class="fas fa-search"></i>아이디찾기</label>
				<br><br>
					<div class="input_field">
						<i class="fas fa-portrait"></i>
						<input type="text" placeholder="Name" class="name" name="name" id="name" required>
					</div>
					
					<div class="input_field">
						<input type="text" placeholder="Email" class="email" name="email" id="email" required>
						<i class="fas fa-envelope"></i>
					</div>
					
					<div class="btn">
						<input type="button" id="findIdBtn" value="아이디찾기">
					</div>
					<br>
			</form>
			<hr>
			
			
			<br>	
			<form class="searchPassword" method="GET" name="searchPassword">
				<label class="findPassword"><i class="fas fa-search"></i>비밀번호찾기</label>
				<br><br>
				<div class="input_field">
					<input type="text" placeholder="id" class="id" name="id" id="id" required>
					<i class="fas fa-portrait"></i>
				</div>
				
				<div class="input_field">
					<input type="text" placeholder="Email" class="email" name="email" id="email" required>
					<i class="fas fa-envelope"></i>
				</div>

				
				<div class="btn">
					<input type="button" id="findPasswordBtn" value="비밀번호찾기">
				</div>
			</form>
   		</div> 
	</div>
	<a href="../home.jsp" id="homebtn">HOME</a>
<script>

	$(document).ready(function() {
		$("#findIdBtn").click(function(){
			if(${sessionScope.name == null}){
				
				var name = $("#name").val();
				var email = $("#email").val();
				
				if(name == ""){
					alert("이름을 입력하세요.");
					$("#name").focus();
					return;
				}
				if(email=""){
					alert("이메일을 입력하세요.");
					$("#email").focus();
					return;
				}
				var popupX = (window.screen.width / 2) - (600 / 2);
				var gsWin = window.open('find_Id.do','find_Id','width=500, height=200, left=' + popupX + ', top=30');
				document.searchID.action = "find_Id.do";
				document.searchID.target = "find_Id";
				document.searchID.method = "GET";
				document.searchID.submit();
			}
		});


		$("#findPasswordBtn").click(function(){
			if(${sessionScope.id == null}){
				
				var id= $("#id").val();
				var email = $("#email").val();
				
				if(id == ""){
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return;
				}
				if(email=""){
					alert("이메일을 입력하세요.");
					$("#email").focus();
					return;
				}
				var popupX = (window.screen.width / 2) - (600 / 2);
				var gsWin = window.open('find_Password.do','find_Password','width=500, height=200, left=' + popupX + ', top=30');
				document.searchPassword.action = "find_Password.do";
				document.searchPassword.target = "find_Password";
				document.searchPassword.method = "GET";
				document.searchPassword.submit();
		}
	
	});
		
});
</script>
</body>
</html>

<% } %>