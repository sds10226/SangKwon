<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상권분석</title>
<style>

/*public*/
body {
	margin: auto;
	padding: auto;
	height: 4150px;
}

section {
	width: 1080px; /*1700*/
	margin: 0 auto;
}

section>div {
	padding-bottom: 50px;
}

h2 {
	color: #785655;
}

table {
	border: 1px solid rgb(201, 208, 214);
	border-collapse: collapse;
	width: 100%;
	line-height: 30px;
	text-align: center;
	font-size: 13px;
}

th {
	border: 1px solid rgb(201, 208, 214);
	background-color: rgb(240, 243, 245);
}

td {
	border: 1px solid rgb(201, 208, 214);
}

.tip {
	width: calc(100% - 40px);
	padding: 20px;
	line-height: 30px;
	font-size: 13px;
	background-color: rgb(245, 246, 241);
	display: inline-flex;
	position: relative;
}

.tip div:nth-child(1) {
	width: 80px;
}

/*chart*/
.chart {
	width: 350px; /*width: fit-content*/
	height: 210px;
	overflow: hidden;
}

.chart-skills {
	padding: 0;
	list-style-type: none;
	overflow: hidden;
	position: relative;
	width: 350px;
	height: 175px;
}

.chart-skills *, .chart-skills::before {
	box-sizing: border-box;
}

.chart-skills::before {
	position: absolute;
	content: '';
	width: inherit;
	height: inherit;
	border: 65px solid rgba(211, 211, 211, .3);
	border-bottom: none;
	border-top-left-radius: 175px;
	border-top-right-radius: 175px;
}

.chart-skills li {
	position: absolute;
	top: 100%;
	left: 0;
	width: inherit;
	height: inherit;
	border: 65px solid;
	border-top: none;
	border-bottom-left-radius: 175px;
	border-bottom-right-radius: 175px;
	transform-origin: 50% 0;
}

.chart-skills li:nth-child(1) {
	z-index: 5;
	border-color: deepskyblue;
	animation: chartAni1 2s linear 1 forwards;
}

.chart-skills li:nth-child(2) {
	z-index: 4;
	border-color: green;
	animation: chartAni2 2s linear 1 forwards;
}

.chart-skills li:nth-child(3) {
	z-index: 3;
	border-color: gold;
	animation: chartAni3 2s linear 1 forwards;
}

.chart-skills li:nth-child(4) {
	z-index: 2;
	border-color: orangered;
	animation: chartAni4 2s linear 1 forwards;
}

.chart-skills li:nth-child(5) {
	z-index: 1;
	border-color: red;
	animation: chartAni5 2s linear 1 forwards;
}

@keyframes chartAni1 {
    0% {
        transform: rotateZ(0);
    }

    20% {
        transform: rotateZ(36deg)
    }

    100% {
        transform: rotateZ(36deg)
    }
}

@keyframes chartAni2 {
    0% {
        transform: rotateZ(0);
    }

    20% {
        transform: rotateZ(36deg);
    }

    40% {
        transform: rotateZ(72deg);
    }

    100% {
        transform: rotateZ(72deg);
    }
}

@keyframes chartAni3 {
    0% {
        transform: rotateZ(0);
    }

    40% {
        transform: rotateZ(72deg)
    }

    60% {
        transform: rotateZ(108deg)
    }

    100% {
        transform: rotateZ(108deg)
    }
}

@keyframes chartAni4 {
    0% {
        transform: rotateZ(0);
    }

    60% {
        transform: rotateZ(108deg)
    }

    80% {
        transform: rotateZ(144deg)
    }

    100% {
        transform: rotateZ(144deg)
    }
}

@keyframes chartAni5 {
    0% {
        transform: rotateZ(0);
    }

    80% {
        transform: rotateZ(144deg)
    }

    100% {
        transform: rotateZ(180deg)
    }
}

.chart-skills li span {
	color: white;
	font-weight: bold;
	margin-left: -45px;
	margin-top: 35px;
	position: absolute;
}

