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
<title>이메일 중복체크</title>
<style>
/* rgb(47, 33, 33)#f1c40f */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
	font-family: 'KBIZHanmaumGothic';
}

@font-face {
	font-family: 'KBIZHanmaumGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	background-color: #f1c40f;
}

#wrapper {
	margin: 0 auto;
	max-size: 400px;
	width: 400px;
	height: 300px;
	border-radius: 20px;
	margin-top: 40px; left : 10%;
	postition: absolute;
	padding: 20px 30px;
	background-color: #fff;
	left: 10%
}

#checkForm {
	width: 320px;
	margin: 0 auto;
}

#emailChkBtn {
	background-color: #f1c40f;
	border: none;
	border-radius: 10px;
	color: #785655;
	width: 100px;
	height: 30px;
	cursor: pointer;
	font-weight: bold;
	position: relative;
	left: 10px;
	transition: .1s linear;
}

#emailChkBtn:hover {
	font-size: medium;
}

#userId {
	box-shadow: inset 0px 0px 1px 1px lightgray;
	border: none;
	float: left;
}

#checkForm input {
	display: block;
	margin: 0 auto;
	float: left;
}

#checkForm input:nth-child(1) {
	height: 30px;
	font-size: 17px;
}

#btns {
	width: 202px;
	height: 31px;
	margin: 0 auto;
}

#btns input {
	height: 30px;
	width: 100px;
	cursor: pointer;
	border-radius: 10px;
	color: #fff;
}

#cancelBtn{
	border: none;
	background-color:#f1c40f;
	color: #785655;
	float: left;
}

#cancelBtn:hover {
	font-size: medium;
}

#useBtn{
	border: 1px solid #f1c40f;
	background-color: #f1c40f;
	color: #785655;
	float: right;
}

#useBtn:hover {
	font-size: medium;
}
</style>
</head>
<script src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
window.onload = function value(){
document.getElementById("emailinput").value=opener.document.memberChangeInfoForm.email.value;
}
</script>
<body>
<div id="wrapper">
<br>
<div style="width: 100%; height: 45px;">
			<div style="text-align: center; font-size: 140%;">
				<b>이메일 중복 체크</b>
			</div>
<hr>
<br>
<div id="chk">
	<form id="checkForm">
		<input type="text" name="emailinput" id="emailinput">
		<input type="button" id="emailChkBtn"  value="중복확인" onclick="emailCheck()">
	</form>
	<br><br>
	<div id="msg"></div>
	<br>
	<div id="btns">
	<input type="button" id="cancelBtn" value="취소하기" style="color:#785655;" onclick="window.close()">
	<input type="button" id="useBtn" value="사용하기" style="color:#785655;" onclick="sendEmailValue()">
	</div>
</div>
</div>
</div>

<script type="text/javascript">

function emailCheck(){

	
	var email = document.getElementById("emailinput").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(email == null){
		alert("이메일를 입력하세요.");
		return false;
	}
	

	if(exptext.test(email)==false){

		alert("이메일 형식이 잘못되었습니다");

		document.addjoin.email.focus();

		return false;

	}else{
		      $.ajax({
		         url: "${pageContext.request.contextPath}/member/emailCheck2.do",
		         type: "post",
		         data: "email="+email,
		         dataType: "text",
		         success: function(result){
		            if(result == 0){
		               document.getElementById("cancelBtn").style.visibility="hidden";
		               document.getElementById("useBtn").style.visibility="visible";
		               document.getElementById("msg").innerHTML="사용가능한 이메일 입니다.";
		            }
		            else {
		               alert("사용할수 없는 이메일 입니다.");
		               document.getElementById("cancelBtn").style.visibility="visible";
		               document.getElementById("useBtn").style.visibility="hidden";
		               document.getElementById("msg").innerHTML="";
		            }
		         },
		         error : function(request, status, error){
		                  var msg = "ERROR : <br>"
		                     msg += request.status +"<br>"+ request.responseText +"<br>"+ error;
		                  console.log(msg);
		         },
		      });
		   }
		}

function callback(){
	if(httpRequest.readyState==4){
		var resultText=httpRequst.responseText;
		if(resultText >0){
			alert("사용할수 없는 이메일입니다.");
			document.getElementById("cancelBtn").style.visibility="visible";
			document.getElementById("useBtn").style.visibility="hidden";
			document.getElementById("msg").innerHTML="";
			}
		else if (resultText==0){
			document.getElementById("cancelBtn").style.visibility="hidden";
			document.getElementById("useBtn").style.visibility="visible";
			document.getElementById("msg").innerHTML="사용가능한 이메일 입니다.";
			}
}
}
function sendEmailValue(){
	opener.document.memberChangeInfoForm.emailDuplication.value="emailCheck";

	opener.document.memberChangeInfoForm.email.value=document.getElementById("emailinput").value;

	if(opener!=null){
		opener.chkForm=null;
		self.close();

}
}
</script>
</body>
</html>

<% } %>