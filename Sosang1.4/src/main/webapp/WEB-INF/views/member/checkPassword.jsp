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
<title>비밀번호 입력</title>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
	function checkInputBox(checkPasswordForm) {
		var password = document.getElementById("pw").value;
		
		if(!password) {
			alert('비밀번호를 입력해주세요.');
            checkPasswordForm.pw.focus();
			return false;
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/passwordCheck.do",
				type : "post",
				data : "password=" + password,
				dataType : "text",
				success : function(result) {
					if (result == 1) {
						document.checkPasswordForm.action ="memberChangeInfoForm.do"
						document.checkPasswordForm.submit();	
					} else {
						document.getElementById("msg").innerHTML = "비밀번호가 틀렸습니다.";
                        checkPasswordForm.pw.focus();
					}
				},
				error : function(request, status, error) {
					var msg = "ERROR : <br>"
					msg += request.status + "<br>" + request.responseText
							+ "<br>" + error;
					console.log(msg);
				},
			});
		}
	}
</script>
<style>
	* {
		margin: 0;
		padding: 0;
		text-decoration: none;
		font-family: 'KBIZHanmaumGothic';
		box-sizing: border-box;
	}
	
	/* font 링크 */
	@font-face {
		font-family: 'KBIZHanmaumGothic';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	#pw {
		border: none;
		border: 1px solid lightgray;
		width: 200px;
		height: 25px;
		padding-left: 5px;
		font-size: 120%;
		overflow: hidden;
	}
	
	#msg {
		font-size: 120%;
		text-align: center;
	}
	
	#container {
		width: 100%;
	}
	
	#pwform {
		margin: 0 auto;
		width: 200px;
	}
	
	#okbtn {
		margin: 0 auto;
		background-color: #f1c40f;
		border: 1px solid #f1c40f;
		border-radius: 5px;
		width: 100px;
		height: 30px;
		color: #fff;
		font-weight: bold;
		display: block;
		cursor: pointer;
		transition: .1s linear;
	}
	
	#okbtn:hover {
		border: 1px solid rgb(47, 33, 33);
		background-color: rgb(47, 33, 33);
	}
	
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
	<h2 style="text-align: center; height: 50px; margin-top: 30px;">비밀번호 입력</h2>
	<hr width="300px" style="margin: 0 auto;">
	<br>

	<div id="container">
		<form action="" id="pwform" name="checkPasswordForm" method="post">
			<div id="msg"></div>
			<input type="hidden" name="userId" id="id" value="${id }" readonly>
			<input type="password" name="password" id="pw" class="pw"> <br>
			<br> <input type="button" id="okbtn" value="확 인"
				onclick="checkInputBox(this.form)">
		</form>
	</div>
	<a href="../home.jsp" id="homebtn">HOME</a>
</body>
</html>

<% } %>