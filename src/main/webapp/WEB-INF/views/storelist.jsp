<%@page import="com.cafe24.sosang.dto.StoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%
	StoreDTO dto = null;
	int[] strCounts = new int[5];
	double cnt = 0;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://kit.fontawesome.com/45f7a374e1.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script>
		var queryObject = "";
		var queryObjectLen = "";
		var queryObjectLen2 = "";
		var queryObjectLen3 = "";

		$.ajax({
			type : 'POST',
			url : 'storechart.do',
			dataType : 'json',
			async: false,
			success : function(data) {
				queryObject = eval('(' + JSON.stringify(data, null, 2) + ')');
				// stringify : 인자로 전달된 자바스크립트의 데이터를 JSON 문자열로 바꾸기
				// eval : 문자열을 자바스크립트 코드로 처리하는 함수
				
				queryObjectLen = queryObject.barlist.length;
				queryObjectLen2 = queryObject.barlist2.length;
				queryObjectLen3 = queryObject.barlist3.length;
				
				// alert('컬럼수 : ' + queryObjectLen);
			},
			error : function(xhr, type) {
				// alert('server error occoured')
			}
		});

		console.log(queryObjectLen);
	
		google.charts.load('current', {
			packages : ['corechart', 'bar']
		});
	
		google.charts.setOnLoadCallback(drawMultSeries);
		google.charts.setOnLoadCallback(drawMultSeries2);
		google.charts.setOnLoadCallback(drawMultSeries3);
		
		function drawMultSeries() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', '점포수 / 유사 업종 점포수');
			data.addColumn('number', '점포수');
			data.addColumn('number', '유사 업종 점포수');

			for (var i = 0; i < queryObjectLen; i++) {
				var part = queryObject.barlist[i].part;
				var strCount = queryObject.barlist[i].strCount;
				var smlrStrCount = queryObject.barlist[i].smlrStrCount;
				
				data.addRows([
					[part, strCount, smlrStrCount]
				]);
			}
			
			var options = {
				title : '기간별 점포수 추이',
				chartArea : {
					width : '70%',
					height : '50%'
				},
				hAxis : {
					title : '점포수 / 유사 업종 점포수',
					minValue : 0
				},
				series : {
					0 : {color : '#79ABFF'},
					1 : {color : '#FF7171'}
				}
			};

			// var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
			var chart_bar = new google.charts.Bar(document.getElementById('chart_div_bar'));
			// chart.draw(data, options);
			chart_bar.draw(data, options);
		}

		function drawMultSeries2() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', '개업률');
			data.addColumn('number', '개업률');
			
			for (var i = 0; i < queryObjectLen2; i++) {
				var part = queryObject.barlist2[i].part;
				var open = queryObject.barlist2[i].open;
				
				data.addRows([
					[part, open]
				]);
			}
			
			var options = {
				title : '기간별 개업률 추이',
				chartArea : {
					width : '70%',
					height : '50%'
				},
				hAxis : {
					title : '개업률',
					minValue : 0,
				},
				vAxis : {
					minValue : 0,
				},
				series : {
					0 : {color : '#79ABFF'},
				}
			};
			
			var chart_open = new google.visualization.AreaChart(document.getElementById('chart_div_open'));
			chart_open.draw(data, options);
		}
		
		function drawMultSeries3() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', '폐업률');
			data.addColumn('number', '폐업률');
			
			for (var i = 0; i < queryObjectLen3; i++) {
				var part = queryObject.barlist3[i].part;
				var close = queryObject.barlist3[i].close;
				
				data.addRows([
					[part, close]
				]);
			}
			
			var options = {
				title : '기간별 폐업률 추이',
				chartArea : {
					width : '70%',
					height : '50%'
				},
				hAxis : {
					title : '폐업률',
					minValue : 0,
				},
				vAxis : {
					minValue : 0,
				},
				series : {
					0 : {color : '#FF7171'},
				}
			};
			
			var chart_close = new google.visualization.AreaChart(document.getElementById('chart_div_close'));
			chart_close.draw(data, options);
		}
	
		/*위로 올리는 스크립트  */
		function scrollMove() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	
		/*인쇄 스크립트  */
		/*상단 메뉴 data-toggle  */
		$(document).ready(function(){
			$(".middle-li1").click(function(){
				$("#market").toggle();
			});
	
			$(".middle-li2").click(function(){
				$("#work").toggle();
			});
	
			$(".middle-li3").click(function(){
				$("#sell").toggle();
			});
	
			$(".middle-li4").click(function(){
				$("#person").toggle();
			});
	
			$(".middle-li5").click(function(){
				$("#local").toggle();
			});
		});
	</script>
	<title>업종분석</title>
	<style>
		body{
		margin-right: auto;
		margin-bottom: 8px;
		width: 1700px;
		height: auto;
		padding: auto;
		display: block;
		}
		.middle_container{
		width: 1700px;
		height: 50px;
		}
		
		ul.middle-ul{
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		background-color: #F2CB61;
		}
		
		ul.middle-ul li {
		float: left;
		}
		
		ul.middle-ul li a {
		  display: block;
		  color: white;
		  font-weight: bold;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		}
		
		ul.middle-ul li a:hover:not(.active) {background-color: skyblue; color: rgb(49,99,227); font-weight: bold; }
		
		ul.middle-ul li a.active {background-color: #4CAF50;}
		
		@media screen and (max-width: 600px) { 
			ul.middle-ul li {float: none;}
		}
		h2{
		color: #785655;
		display: block;
		font-size: 1.5em;
		margin-block-start: 0.83em;
		margin-block-end: 0.83em;
		margin-inline-start: 0px;
		margin-inline-end: 0px;
		font-weight: bold;
		}
		.container{
		width: 1700px;
		height: 150px;
		
		}
		table{
		border: 1px solid  rgb(201, 208, 214);
		width: 1700px;
		height: 100px;
		text-align: center;
		border-collapse: collapse;
		
		}
		td{
		border: 1px solid rgb(201, 208, 214);
		font-size: 13px;
		}
		th{
		border: 1px solid rgb(201, 208, 214);
		background-color: rgb(240, 243, 245);
		font-size: 13px;
		}
		
		.tip-container{
		width: 1700px;
		height: 70px;
		font-size:13px;
		background-color:  rgb(245, 246, 241);
		margin-top: 10px;
		padding-right: 15px;
		}
		
		.tip-icon{
		float: left; 
		width: 65px;; 
		height: 70px; 
		text-align: center;
		display: table-cell; 
		vertical-align: middle;
		
		}
		.tip-content{
		width: 1635px;
		height: 70px;
		display: table-cell; 
		vertical-align: middle;
		}
		.th1{
		width: 5%;
		background-color:  rgb(249, 249, 249);
		}
		.far fa-hand-point-right{
		font-size:15px;
		font-color: rgb(46, 211, 174);
		}
		
		
		#local{
		width: 1700px;
		height: 61px;
		float: left;
		padding-top: 20px;
		padding-left: 20px;
		border-bottom: 1px solid black;
		font-size: 15px;
		}
		
		h1 {
		display: block;
		font-size: 2em;
		margin-block-start: 0.67em;
		margin-block-end: 0.67em;
		margin-inline-start: 0px;
		margin-inline-end: 0px;
		font-weight: bold;
		}
		
		#store {
		width: 1700px;
		overflow: visible;
		height: 1600px;
		margin: auto;
		}
	</style>
