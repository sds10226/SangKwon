<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://kit.fontawesome.com/45f7a374e1.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>인구 분석</title>
</head>
<style>
body {
	width: 1700px;
	height: auto;
	margin: auto;
	padding: auto;
}

h2 {
	color: #785655;
}

h4 {
	font-size : 1.5em;
}

.container {
	width: 1700px;
	height: 100px;
}

table {
	border: 1px solid rgb(201, 208, 214);
	width: 1685px;
	height: 100px;
	text-align: center;
	border-collapse: collapse;
}

td {
	border: 1px solid rgb(201, 208, 214);
	font-size: 13px;
}

th {
	border: 1px solid rgb(201, 208, 214);
	background-color: rgb(240, 243, 245);
	font-size: 13px;
}

.tip-container {
	width: 1700px;
	height: 70px;
	font-size: 13px;
	margin-top: 10px;
	background-color: rgb(245, 246, 241);
	padding-right: 15px;
}

.tip-icon {
	float: left;
	width: 65px;
	height: 70px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.tip-content {
	width: 1635px;
	height: 70px;
	display: table-cell;
	vertical-align: middle;
}

.th1 {
	width: 5%;
	background-color: rgb(249, 249, 249);
}

.far fa-hand-point-right {
	font-size: 15px;
	font-color: rgb(46, 211, 174);
}

#local {
	width: 1700px;
	height: 40px;
	float: left;
	padding-top: 20px;
	padding-left: 20px;
	border-bottom: 1px solid black;
	font-size: 15px;
}
</style>
<script type="text/javascript">
	function drawQuarter() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '분기');
		data.addColumn('number', '분기별 유동인구');
		data.addRows([
			["2017-Q1", ${ q_floating.q1_y2017 }], ["2017-Q2", ${ q_floating.q2_y2017 }], ["2017-Q3", ${ q_floating.q3_y2017 }], ["2017-Q4", ${ q_floating.q4_y2017 }],
			["2018-Q1", ${ q_floating.q1_y2018 }], ["2018-Q2", ${ q_floating.q2_y2018 }], ["2018-Q3", ${ q_floating.q3_y2018 }], ["2018-Q4", ${ q_floating.q4_y2018 }],
			["2019-Q1", ${ q_floating.q1_y2019 }], ["2017-Q9", ${ q_floating.q2_y2019 }]
		]);

		var options = {
			colors: ['#ff0000'],
			hAxis: {
				title: '분기'
			},
			vAxis: {
				title: '유동인구(명)'
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_Quarter'));

		chart.draw(data, options);
	}
	function drawGender() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '성별');
		data.addColumn('number', '남성');
		data.addColumn('number', '여성');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[1]*1, values[2]*1]
			]);
			minV = Math.min(values[1], values[2]);
			maxV = Math.max(values[1], values[2]);
		} else{
			data.addRows([
				["", ${ ga_floating.total_male }, ${ ga_floating.total_female }]
			]);	
			minV = Math.min(${ ga_floating.total_male }, ${ ga_floating.total_female });
			maxV = Math.max(${ ga_floating.total_male }, ${ ga_floating.total_female });
		}

		var options = {
			colors: ['#ff0000', '#ff6600'],
			hAxis: {
				title: '성별'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_Gender'));
		chart.draw(data, options);
	}
	function drawAge() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '나이');
		data.addColumn('number', '10대');
		data.addColumn('number', '20대');
		data.addColumn('number', '30대');
		data.addColumn('number', '40대');
		data.addColumn('number', '50대');
		data.addColumn('number', '60대');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[3]*1, values[4]*1, values[5]*1, values[6]*1, values[7]*1, values[8]*1]
			]);
			minV = Math.min(values[3], values[4], values[5], values[6], values[7], values[8]);
			maxV = Math.max(values[3], values[4], values[5], values[6], values[7], values[8]);
		} else{
			data.addRows([
				["", ${ ga_floating.total_10 }, ${ ga_floating.total_20 }, ${ ga_floating.total_30 }, ${ ga_floating.total_40 }, ${ ga_floating.total_50 }, ${ ga_floating.total_60 }]
			]);
			minV = Math.min(${ ga_floating.total_10 }, ${ ga_floating.total_20 }, ${ ga_floating.total_30 }, ${ ga_floating.total_40 }, ${ ga_floating.total_50 }, ${ ga_floating.total_60 });
			maxV = Math.max(${ ga_floating.total_10 }, ${ ga_floating.total_20 }, ${ ga_floating.total_30 }, ${ ga_floating.total_40 }, ${ ga_floating.total_50 }, ${ ga_floating.total_60 });
		}

		var options = {
			title: '',
			colors: ['#ff0000', '#ff6600', '#ffff00', '#00cc66', '#0099ff', '#9966ff'],
			hAxis: {
				title: '연령'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_Age'));
		chart.draw(data, options);
	}
	function drawTime() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '시간대');
		data.addColumn('number', '00~06시');
		data.addColumn('number', '06~12시');
		data.addColumn('number', '12~15시');
		data.addColumn('number', '15~18시');
		data.addColumn('number', '18~21시');
		data.addColumn('number', '21~24시');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[1]*1, values[2]*1, values[3]*1, values[4]*1, values[5]*1, values[6]*1]
			]);
			minV = Math.min(values[1], values[2], values[3], values[4], values[5], values[6]);
			maxV = Math.max(values[1], values[2], values[3], values[4], values[5], values[6]);
		} else{
			data.addRows([
				["", ${ t_floating.total_time1 }, ${ t_floating.total_time2 }, ${ t_floating.total_time3 }, ${ t_floating.total_time4 }, ${ t_floating.total_time5 }, ${ t_floating.total_time6 }]
			]);
			minV = Math.min(${ t_floating.total_time1 }, ${ t_floating.total_time2 }, ${ t_floating.total_time3 }, ${ t_floating.total_time4 }, ${ t_floating.total_time5 }, ${ t_floating.total_time6 });
			maxV = Math.max(${ t_floating.total_time1 }, ${ t_floating.total_time2 }, ${ t_floating.total_time3 }, ${ t_floating.total_time4 }, ${ t_floating.total_time5 }, ${ t_floating.total_time6 });
		}

		var options = {
			title: '',
			colors: ['#ff0000', '#ff6600', '#ffff00', '#00cc66', '#0099ff', '#9966ff'],
			hAxis: {
				title: '시간대'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_Time'));
		chart.draw(data, options);
	}
	function drawWeekend() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '주말');
		data.addColumn('number', '주말');
		data.addColumn('number', '주중');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[0]*1, values[1]*1]
			]);
			minV = Math.min(values[0], values[1]);
			maxV = Math.max(values[0], values[1]);
		} else{
			data.addRows([
				["", ${ W_floating.total_weekend }, ${ W_floating.total_week }]
			]);
			minV = Math.min(${ W_floating.total_weekend }, ${ W_floating.total_week });
			maxV = Math.max(${ W_floating.total_weekend }, ${ W_floating.total_week });	
		}
		
		var options = {
			colors: ['#ff0000', '#ff6600'],
			hAxis: {
				title: '주말/주중'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.8],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_Weekend'));
		chart.draw(data, options);
	}
	function drawWeekday() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '요일');
		data.addColumn('number', '일요일');
		data.addColumn('number', '월요일');
		data.addColumn('number', '화요일');
		data.addColumn('number', '수요일');
		data.addColumn('number', '목요일');
		data.addColumn('number', '금요일');
		data.addColumn('number', '토요일');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[2]*1, values[3]*1, values[4]*1, values[5]*1, values[6]*1, values[7]*1, values[8]*1]
			]);
			minV = Math.min(values[2], values[3], values[4], values[5], values[6], values[7]);
			maxV = Math.max(values[2], values[3], values[4], values[5], values[6], values[7]);
		} else{
			data.addRows([
				["", ${ W_floating.total_sun }, ${ W_floating.total_mon }, ${ W_floating.total_tue }, ${ W_floating.total_wed }, ${ W_floating.total_thu }, ${ W_floating.total_fri }, ${ W_floating.total_sat }]
			]);
			minV = Math.min(${ W_floating.total_sun }, ${ W_floating.total_mon }, ${ W_floating.total_tue }, ${ W_floating.total_wed }, ${ W_floating.total_thu }, ${ W_floating.total_fri }, ${ W_floating.total_sat });
			maxV = Math.max(${ W_floating.total_sun }, ${ W_floating.total_mon }, ${ W_floating.total_tue }, ${ W_floating.total_wed }, ${ W_floating.total_thu }, ${ W_floating.total_fri }, ${ W_floating.total_sat });
		}

		var options = {
			title: '',
			colors: ['#ff0000', '#ff6600', '#ffff00', '#00cc66', '#0099ff', '#9966ff', '#ffccff'],
			hAxis: {
				title: '요일'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_Weekday'));
		chart.draw(data, options);
	}
	function drawRGender() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '성별');
		data.addColumn('number', '남성');
		data.addColumn('number', '여성');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[1]*1, values[2]*1]
			]);
			minV = Math.min(values[1], values[2]);
			maxV = Math.max(values[1], values[2]);
		} else{
			data.addRows([
				["", ${residence.total_male}, ${residence.total_female}]
			]);
			minV = Math.min(${residence.total_male}, ${residence.total_female});
			maxV = Math.max(${residence.total_male}, ${residence.total_female});

		}

		var options = {
			colors: ['#ff0000', '#ff6600'],
			hAxis: {
				title: '성별'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_R_G'));
		chart.draw(data, options);
	}
	function drawRAge() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '나이');
		data.addColumn('number', '10대');
		data.addColumn('number', '20대');
		data.addColumn('number', '30대');
		data.addColumn('number', '40대');
		data.addColumn('number', '50대');
		data.addColumn('number', '60대');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[3]*1, values[4]*1, values[5]*1, values[6]*1, values[7]*1, values[8]*1]
			]);
			minV = Math.min(values[3], values[4], values[5], values[6], values[7], values[8]);
			maxV = Math.max(values[3], values[4], values[5], values[6], values[7], values[8]);
		} else{
			data.addRows([
				["", ${ residence.total_10 }, ${ residence.total_20 }, ${ residence.total_30 }, ${ residence.total_40 }, ${ residence.total_50 }, ${ residence.total_60 }]
			]);
			minV = Math.min(${ residence.total_10 }, ${ residence.total_20 }, ${ residence.total_30 }, ${ residence.total_40 }, ${ residence.total_50 }, ${ residence.total_60 });
			maxV = Math.max(${ residence.total_10 }, ${ residence.total_20 }, ${ residence.total_30 }, ${ residence.total_40 }, ${ residence.total_50 }, ${ residence.total_60 });
		}

		var options = {
			title: '',
			colors: ['#ff0000', '#ff6600', '#ffff00', '#00cc66', '#0099ff', '#9966ff'],
			hAxis: {
				title: '연령'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_R_A'));
		chart.draw(data, options);
	}
	function drawSGender() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '성별');
		data.addColumn('number', '남성');
		data.addColumn('number', '여성');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[1]*1, values[2]*1]
			]);
			minV = Math.min(values[1], values[2]);
			maxV = Math.max(values[1], values[2]);
		} else{
			data.addRows([
				["", ${ salleryMan.total_male }, ${ salleryMan.total_female }]
			]);
			minV = Math.min(${ salleryMan.total_male }, ${ salleryMan.total_female });
			maxV = Math.max(${ salleryMan.total_male }, ${ salleryMan.total_female });

		}

		var options = {
			colors: ['#ff0000', '#ff6600'],
			hAxis: {
				title: '성별'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_S_G'));
		chart.draw(data, options);
	}
	function drawSAge() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '나이');
		data.addColumn('number', '10대');
		data.addColumn('number', '20대');
		data.addColumn('number', '30대');
		data.addColumn('number', '40대');
		data.addColumn('number', '50대');
		data.addColumn('number', '60대');
		var minV = 0;
		var maxV = 0;
		var resp = window.eventthing;
		if(resp.responseText!=undefined){
			var values = resp.responseText.split("|");
			data.addRows([
				["", values[3]*1, values[4]*1, values[5]*1, values[6]*1, values[7]*1, values[8]*1]
			]);
			minV = Math.min(values[3], values[4], values[5], values[6], values[7], values[8]);
			maxV = Math.max(values[3], values[4], values[5], values[6], values[7], values[8]);
		} else{
			data.addRows([
				["", ${ salleryMan.total_10 }, ${ salleryMan.total_20 }, ${ salleryMan.total_30 }, ${ salleryMan.total_40 }, ${ salleryMan.total_50 }, ${ salleryMan.total_60 }]
			]);
			minV = Math.min(${ salleryMan.total_10 }, ${ salleryMan.total_20 }, ${ salleryMan.total_30 }, ${ salleryMan.total_40 }, ${ salleryMan.total_50 }, ${ salleryMan.total_60 });
			maxV = Math.max(${ salleryMan.total_10 }, ${ salleryMan.total_20 }, ${ salleryMan.total_30 }, ${ salleryMan.total_40 }, ${ salleryMan.total_50 }, ${ salleryMan.total_60 });	
		}

		var options = {
			title: '',
			colors: ['#ff0000', '#ff6600', '#ffff00', '#00cc66', '#0099ff', '#9966ff'],
			hAxis: {
				title: '연령'
			},
			vAxis: {
				title: '유동인구(명)',
				viewWindow: {
					min: [minV * 0.9],
					max: [maxV * 1.1]
				}
			}
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_S_A'));
		chart.draw(data, options);
	}

	window.onload = function (event) {
		window.eventthing = event;
		google.charts.load('current', { packages: ['corechart', 'line'] });
		google.charts.setOnLoadCallback(drawQuarter);
		google.charts.load('current', { packages: ['corechart', 'bar'] });
		google.charts.setOnLoadCallback(drawGender);
		google.charts.setOnLoadCallback(drawAge);
		google.charts.setOnLoadCallback(drawTime);
		google.charts.setOnLoadCallback(drawWeekend);
		google.charts.setOnLoadCallback(drawWeekday);
		google.charts.setOnLoadCallback(drawRGender);
		google.charts.setOnLoadCallback(drawRAge);
		google.charts.setOnLoadCallback(drawSGender);
		google.charts.setOnLoadCallback(drawSAge);
	}