.chart-skills li:nth-child(1) span {
	transform: rotate(-36deg);
}

.chart-skills li:nth-child(2) span {
	transform: rotate(-72deg);
}

.chart-skills li:nth-child(3) span {
	transform: rotate(-108deg);
}

.chart-skills li:nth-child(4) span {
	transform: rotateZ(-144deg)
}

.chart-skills li:nth-child(5) span {
	transform: rotateZ(-180deg)
}

.chart-pointer {
	position: relative;
	margin-left: 170px;
	bottom: 120px;
	transform-origin: bottom;
	display: block;
	width: 10px;
	height: 100px;
	background-color: black;
	border-radius: 50% 50% 50% 50%/90% 90% 10% 10%;
	transform: rotateZ(-35deg) /*-75,-35,0,35,75*/
}

.chart-result {
	border-radius: 10px;
	text-align: center;
	padding: 10px;
	background-color: green;
	color: white;
}

/*icon*/
.fa-caret-up {
	color: red;
	font-size: large;
}

.fa-caret-down {
	color: blue;
	font-size: large;
}

.anchor {
	width: 100%;
	padding: 20px;
	border-bottom: 1px solid black;
	font-size: 15px;
}
	
</style>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<script>
	var q = calcQuarter();
	
	window.onload = function() {
		setCategory();
		setRank();
		setRate();
		
		//set line chart
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		google.charts.setOnLoadCallback(drawChart2);

		//set radar chart
		window.myRadar = new Chart(document.getElementById('canvas'), config);
		window.myRadar = new Chart(document.getElementById('canvas1'), config1);
		window.myRadar = new Chart(document.getElementById('canvas2'), config2);
		window.myRadar = new Chart(document.getElementById('canvas3'), config3);
		window.myRadar = new Chart(document.getElementById('canvas4'), config4);
		window.myRadar = new Chart(document.getElementById('canvas5'), config5);
	};

	function selectRateIcon(val){
		var icon;
		if(val > 0){
			icon = "<i class='fas fa-caret-up'></i>";
		}
		else if(val < 0){
			icon = "<i class='fas fa-caret-down'></i>";
		}
		else {
			icon = "<b> - </b>";
		}
		return icon;
	}

	function setRate(){
		//round((현재값 - 예전값)/예전값 * 100)
		
		var val = [
				(${before_total3}-${before_total4})/${before_total4}*100,
				(${before_total2}-${before_total3})/${before_total3}*100,
				(${before_total1}-${before_total2})/${before_total2}*100,
				(${total}-${before_total1})/${before_total1}*100
		];

		for(var i=0; i<val.length; i++){
			val[i] = val[i].toFixed(2);
		}
		
		var rate = document.getElementsByClassName('rate');
		rate[0].innerHTML = val[val.length-1] + selectRateIcon(val[val.length-1]);
		for(var i=1; i<rate.length; i++){
			rate[i].innerHTML = val[i-1]+ selectRateIcon(val[i-1]);
		}
	}

	function calcQuarter(){
		var q = new Array();
		
		q.push(${adto.select_year }+"년 "+${adto.select_quarter }+"분기");
		if(${adto.select_quarter} < 2) {
			q.push(${adto.select_year-1 }+"년 "+${adto.select_quarter+3 }+"분기") ;
		}
		else {
			q.push(${adto.select_year }+"년 "+${adto.select_quarter-1 }+"분기") ;
		}
		if(${adto.select_quarter} < 3) {
			q.push(${adto.select_year-1 }+"년 "+${adto.select_quarter+2 }+"분기") ;
		}
		else {
			q.push(${adto.select_year }+"년 "+${adto.select_quarter-2 }+"분기") ;
		}
		if(${adto.select_quarter} < 4) {
			q.push(${adto.select_year-1 }+"년 "+${adto.select_quarter+1 }+"분기") ;
		}
		else {
			q.push(${adto.select_year }+"년 "+${adto.select_quarter-3 }+"분기") ;
		}
		q.push(${adto.select_year-1 }+"년 "+${adto.select_quarter }+"분기") ;
		
		return q;
	}

	function setCategory(){
		var cate = document.getElementsByClassName('cate');
		for(var i=0; i<5; i++){
			cate[4-i].innerHTML = q[i];
		}
	}

	function setRank(){
		var pointer = document.getElementsByClassName('chart-pointer')[0];
		var result = document.getElementsByClassName('chart-result')[0];
		var rank = ${rank};
		
		if(rank == 1){
			pointer.style.transform = "rotateZ(-75deg)";
			result.style.backgroundColor = "deepskyblue";
		}
		else if(rank == 2){
			pointer.style.transform = "rotateZ(-35deg)";
			result.style.backgroundColor = "green";
		}
		else if(rank == 3){
			pointer.style.transform = "rotateZ(0deg)";
			result.style.backgroundColor = "gold";
		}
		else if(rank == 4){
			pointer.style.transform = "rotateZ(35deg)";
			result.style.backgroundColor = "orangered";
		}
		else if(rank == 5){
			pointer.style.transform = "rotateZ(75deg)";
			result.style.backgroundColor = "red";
		}
	}

	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜');
		data.addColumn('number', '논현동');

		data.addRows([ 
			[ q[4], ${before_total4} ],
			[ q[3], ${before_total3} ],
			[ q[2], ${before_total2} ],
			[ q[1], ${before_total1} ],
			[ q[0], ${total} ]
		 ]);

		var options = {
			colors: ['orangered'],
			pointSize : 5,
			width : 1000,
			height : 500,
			hAxis : {
				gridlines : {
					color : 'none'
				}
			},
			vAxis : {
				ticks : [ 0, 20, 40, 60, 80, 100 ]
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

		chart.draw(data, options);
	}

	function drawChart2() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜');
		data.addColumn('number', '성장성');
		data.addColumn('number', '안정성');
		data.addColumn('number', '영업력');
		data.addColumn('number', '구매력');
		data.addColumn('number', '집객력');
		
		data.addRows([ 
			[ q[4].substring(0, 7), ${before_scores4[0]}, ${before_scores4[1]}, ${before_scores4[2]}, ${before_scores4[3]}, ${before_scores4[4]} ],
			[ q[3].substring(0, 7), ${before_scores3[0]}, ${before_scores3[1]}, ${before_scores3[2]}, ${before_scores3[3]}, ${before_scores3[4]} ],
			[ q[2].substring(0, 7), ${before_scores2[0]}, ${before_scores2[1]}, ${before_scores2[2]}, ${before_scores2[3]}, ${before_scores2[4]} ],
			[ q[1].substring(0, 7), ${before_scores1[0]}, ${before_scores1[1]}, ${before_scores1[2]}, ${before_scores1[3]}, ${before_scores1[4]} ],
			[ q[0].substring(0, 7), ${gtot}, ${stot}, ${btot}, ${ptot}, ${htot} ]
		 ]);

		var options = {
			pointSize : 5,
			width : 500,
			height : 250,
			hAxis : {
				gridlines : {
					color : 'none'
				}
			},
			vAxis : {
				ticks : [ 0, 3, 6, 9, 12, 15, 18, 21 ]
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div2'));
		chart.draw(data, options);
	}

	var config = {
		type : 'radar',
		data : {
			labels : [ '성장성', '안정성', '영업력', '구매력', '집객력' ],
			datasets : [ {
				label : 'data',
				backgroundColor : 'rgb(241, 196, 15, 0.2)',
				borderColor : '#f1c40f',
				pointBackgroundColor : 'white',
				data : [ ${gtot}, ${stot}, ${btot}, ${ptot}, ${htot} ]
			} ]
		},
		options : {
			legend : {
				display : false,
			},
			title : {
				display : false,
			},
			scale : {
				ticks : {
					beginAtZero : true
				}
			},
			tooltips : {
				enabled : true,
				callbacks : {
					label : function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label
								+ ' : '
								+ data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			}
		}

	};

	var config1 = {
		type : 'radar',
		data : {
			labels : [ 'Coding', 'Cycling', 'Running' ],
			datasets : [ {
				label : 'data',
				backgroundColor : 'rgb(241, 196, 15, 0.2)',
				borderColor : '#f1c40f',
				pointBackgroundColor : 'white',
				data : []
			} ]
		},
		options : {
			legend : {
				display : false,
			},
			title : {
				display : false,
			},
			scale : {
				ticks : {
					beginAtZero : true
				}
			},
			tooltips : {
				enabled : true,
				callbacks : {
					label : function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label
								+ ' : '
								+ data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			}
		}
	};

	// deep copy
	var config2 = JSON.parse(JSON.stringify(config1));
	var config3 = JSON.parse(JSON.stringify(config1));
	var config4 = JSON.parse(JSON.stringify(config1));
	var config5 = JSON.parse(JSON.stringify(config1));

	console.dir(Object);
	
	// method copy
	config2.options.tooltips.callbacks = Object.assign({},
			config1.options.tooltips.callbacks);
	config3.options.tooltips.callbacks = Object.assign({},
			config1.options.tooltips.callbacks);
	config4.options.tooltips.callbacks = Object.assign({},
			config1.options.tooltips.callbacks);
	config5.options.tooltips.callbacks = Object.assign({},
			config1.options.tooltips.callbacks);

	// set labels
	config1.data.labels = ['매출증감률','상권 매출비중','예상성장률'];
	config2.data.labels = ['변동성','운영연수','휴/폐업률'];
	config3.data.labels = ['공급대비 수요','점포별 매출편차','기간별 매출편차'];
	config4.data.labels = ['상권 매출규모','건당 결제금액','소비 수준'];
	config5.data.labels = ['유동인구','주거인구','직장인구'];
	
	// set data
	config1.data.datasets.forEach(function(dataset) {
		dataset.data = [ ${growth12}, ${growth3}, ${growth4} ]
	});
	config2.data.datasets.forEach(function(dataset) {
		dataset.data = [ ${stability12}, ${stability3}, ${stability4} ]
	});
	config3.data.datasets.forEach(function(dataset) {
		dataset.data = [ ${business_ability12}, ${business_ability3}, ${business_ability456} ]
	});
	config4.data.datasets.forEach(function(dataset) {
		dataset.data = [ ${purchasing_power1}, ${purchasing_power2}, ${purchasing_power3} ]
	});
	config5.data.datasets.forEach(function(dataset) {
		dataset.data = [ ${house_arrest1}, ${house_arrest2}, ${house_arrest3} ]
	});
</script>
</head>
<body>
	<div class="anchor">
		<a href="#eval1" style="color: black; text-decoration: none;">1.평가종합</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span>
		<a href="#eval2" style="color: black; text-decoration: none;">2.평가지수 추이</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span>
		<a href="#eval3" style="color: black; text-decoration: none;">3.상세평가 지수</a>
	</div>
	<section>
		<div>
			<h2>분석 설정 정보</h2>
			<table>
				<tr>
					<th>분석지역</th>
					<th>선택영역</th>
					<th>분석업종</th>
					<th>분석시점</th>
				</tr>
				<tr>
					<td>서울특별시 강남구</td>
					<td>${adto.area}</td>
					<td>${adto.food}</td>
					<td>${time}</td>
				</tr>
			</table>
		</div>
		<div>
			<h2>상권 주요정보</h2>
			<span
				style="float: right; margin-top: -30px; font-size: 13px; padding-right: 10px;"><em>(단위:개,명
					/ 기준:${adto.select_year}년${adto.select_quarter}분기)</em></span>
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th rowspan="2">지역</th>
					<th colspan="2">업소수</th>
					<th colspan="2">선택업종 총매출/건수</th>
					<th colspan="3">인구</th>
					<th colspan="3">지역</th>
				</tr>
				<tr>
					<th>음식</th>
					<th>선택업종</th>
					<th>총액(만원)</th>
					<th>건수</th>
					<th>주거</th>
					<th>직장</th>
					<th>유동</th>
					<th>주요시설</th>
					<th>학교</th>
					<th>교통</th>
				</tr>
				<tr>
					<td>선택영역</td>
					<td>${adto.area}</td>
					<td>${all_cnt}</td>
					<td>${select_cnt}</td>
					<td>${sales}</td>
					<td>${sales_cnt}</td>
					<td>${res_pop}</td>
					<td>${sal_pop}</td>
					<td>${flo_pop}</td>
					<td>${facil_cnt}</td>
					<td>${school_cnt}</td>
					<td>${traffic_cnt}</td>

				</tr>
			</table>
			<br>
			<div class="tip">
				<div>
					<i class="far fa-hand-point-right"></i> <span>도움말</span>
				</div>
				<div>
					<ul>
						<li>유사업종의 매출도 포함하여 분석한 결과 입니다.</li>
						<li>매출분석의 표본 분석이므로 매출 분석 결과가 없을 수 있습니다.</li>
						<li>학교 수는 유치원을 포함한 건수 입니다.</li>
						<li>유동인구는 일일 데이터입니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="eval1">
			<h2>1.평가종합</h2>
			<ul>
				<li><b>${adto.area }</b></li>
			</ul>
			<div style="display: grid; grid-template-columns: repeat(2, 1fr); align-items: center;">
				<div style="padding: 20px; border: 1px solid rgb(201, 208, 214); width: 400px; margin: auto;">
					<img src="../resources/mapImg/${map }.jpg" width="100%" height="100%">
				</div>
				<div style="width: 500px;">
					<div class="chart">
						<ul class="chart-skills">
							<!-- 상황에 맞는 이미지 가져오는게 편할듯.. -->
							<li><span>1등급</span></li>
							<li><span>2등급</span></li>
							<li><span>3등급</span></li>
							<li><span>4등급</span></li>
							<li><span>5등급</span></li>
						</ul>
						<div class="chart-pointer"></div>
					</div>
					<div style="margin-left: 6.5em;">
						<span class="chart-result">상권등급 : <b>${rank }</b>등급
						</span>
					</div>
					<br>
					<p>
						기준영역의 상권등급은 총 5등급 중 <b>‘${rank }등급’</b> 입니다.<br>
						<br> 1등급에 가까울수록 상권이 활성화되었다는 것을 의미하며, 이는 상권의 전반적 업종경기와 주변
						집객시설, 교통, 여건을 고려하여 평가한 결과입니다.
					</p>
				</div>
			</div>
			<br>
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th colspan="3">상권평가지수(100점 만점)</th>
					<th rowspan="2">성장성</th>
					<th rowspan="2">안정성</th>
					<th rowspan="2">영업력</th>
					<th rowspan="2">구매력</th>
					<th rowspan="2">집객력</th>
				</tr>
				<tr>
					<th>전분기</th>
					<th>현재</th>
					<th>증감률</th>
				</tr>
				<tr>
					<th>내용</th>
					<td>${before_total1 }</td>
					<td>${total }</td>
					<td><b class="rate"></b></td>
					<td><b>${gtot}</b>점</td>
					<td><b>${stot}</b>점</td>
					<td><b>${btot}</b>점</td>
					<td><b>${ptot}</b>점</td>
					<td><b>${htot}</b>점</td>
				</tr>
			</table>
		</div>
		<div id="eval2">
			<h2>2.평가지수 추이</h2>
			<div align="center"><div id="chart_div"></div></div>
			<table>
				<tr>
					<th rowspan="2">구분</th>
					<th rowspan="2">지역</th>
					<th class="cate"></th>
					<th class="cate" colspan="2"></th>
					<th class="cate" colspan="2"></th>
					<th class="cate" colspan="2"></th>
					<th class="cate" colspan="2"></th>
				</tr>
				<tr>
					<th>평가지수</th>
					<th>평가지수</th>
					<th>증감률</th>
					<th>평가지수</th>
					<th>증감률</th>
					<th>평가지수</th>
					<th>증감률</th>
					<th>평가지수</th>
					<th>증감률</th>
				</tr>
				<tr>
					<th>선택영역</th>
					<th>${adto.area }</th>
					<td>${before_total4 }</td>
					<td>${before_total3 }</td>
					<td class="rate"></td>
					<td>${before_total2 }</td>
					<td class="rate"></td>
					<td>${before_total1 }</td>
					<td class="rate"></td>
					<td>${total }</td>
					<td class="rate"></td>
				</tr>
			</table>
			<br>
			<div class="tip">
				<div>
					<i class="far fa-hand-point-right"></i> <span>도움말</span>
				</div>
				<div>
					<ul>
						<li><b>상권평가등급</b> : 상권 내 전반적인 외식업 경기와 상권의 인구 수, 교통시설, 집객시설 등을
							종합하여 산출한 등급으로서, 점수가 1등급에 가까울수록 상권이 활성화되어 있음을 의미(1~5등급)</li>
						<li><b>상권평가등급표</b>
							<table>
								<tr>
									<th>기준</th>
									<th><i class="fas fa-stop" style="color: deepskyblue;"></i>1등급</th>
									<th><i class="fas fa-stop" style="color: green;"></i>2등급</th>
									<th><i class="fas fa-stop" style="color: gold;"></i>3등급</th>
									<th><i class="fas fa-stop" style="color: orangered;"></i>4등급</th>
									<th><i class="fas fa-stop" style="color: red;"></i>5등급</th>
								</tr>
								<tr>
									<th>상권평가지수</th>
									<td>70점 이상</td>
									<td>57.5~70</td>
									<td>45~57.5</td>
									<td>32.5~45</td>
									<td>32.5 미만</td>
								</tr>
							</table></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="eval3">
			<h2>3.상세평가지수</h2>
			<ul>
				<li><b>${adto.area }</b></li>
			</ul>
			<div style="display: grid; grid-template-columns: repeat(2, 1fr); align-items: center;">
				<div>
					<canvas id="canvas"></canvas>
				</div>
				<div id="chart_div2"></div>
			</div>
			<br>
			<table>
				<tr>
					<th colspan="2">구분</th>
					<th colspan="5">내용</th>
				</tr>
				<tr>
					<td rowspan="3" width="5%"><b>성장성</b><br>(20점)</td>
					<td rowspan="3" width="5%"><b>
						<span style="color: orangered; font-size: 15px;">
							${gtot }
						</span>점</b>
					</td>
					<td rowspan="3" width="40%">
						<div style="margin-top: 30px;">
							<canvas id="canvas1"></canvas>
						</div>
					</td>
					<td width="15%"><b>매출증감률</b><br>(10점)</td>
					<td width="5%"><b>${growth12}</b>점</td>
					<td width="30%">- 작년 동월대비 전체매출규모 증감률 (5점)<br> - 작년 동월대비 가게당매출규모 증감률
						(5점)
					</td>
				</tr>
				<tr>
					<td><b>상권 매출비중</b><br>(5점)</td>
					<td><b>${growth3}</b>점</td>
					<td>작년 동월대비 강남구 대비 선택지역 매출비중 증감률</td>
				</tr>
				<tr>
					<td><b>예상성장률</b><br>(5점)</td>
					<td><b>${growth4}</b>점</td>
					<td>반기별 매출증감 추이를 이용하여 향후 1년간의 매출을 예측한 지표</td>
				</tr>
				<tr>
					<td rowspan="3"><b>안정성</b><br>(20점)</td>
					<td rowspan="3"><b>
						<span style="color: orangered; font-size: 15px;">
							${stot}
						</span>점</b>
					</td>
					<td rowspan="3">
						<div style="margin-top: 30px;">
							<canvas id="canvas2"></canvas>
						</div>
					</td>
					<td><b>변동성</b><br>(10점)</td>
					<td><b>${stability12}</b>점</td>
					<td>- 최근월 포함 12개월 월별 점포수변동률 평균 (5점)<br> - 최근월 포함 12개월 월별
						매출변동률 평균 (5점)
					</td>
				</tr>
				<tr>
					<td><b>운영연수</b><br>(5점)</td>
					<td><b>${stability3 }</b>점</td>
					<td>해당지역 점포 평균 운영연수</td>
				</tr>
				<tr>
					<td><b>휴/폐업률</b><br>(5점)</td>
					<td><b>${stability4 }</b>점</td>
					<td>최근 1년간 휴/폐업 점포 비율</td>
				</tr>
				<tr>
					<td rowspan="3"><b>영업력</b><br>(20점)</td>
					<td rowspan="3"><b>
						<span style="color: orangered; font-size: 15px;">
							${btot }
						</span>점</b>
					</td>
					<td rowspan="3">
						<div style="margin-top: 30px;">
							<canvas id="canvas3"></canvas>
						</div>
					</td>
					<td><b>공급대비 수요</b><br>(10점)</td>
					<td><b>${business_ability12}</b>점</td>
					<td>- 수요(해당지역 매출/강남구 매출)<br> - 공급(해당지역 업소수/강남구 업소수)
					</td>
				</tr>
				<tr>
					<td><b>점포별 매출편차</b><br>(5점)</td>
					<td><b>${business_ability3 }</b>점</td>
					<td>개별 점포별 매출편차</td>
				</tr>
				<tr>
					<td><b>기간별 매출편자</b><br>(5점)</td>
					<td><b>${business_ability456 }</b>점</td>
					<td>- 월별 매출편차 (2점)<br> - 요일별 매출편차 (1.5점)<br> - 시간대별
						매출편차 (1.5점)
					</td>
				</tr>
				<tr>
					<td rowspan="3"><b>구매력</b><br>(20점)</td>
					<td rowspan="3"><b>
						<span style="color: orangered; font-size: 15px;">
							${ptot }
						</span>점</b>
					</td>
					<td rowspan="3">
						<div style="margin-top: 30px;">
							<canvas id="canvas4"></canvas>
						</div>
					</td>
					<td><b>상권 매출규모</b><br>(7.5점)</td>
					<td><b>${purchasing_power1 }</b>점</td>
					<td>선택지역 면적당 매출액</td>
				</tr>
				<tr>
					<td><b>건당 결제금액</b><br>(7.5점)</td>
					<td><b>${purchasing_power2 }</b>점</td>
					<td>선택지역의 평균 건당 결제금액</td>
				</tr>
				<tr>
					<td><b>소비 수준</b><br>(5점)</td>
					<td><b>${purchasing_power3 }</b>점</td>
					<td>주거인구, 직장인구 소비규모</td>
				</tr>
				<tr>
					<td rowspan="3"><b>집객력</b><br>(20점)</td>
					<td rowspan="3"><b>
						<span style="color: orangered; font-size: 15px;">
							${htot }
						</span>점</b>
					</td>
					<td rowspan="3">
						<div style="margin-top: 30px;">
							<canvas id="canvas5"></canvas>
						</div>
					</td>
					<td><b>유동인구</b><br>(10점)</td>
					<td><b>${house_arrest1 }</b>점</td>
					<td>선택지역 내 면적당 유동인구 수</td>
				</tr>
				<tr>
					<td><b>주거인구</b><br>(5점)</td>
					<td><b>${house_arrest2 }</b>점</td>
					<td>선택지역 내 면적당 주거인구 수</td>
				</tr>
				<tr>
					<td><b>직장인구</b><br>(5점)</td>
					<td><b>${house_arrest3 }</b>점</td>
					<td>선택지역 내 면적당 직장인구 수</td>
				</tr>
				<tr>
					<td><b>합계</b></td>
					<td><b>
						<span style="color: orangered; font-size: 15px;">
							${total }
						</span>점</b>
					</td>
					<td colspan="4"></td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>