</head>

<body>

	
	<!-- toggle시 업종분석 내용  -->
	<div id="local" style="float: left;">	
			<a href="#part1" style="color: black; text-decoration: none;">1.점포수</a><span style="color: rgb(201, 208, 214); margin-left: 10px;">|</span>
			<a href="#part2" style="color: black; text-decoration: none;">2.개업률 / 폐업률</a>
	</div>
	
	<div class="main-container" style="float: left;" id="store">
		<h4 style="text-align: left; margin-top: 20px;">
			<b>${area} - ${food}</b>
		</h4>
		<h2 id="part1" style="text-align: left;">1.점포수 분석</h2>
		<!-- 점포수 분석 표 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="2">2017년 6월</th>
					<th colspan="3">2017년 12월</th>
					<th colspan="3">2018년 6월</th>
					<th colspan="3">2018년 12월</th>
					<th colspan="3">2019년 6월</th>
				</tr>
				<tr>
					<%
						for (int i = 0; i < 5; i++) {
							if (i == 0) {
					%>
						<th>점포 수</th>
						<th>유사 업종 점포 수</th>
						
					<%
							} else {
					%>
						<th>점포 수</th>
						<th>유사 업종 점포 수</th>
						<th>증감률</th>
					<%
							}
						}
					%>
				</tr>
			</thead>
			<tbody>
				<tr>
				<%
					for (int i = 0; i < 5; i++) {
						switch(i) {
						// 2017년 6월
						case 0:
							dto = (StoreDTO) request.getAttribute("strFir");
							strCounts[i] = dto.getStr_count();
				%>
							<td>${strFir.str_count}</td>
							<td>${strFir.smlr_str_count}</td>
				<%
						break;
						// 2017년 12월
						case 1:
							dto = (StoreDTO) request.getAttribute("strSec");
							strCounts[i] = dto.getStr_count();
				%>
							<td>${strSec.str_count}</td>
							<td>${strSec.smlr_str_count}</td>
							<td style="padding-top: 0; padding-bottom: 0; height: 47px; line-height: 47px; vertical-align: middle;">
							<%
								cnt = (double) (strCounts[i] - strCounts[i-1]) * 100 / strCounts[i-1];
								cnt = Double.parseDouble(String.format("%.1f", cnt));
							
								if (cnt > 0) {
							%>
								<i class="fas fa-caret-up"
									style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
							
							<%
								} else if (cnt < 0) {
							%>
								<i class="fas fa-caret-down"
									style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
							<%
								}
							%>
							
							<%=cnt%>%
							</td>
				<%
						break;
						// 2018년 6월
						case 2:
							dto = (StoreDTO) request.getAttribute("strThi");
							strCounts[i] = dto.getStr_count();
				%>
							<td>${strThi.str_count}</td>
							<td>${strThi.smlr_str_count}</td>
							<td style="padding-top: 0; padding-bottom: 0; height: 47px; line-height: 47px; vertical-align: middle;">
							<%
								cnt = (double) (strCounts[i] - strCounts[i-1]) * 100 / strCounts[i-1];
								cnt = Double.parseDouble(String.format("%.1f", cnt));
							
								if (cnt > 0) {
							%>
								<i class="fas fa-caret-up"
									style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
							
							<%
								} else if (cnt < 0) {
							%>
								<i class="fas fa-caret-down"
									style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
							<%
								}
							%>
							
							<%=cnt%>%
							</td>
				<%
						break;
						// 2018년 12월
						case 3:
							dto = (StoreDTO) request.getAttribute("strFour");
							strCounts[i] = dto.getStr_count();
				%>
							<td>${strFour.str_count}</td>
							<td>${strFour.smlr_str_count}</td>
							<td style="padding-top: 0; padding-bottom: 0; height: 47px; line-height: 47px; vertical-align: middle;">
							<%
								cnt = (double) (strCounts[i] - strCounts[i-1]) * 100 / strCounts[i-1];
								cnt = Double.parseDouble(String.format("%.1f", cnt));
							
								if (cnt > 0) {
							%>
								<i class="fas fa-caret-up"
									style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
							
							<%
								} else if (cnt < 0) {
							%>
								<i class="fas fa-caret-down"
									style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
							<%
								}
							%>
							
							<%=cnt%>%
							</td>
				<%
						break;
						// 2019년 6월
						case 4:
							dto = (StoreDTO) request.getAttribute("strFif");
							strCounts[i] = dto.getStr_count();
				%>
							<td>${strFif.str_count}</td>
							<td>${strFif.smlr_str_count}</td>
							<td style="padding-top: 0; padding-bottom: 0; height: 47px; line-height: 47px; vertical-align: middle;">
							<%
								cnt = (double) (strCounts[i] - strCounts[i-1]) * 100 / strCounts[i-1];
								cnt = Double.parseDouble(String.format("%.1f", cnt));
							
								if (cnt > 0) {
							%>
								<i class="fas fa-caret-up"
									style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
							
							<%
								} else if (cnt < 0) {
							%>
								<i class="fas fa-caret-down"
									style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
							<%
								}
							%>
							
							<%=cnt%>%
							</td>
				<%
							break;
						}
					}
				%>
				</tr>
			</tbody>
		</table>
		
		<!-- 점포수 분석 차트 -->
		<center>
			<!-- 방식1. 가로 차트
			<div id="chart_div" style="height: 400px; width: 1300px;"></div>
			<br>
			-->
			<!-- 방식2. 세로 차트 -->
			<div id="chart_div_bar" style="height: 400px; width: 1300px; margin-top: 100px;"></div>
		</center>
		
		<h2 id="part2" style="text-align: left; margin-top: 120px;">2.개업률 / 폐업률 분석</h2>
		<!-- 개업률/폐업률 분석 표 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="2">2017년 6월</th>
					<th colspan="2">2017년 12월</th>
					<th colspan="2">2018년 6월</th>
					<th colspan="2">2018년 12월</th>
					<th colspan="2">2019년 6월</th>
				</tr>
				<tr>
					<%
						for (int i = 0; i < 5; i++) {
					%>
						<th>개업률</th>
						<th>폐업률</th>
					<%
						}
					%>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${strFir.open_rt}%</td>
					<td>${strFir.close_rt}%</td>
					<td>${strSec.open_rt}%</td>
					<td>${strSec.close_rt}%</td>
					<td>${strThi.open_rt}%</td>
					<td>${strThi.close_rt}%</td>
					<td>${strFour.open_rt}%</td>
					<td>${strFour.close_rt}%</td>
					<td>${strFif.open_rt}%</td>
					<td>${strFif.close_rt}%</td>
				</tr>
			</tbody>
		</table>
		
		<center>
			<!-- 개업률 분석 차트 -->
			<div id="chart_div_open" style="height: 400px; width: 800px; float: left; margin-left: 20px;"></div>
			<!-- 폐업률 분석 차트 -->
			<div id="chart_div_close" style="height: 400px; width: 800px; float: right; margin-right: 20px;"></div>
		</center>
	</div>
	
	<!-- top 버튼 -->
	<div id="top" onclick="scrollMove()"
		style="font-size:25px; position:fixed; cursor: pointer; width: fit-content; border:1px solid black;
		left: 1700px; bottom:40px; text-align: right; padding: 5px 10px 10px 10px;">
		<b>top</b>
	</div>

</body>
</html>