</script>

<body>
	<!--인구분석 anchor  -->
	<div id="local" style="float: left;">
		<a href="#floatingPop" style="color: black; text-decoration: none;">1.유동인구</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#residencePop" style="color: black; text-decoration: none;">2.주거인구</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#salleryManPop" style="color: black; text-decoration: none;">3.직장인구</a>
	</div>

	<!-- 1. 유동인구 -->
	<div class="main-container" style="float: left;">
		<h4 style="text-align: left; margin-top: 20px;">
			<b>${area} - ${food}</b>
		</h4>
		<h2 id="floatingPop">1.유동인구</h2>
		<h3>-분기별 유동인구</h3>
		<div id="chart_Quarter"
			style="width: 99%; height: 500px; border: 1px solid rgb(201, 208, 214);"></div>

		<!--분기별 유동인구 표  -->
		<div class="container">
			<table>
				<tr>
					<th>분기</th>
					<th>2017년 1분기</th>
					<th>2017년 2분기</th>
					<th>2017년 3분기</th>
					<th>2017년 4분기</th>
					<th>2018년 1분기</th>
					<th>2018년 2분기</th>
					<th>2018년 3분기</th>
					<th>2018년 4분기</th>
					<th>2019년 1분기</th>
					<th>2019년 2분기</th>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td name="floatingDataQ">${q_floating.q1_y2017}</td>
					<td name="floatingDataQ">${q_floating.q2_y2017}</td>
					<td name="floatingDataQ">${q_floating.q3_y2017}</td>
					<td name="floatingDataQ">${q_floating.q4_y2017}</td>
					<td name="floatingDataQ">${q_floating.q1_y2018}</td>
					<td name="floatingDataQ">${q_floating.q2_y2018}</td>
					<td name="floatingDataQ">${q_floating.q3_y2018}</td>
					<td name="floatingDataQ">${q_floating.q4_y2018}</td>
					<td name="floatingDataQ">${q_floating.q1_y2019}</td>
					<td name="floatingDataQ">${q_floating.q2_y2019}</td>
				</tr>
				<tr>
					<td>증감률(%)</td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
					<td name="floatingRateQ"></td>
				</tr>
			</table>
		</div>
		<script>
			//증감률 계산 스크립트
			var floatingData = document.getElementsByName('floatingDataQ');
			var floatingRate = document.getElementsByName('floatingRateQ');
			floatingRate[0].innerHTML = "-";
			for (var i = 1; i < floatingData.length; i++) {
				floatingRate[i].innerHTML = ((floatingData[i].innerHTML - floatingData[i - 1].innerHTML) * 100 / floatingData[i - 1].innerHTML).toFixed(2);
				var arrow = document.createElement('i');
				if (floatingRate[i].innerHTML < 0) {
					arrow.className = "fas fa-caret-down";
					arrow.style = "color:blue; font-size:14px;"
				} else if (floatingRate[i].innerHTML == 0) {
					arrow.className = "fas fa-minus";
					arrow.style = "color:gray; font-size:14px;"
				} else if (floatingRate[i].innerHTML > 0) {
					arrow.className = "fas fa-caret-up";
					arrow.style = "color:red; font-size:14px;"
				}
				floatingRate[i].appendChild(arrow);
			}
		</script>

		<!-- 성별 / 연령별 유동인구 -->
		<div>
			<h3 style="display: inline-block;">-성별 / 연령별 유동인구</h3>
			<select name="GenderAndAge"
				style="display: inline-block; margin-left: 1370px;"
				onchange=selectGAA()>
				<option value="2017/1">2017년 1분기</option>
				<option value="2017/2">2017년 2분기</option>
				<option value="2017/3">2017년 3분기</option>
				<option value="2017/4">2017년 4분기</option>
				<option value="2018/1">2018년 1분기</option>
				<option value="2018/2">2018년 2분기</option>
				<option value="2018/3">2018년 3분기</option>
				<option value="2018/4">2018년 4분기</option>
				<option value="2019/1">2019년 1분기</option>
				<option value="2019/2" selected>2019년 2분기</option>
			</select>
		</div>
		<div id="chart_Gender"
			style="width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>
		<div id="chart_Age"
			style="margin-left: 7px; width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;">
		</div>

		<!-- 성별 / 연령별 유동인구 표  -->
		<div class="container">
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th rowspan="2">일일</th>
					<th colspan="2">성별</th>
					<th colspan="6">연령별</th>
				</tr>
				<tr>
					<td>남성</td>
					<td>여성</td>
					<td>10대</td>
					<td>20대</td>
					<td>30대</td>
					<td>40대</td>
					<td>50대</td>
					<td>60대</td>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td name="floatingDataG" rowspan="2">${ga_floating.total}</td>
					<td name="floatingDataG">${ga_floating.total_male}</td>
					<td name="floatingDataG">${ga_floating.total_female}</td>
					<td name="floatingDataG">${ga_floating.total_10}</td>
					<td name="floatingDataG">${ga_floating.total_20}</td>
					<td name="floatingDataG">${ga_floating.total_30}</td>
					<td name="floatingDataG">${ga_floating.total_40}</td>
					<td name="floatingDataG">${ga_floating.total_50}</td>
					<td name="floatingDataG">${ga_floating.total_60}</td>
				</tr>
				<tr>
					<td>비율(%)</td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
					<td name="floatingRateG"></td>
				</tr>
			</table>
		</div>
		<script>
			//비율 계산 함수
			function calGender(){
				var floatingData = document.getElementsByName('floatingDataG');
				var floatingRate = document.getElementsByName('floatingRateG');
				for (var i = 0; i < floatingRate.length; i++) {
					floatingRate[i].innerHTML = (floatingData[i + 1].innerHTML * 100 / floatingData[0].innerHTML).toFixed(2);
				}
			}
			calGender();

			//분기선택 변경함수
			function selectGAA(){
				console.dir(event);
				var year_quater = (event.srcElement.value).split("/");
				var form={
					select_year:year_quater[0],
					select_quarter:year_quater[1],
					population_type:"GenderAndAge"
				}
				$.ajax({
					url:"getSelectPopData.do",
					type:"POST",
					data: form,
					success: function(data, statusText, resp){
						if(data=="undefined"){
							return;
						}
						var rawvalue = data.split("|");
						var tabledata = document.getElementsByName('floatingDataG');
						for(var i=0; i<tabledata.length; i++){
							tabledata[i].innerHTML = rawvalue[i];
						};
						window.eventthing = resp;
						calGender();
						RedrawGenderGraph();
					}
				})
			}
			
			// 그래프 다시 그리기 함수
			function RedrawGenderGraph(){
				google.charts.setOnLoadCallback(drawGender);
				google.charts.setOnLoadCallback(drawAge);
			}
		</script>

		<!-- 시간대별 유동인구 -->
		<div>
			<h3 style="display: inline-block;">-시간대별 유동인구</h3>
			<select name="TimeRange"
				style="display: inline-block; margin-left: 1410px;"
				onchange=selectTime()>
				<option value="2017/1">2017년 1분기</option>
				<option value="2017/2">2017년 2분기</option>
				<option value="2017/3">2017년 3분기</option>
				<option value="2017/4">2017년 4분기</option>
				<option value="2018/1">2018년 1분기</option>
				<option value="2018/2">2018년 2분기</option>
				<option value="2018/3">2018년 3분기</option>
				<option value="2018/4">2018년 4분기</option>
				<option value="2019/1">2019년 1분기</option>
				<option value="2019/2" selected>2019년 2분기</option>
			</select>
		</div>
		<div id="chart_Time"
			style="width: 99%; height: 500px; border: 1px solid rgb(201, 208, 214);"></div>

		<!-- 시간대별 유동인구 표  -->
		<div class="container">
			<table>
				<tr>
					<th>구분</th>
					<th>일일</th>
					<th>00 ~ 06시</th>
					<th>06 ~ 12시</th>
					<th>12 ~ 15시</th>
					<th>15 ~ 18시</th>
					<th>18 ~ 21시</th>
					<th>21 ~ 24시</th>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td name="floatingDataT" rowspan="2">${t_floating.total}</td>
					<td name="floatingDataT">${t_floating.total_time1}</td>
					<td name="floatingDataT">${t_floating.total_time2}</td>
					<td name="floatingDataT">${t_floating.total_time3}</td>
					<td name="floatingDataT">${t_floating.total_time4}</td>
					<td name="floatingDataT">${t_floating.total_time5}</td>
					<td name="floatingDataT">${t_floating.total_time6}</td>
				</tr>
				<tr>
					<td>비율(%)</td>
					<td name="floatingRateT"></td>
					<td name="floatingRateT"></td>
					<td name="floatingRateT"></td>
					<td name="floatingRateT"></td>
					<td name="floatingRateT"></td>
					<td name="floatingRateT"></td>
				</tr>
			</table>
		</div>
		<script>
			//비율 계산 함수
			function calTime(){
				var floatingData = document.getElementsByName('floatingDataT');
				var floatingRate = document.getElementsByName('floatingRateT');
				for (var i = 0; i < floatingRate.length; i++) {
					floatingRate[i].innerHTML = (floatingData[i + 1].innerHTML * 100 / floatingData[0].innerHTML).toFixed(2);
				}
			}
			calTime();

			//분기선택 변경함수
			function selectTime(){
				var year_quater = (event.srcElement.value).split("/");
				var form={
					select_year:year_quater[0],
					select_quarter:year_quater[1],
					population_type:"TimeRange"
				}
				$.ajax({
					url:"getSelectPopData.do",
					type:"POST",
					data: form,
					success: function(data, statusText, resp){
						if(data=="undefined"){
							return;
						}
						var rawvalue = data.split("|");
						var tabledata = document.getElementsByName('floatingDataT');
						for(var i=0; i<tabledata.length; i++){
							tabledata[i].innerHTML = rawvalue[i];
						};
						window.eventthing = resp;
						calTime();
						RedrawTimeGraph();
					}
				})
			}
			
			// 그래프 다시 그리기 함수
			function RedrawTimeGraph(){
				google.charts.setOnLoadCallback(drawTime);
			}
		</script>

		<!-- 주중/주말, 요일별 유동인구 -->
		<div>
			<h3 style="display: inline-block;">-주중/주말, 요일별 유동인구</h3>
			<select name="Week"
				style="display: inline-block; margin-left: 1332px;"
				onchange=selectWeek()>
				<option value="2017/1">2017년 1분기</option>
				<option value="2017/2">2017년 2분기</option>
				<option value="2017/3">2017년 3분기</option>
				<option value="2017/4">2017년 4분기</option>
				<option value="2018/1">2018년 1분기</option>
				<option value="2018/2">2018년 2분기</option>
				<option value="2018/3">2018년 3분기</option>
				<option value="2018/4">2018년 4분기</option>
				<option value="2019/1">2019년 1분기</option>
				<option value="2019/2" selected>2019년 2분기</option>
			</select>
		</div>
		<div id="chart_Weekend"
			style="width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>
		<div id="chart_Weekday"
			style="margin-left: 7px; width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;">
		</div>

		<!-- 주중/주말, 요일별 유동인구 표  -->

		<div class="container">
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th colspan="2">주말/주중</th>
					<th colspan="7">요일별</th>
				</tr>
				<tr>
					<td>주말</td>
					<td>주중</td>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td name="floatingDataW">${W_floating.total_weekend}</td>
					<td name="floatingDataW">${W_floating.total_week}</td>
					<td name="floatingDataW">${W_floating.total_sun}</td>
					<td name="floatingDataW">${W_floating.total_mon}</td>
					<td name="floatingDataW">${W_floating.total_tue}</td>
					<td name="floatingDataW">${W_floating.total_wed}</td>
					<td name="floatingDataW">${W_floating.total_thu}</td>
					<td name="floatingDataW">${W_floating.total_fri}</td>
					<td name="floatingDataW">${W_floating.total_sat}</td>
				</tr>
				<tr>
					<td>비율(%)</td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
					<td name="floatingRateW"></td>
				</tr>
			</table>
		</div>
		<script>
			//비율 계산 함수
			function calWeek(){
				var floatingData = document.getElementsByName('floatingDataW');
				var floatingRate = document.getElementsByName('floatingRateW');
				var total = floatingData[0].innerHTML*1+floatingData[1].innerHTML*1;
				for (var i = 0; i < floatingRate.length; i++) {
					floatingRate[i].innerHTML = (floatingData[i].innerHTML * 100 / total).toFixed(2);
				}
			}
			calWeek();

			//분기선택 변경함수
			function selectWeek(){
				var year_quater = (event.srcElement.value).split("/");
				var form={
					select_year:year_quater[0],
					select_quarter:year_quater[1],
					population_type:"Week"
				}
				$.ajax({
					url:"getSelectPopData.do",
					type:"POST",
					data: form,
					success: function(data, statusText, resp){
						if(data=="undefined"){
							return;
						}
						var rawvalue = data.split("|");
						var tabledata = document.getElementsByName('floatingDataW');
						for(var i=0; i<tabledata.length; i++){
							tabledata[i].innerHTML = rawvalue[i];
						};
						window.eventthing = resp;
						calWeek();
						RedrawWeekGraph();
					}
				})
			}
			
			// 그래프 다시 그리기 함수
			function RedrawWeekGraph(){
				google.charts.setOnLoadCallback(drawWeekend);
				google.charts.setOnLoadCallback(drawWeekday);
			}
		</script>

		<!-- TIP  -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">유동인구는 통신사 휴대전화 통화량을 바탕으로 전국 50M셀로 추정한
				유동인구수 정보입니다. 분석영역이 중심에서 300M를 넘으면 중심 300M 내 유동인구를 분석하며, 해당월 평균
				추정데이터입니다. 유동인구는 법인 등 이동통신기기를 통해 수집되는 정보가 가감되어 총합이 일부 다를 수 있습니다.</div>
		</div>

		<!--2. 주거인구  -->
		<h2 id="residencePop">2.주거인구</h2>
		<div>
			<h3 style="display: inline-block;">-성별 / 연령별 주거인구</h3>
			<select name="residence"
				style="display: inline-block; margin-left: 1368px;"
				onchange=selectResidence()>
				<option value="2017/1">2017년 1분기</option>
				<option value="2017/2">2017년 2분기</option>
				<option value="2017/3">2017년 3분기</option>
				<option value="2017/4">2017년 4분기</option>
				<option value="2018/1">2018년 1분기</option>
				<option value="2018/2">2018년 2분기</option>
				<option value="2018/3">2018년 3분기</option>
				<option value="2018/4">2018년 4분기</option>
				<option value="2019/1">2019년 1분기</option>
				<option value="2019/2" selected>2019년 2분기</option>
			</select>
		</div>
		<div id="chart_R_G"
			style="width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>
		<div id="chart_R_A"
			style="margin-left: 7px; width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>

		<div class="container">
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th rowspan="2">가구수</th>
					<th rowspan="2">일일</th>
					<th colspan="2">성별</th>
					<th colspan="6">연령별</th>
				</tr>
				<tr>
					<td>남성</td>
					<td>여성</td>
					<td>10대</td>
					<td>20대</td>
					<td>30대</td>
					<td>40대</td>
					<td>50대</td>
					<td>60대</td>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td>${residence.family_total}</td>
					<td name="residenceData">${residence.total}</td>
					<td name="residenceData">${residence.total_male}</td>
					<td name="residenceData">${residence.total_female}</td>
					<td name="residenceData">${residence.total_10}</td>
					<td name="residenceData">${residence.total_20}</td>
					<td name="residenceData">${residence.total_30}</td>
					<td name="residenceData">${residence.total_40}</td>
					<td name="residenceData">${residence.total_50}</td>
					<td name="residenceData">${residence.total_60}</td>
				</tr>
				<tr>
					<td>비율(%)</td>
					<td>100.00</td>
					<td>100.00</td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
					<td name="residenceRate"></td>
				</tr>
			</table>
		</div>
		<script>
			//비율 계산 함수
			function calResidence(){
				var floatingData = document.getElementsByName('residenceData');
				var floatingRate = document.getElementsByName('residenceRate');
				for (var i = 0; i < floatingRate.length; i++) {
					floatingRate[i].innerHTML = (floatingData[i + 1].innerHTML * 100 / floatingData[0].innerHTML).toFixed(2);
				}
			}
			calResidence();

			//분기선택 변경함수
			function selectResidence(){
				var year_quater = (event.srcElement.value).split("/");
				var form={
					select_year:year_quater[0],
					select_quarter:year_quater[1],
					population_type:"Residence"
				}
				$.ajax({
					url:"getSelectPopData.do",
					type:"POST",
					data: form,
					success: function(data, statusText, resp){
						if(data=="undefined"){
							return;
						}
						var rawvalue = data.split("|");
						var tabledata = document.getElementsByName('residenceData');
						for(var i=0; i<tabledata.length; i++){
							tabledata[i].innerHTML = rawvalue[i];
						};
						window.eventthing = resp;
						calResidence();
						RedrawResidenceGraph();
					}
				})
			}
			
			// 그래프 다시 그리기 함수
			function RedrawResidenceGraph(){
				google.charts.setOnLoadCallback(drawRGender);
				google.charts.setOnLoadCallback(drawRAge);	
			}
		</script>

		<!-- TIP -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">주거인구 통계를 통해 예상고객 규모를 추정하실 수 있으며,
				성별/연령대별 분포를 통해 주요 고객군에 대한 정보를 확인하실 수 있습니다.</div>
		</div>

		<!-- 3.직장인구 -->
		<h2 id="salleryManPop">3.직장인구</h2>
		<div>
			<h3 style="display: inline-block;">-성별 / 연령별 주거인구</h3>
			<select name="residence"
				style="display: inline-block; margin-left: 1368px;"
				onchange=selectSalleryMan()>
				<option value="2017/1">2017년 1분기</option>
				<option value="2017/2">2017년 2분기</option>
				<option value="2017/3">2017년 3분기</option>
				<option value="2017/4">2017년 4분기</option>
				<option value="2018/1">2018년 1분기</option>
				<option value="2018/2">2018년 2분기</option>
				<option value="2018/3">2018년 3분기</option>
				<option value="2018/4">2018년 4분기</option>
				<option value="2019/1">2019년 1분기</option>
				<option value="2019/2" selected>2019년 2분기</option>
			</select>
		</div>
		<div id="chart_S_G"
			style="width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>
		<div id="chart_S_A"
			style="margin-left: 7px; width: 49%; height: 500px; border: 1px solid rgb(201, 208, 214); display: inline-block;"></div>

		<div class="cotainer">
			<table class="">
				<tr>
					<th rowspan="2">구분</th>
					<th rowspan="2">일일</th>
					<th colspan="2">성별</th>
					<th colspan="6">연령별</th>
				</tr>
				<tr>
					<td>남성</td>
					<td>여성</td>
					<td>10대</td>
					<td>20대</td>
					<td>30대</td>
					<td>40대</td>
					<td>50대</td>
					<td>60대</td>
				</tr>
				<tr>
					<td>인구수(명)</td>
					<td name="salleryManData">${salleryMan.total}</td>
					<td name="salleryManData">${salleryMan.total_male}</td>
					<td name="salleryManData">${salleryMan.total_female}</td>
					<td name="salleryManData">${salleryMan.total_10}</td>
					<td name="salleryManData">${salleryMan.total_20}</td>
					<td name="salleryManData">${salleryMan.total_30}</td>
					<td name="salleryManData">${salleryMan.total_40}</td>
					<td name="salleryManData">${salleryMan.total_50}</td>
					<td name="salleryManData">${salleryMan.total_60}</td>
				</tr>
				<tr>
					<td>비율(%)</td>
					<td>100.00</td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
					<td name="salleryManRate"></td>
				</tr>
			</table>
		</div>
		<script>
			//비율 계산 함수
			function calSalleryMan(){
				var floatingData = document.getElementsByName('salleryManData');
				var floatingRate = document.getElementsByName('salleryManRate');
				for (var i = 0; i < floatingRate.length; i++) {
					floatingRate[i].innerHTML = (floatingData[i + 1].innerHTML * 100 / floatingData[0].innerHTML).toFixed(2);
				}
			}
			calSalleryMan();

			//분기선택 변경함수
			function selectSalleryMan(){
				var year_quater = (event.srcElement.value).split("/");
				var form={
					select_year:year_quater[0],
					select_quarter:year_quater[1],
					population_type:"SalleryMan"
				}
				$.ajax({
					url:"getSelectPopData.do",
					type:"POST",
					data: form,
					success: function(data, statusText, resp){
						var rawvalue = data.split("|");
						var tabledata = document.getElementsByName('salleryManData');
						for(var i=0; i<tabledata.length; i++){
							tabledata[i].innerHTML = rawvalue[i];
						};
						window.eventthing = resp;
						calSalleryMan();
						RedrawSalleryManGraph();
					}
				})
			}
			
			// 그래프 다시 그리기 함수
			function RedrawSalleryManGraph(){
				google.charts.setOnLoadCallback(drawSGender);
				google.charts.setOnLoadCallback(drawSAge);	
			}
		</script>
		<!--TIP -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">직장인구 통계를 통해 예상고객 규모를 추정하실 수 있으며,
				성별/연령대별 분포를 통해 주요 고객군에 대한 정보를 확인하실 수 있습니다.</div>
		</div>

		<!-- 4. 직업 / 직종
		<div style="padding-top: 50px;">
			<h2 id="job">4.직업 / 직종</h2>
		</div>
		<div>
			<h3>-아파트 동/세대수 추이</h3>
		</div>
		<div class="cotainer">
			<table class="">
				<tr class="">
					<th class="" rowspan="2" colspan="2" style="width: 20%">구분</th>
					<th class="" rowspan="2" colspan="2">가구수</th>
					<th class="" colspan="2">주거형태</th>
				</tr>
				<tr>
					<th>아파트</th>
					<th>이 외</th>
				</tr>
				<tr>
					<td class="" rowspan="2"><b>제1선택영역</b></td>
					<td class=""><b>수</b></td>
					<td class="" colspan="2">1</td>
					<td class="">1</td>
					<td class="">1</td>
				</tr>
				<tr>
					<td class=""><b>비율</b></td>
					<td class="" colspan="2">1</td>
					<td class="">1</td>
					<td class="">1</td>
				</tr>
			</table>
		</div>
	
		<div class="tip-container" style="height: 100px; padding-top: 15px; ">
			<div class="tip-icon">
				<p><i class="far fa-hand-point-right"></i>TIP</p>
			</div>
			<div class="tip-content">
				아파트, 비아파트 등 주거형태 분포는 입지를 선택하는 데 중요한 요인입니다.
				아파트 밀집지역의 경우 거의 일정한 유동인구의 통로가 있으나, 비 아파트의 경우 유동인구가 분산되는 경향이 있습니다.
				또한 아파트의 규모와 면적, 가격 등은 소득 수준을 예측하는 자료로서 업종의 선정이나 점포의 규모, 수준을 계획하는 것에 도움이 됩니다.
				아파트 면적별 세대 수는 소득 및 가구구성 형태를 추정할 수 있는 자료입니다. 작은 면적에 비해 큰 면적의 세대가 상대적으로 세대 구성원의 수가 많고 소득이 큰 경우가 많습니다.
				기준시가별 세대수는 소득을 추정할 수 있는 자료입니다. 소득수준은 객단가와 관계가 있으니 배후 세대의 소득수준에 따른 세부 아이템 선정에 활용할 수 있습니다.
			</div>
		</div>-->

	</div>
	</div>

</body>

</html>