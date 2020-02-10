<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// 회원 로그인 확인
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
%>    
    
<!-- top menu -->
<nav class="navbar navbar-inverse" id="top-menu">
	<div class="container-fluid">
           <div class="navbar-header"><!-- 빈 공간 --></div>
		<div style="width: 1200px; margin: 0 auto;">
		    <ul class="nav navbar-nav">
		        <li class="active"><a href="../home.jsp" style="background-color: #f1c40f; color: rgba(47, 33, 33);"><font style="color: rgb(47, 33, 33);"><i class="fas fa-home"></i> <b>Home</b></font></a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <% if(id == null) { %>
                  <li><a href="#" style="color: rgba(47, 33, 33);"><span class="glyphicon glyphicon-user" style="color: rgb(47, 33, 33);"></span><font style="color: rgb(47, 33, 33);"> 회원가입</font></a></li>
                  <li><a href="#" style="color: rgba(47, 33, 33);"><span class="glyphicon glyphicon-log-in" style="color: rgb(47, 33, 33);"></span><font style="color: rgb(47, 33, 33);"> 로그인</font></a></li>
              <% } else { %>
              	  <li><a href="#" style="color: rgba(47, 33, 33);"><font style="color: rgb(47, 33, 33);"><%=id %>님, 환영합니다.</font></a></li>
                  <li><a href="#" style="color: rgba(47, 33, 33);"><i class="fas fa-user" style="color: rgb(47, 33, 33);"></i><font style="color: rgb(47, 33, 33);"> 마이페이지</font></a></li>
                  <li><a href="#" style="color: rgba(47, 33, 33);"><i class="fas fa-sign-out-alt" style="color: rgb(47, 33, 33);"></i><font style="color: rgb(47, 33, 33);"> 로그아웃</font></a></li>
              <% } %>
		    </ul>
		</div>
    </div>
</nav> 