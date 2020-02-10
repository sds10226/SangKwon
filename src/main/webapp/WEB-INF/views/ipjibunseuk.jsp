<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://kit.fontawesome.com/45f7a374e1.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<title>Insert title here</title>
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
	font-size: 1.5em;
}

.container {
	width: 1700px;
	height: 150px;
}

table {
	border: 1px solid rgb(201, 208, 214);
	width: 1700px;
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
	background-color: rgb(245, 246, 241);
	margin-top: 10px;
	padding-right: 15px;
}

.tip-icon {
	float: left;
	width: 65px;;
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

.select {
	width: 100%;
	height: 100%;
}
</style>
<script type="text/javascript">
//첫번째 그래프
window.onload = function(){
	window.eventthing = window.event;
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(Guest_facilities1);
	google.charts.setOnLoadCallback(Guest_facilities2);
	google.charts.setOnLoadCallback(apartChart1);
	google.charts.setOnLoadCallback(apartChart2);
	google.charts.setOnLoadCallback(apartAreaChart);
	google.charts.setOnLoadCallback(standardMarketPriceChart);	
}


function drawChart() {
	
  var data = google.visualization.arrayToDataTable([
    ['Year', '주요시설', '집객시설','교통시설'],
    ['2017',  ${MFD[0].main_facil},      	${GFM[0].guest_facil},     ${TFD[0].traffic_facil}  ],
    ['2018',  ${MFD[1].main_facil},         ${GFM[1].guest_facil},	   ${TFD[1].traffic_facil}	],
    ['2019',  ${MFD[2].main_facil},         ${GFM[2].guest_facil},     ${TFD[2].traffic_facil}  ]
  ]);

  var options = {
    title: '주요시설 추이',
    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}


/*두번째 그래프  */

function Guest_facilities1() {
  // Some raw data (not necessarily accurate)
  var data = google.visualization.arrayToDataTable([
    ['Month', '공공기관', '금융기관', '의료/복지', '학교', '평균'],
    ['2017',  ${MFSD[0].office},      ${MFSD[0].finance},        ${MFSD[0].medical},              ${MFSD[0].school},      ${MFSD[0].main_facilities_avg}],
    ['2018',  ${MFSD[1].office},      ${MFSD[1].finance},        ${MFSD[1].medical},              ${MFSD[1].school},      ${MFSD[1].main_facilities_avg}],
    ['2019',  ${MFSD[2].office},      ${MFSD[2].finance},         ${MFSD[2].medical},              ${MFSD[2].school},     ${MFSD[2].main_facilities_avg}]
  ]);

  
  var options = {
    title : '주요시설 현황 그래프',
    vAxis: {title: '시설 수'},
    hAxis: {title: 'year'},
    seriesType: 'bars',
    series: {5: {type: 'line'}}        };

  var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
  chart.draw(data, options);
}

function Guest_facilities2() {
	  // Some raw data (not necessarily accurate)
	  var data = google.visualization.arrayToDataTable([
	    ['year', '대형유통', '문화시설', '숙박시설', '교통시설', '평균'],
	    ['2017',  ${MFSD[0].large_Distribution},      ${MFSD[0].culture},        ${MFSD[0].accommodation},             ${MFSD[0].traffic},         ${MFSD[0].guest_facilities_avg}],
	    ['2018',  ${MFSD[1].large_Distribution},      ${MFSD[1].culture},        ${MFSD[1].accommodation},             ${MFSD[1].traffic},         ${MFSD[1].guest_facilities_avg}],
	    ['2019',  ${MFSD[2].large_Distribution},      ${MFSD[2].culture},        ${MFSD[2].accommodation},             ${MFSD[2].traffic},         ${MFSD[2].guest_facilities_avg}]
	    
	  ]);
	 
	  var options = {
	    title : '집객시설 및 교통시설 현황 통계',
	    vAxis: {title: '시설 수'},
	    hAxis: {title: 'year'},
	    seriesType: 'bars',
	    series: {5: {type: 'line'}}        };

	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
	  chart.draw(data, options);
	}

//세번째 그래프

function apartChart1() {
  var data = google.visualization.arrayToDataTable([
    ['Year', '동' ],
    ['2017',  ${APAD[0].apartment_total}  ],
    ['2018',  ${APAD[1].apartment_total}  ],
    ['2019',  ${APAD[2].apartment_total}  ]
  ]);

  var options = {
    title: '아파트 동 추이',
    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div3'));
  chart.draw(data, options);
}

function apartChart2() {
	  var data = google.visualization.arrayToDataTable([
	    ['Year', '세대'],
	    ['2017',     ${APAD[0].apart_family}],
	    ['2018',     ${APAD[1].apart_family}],
	    ['2019',     ${APAD[2].apart_family}]
	  ]);

	  var options = {
	    title: '아파트 세대수 추이',
	    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
	    vAxis: {minValue: 0}
	  };

	  var chart = new google.visualization.AreaChart(document.getElementById('chart_div4'));
	  chart.draw(data, options);
	}
//단지규모 및 면적별 현황 pie 차트

//면적별 현황 pie 차트

      function apartAreaChart() {
        var resp = window.eventthing;
		var data = null;
		if(resp.responseText!=null){
			var values = resp.responseText.split("|");
			 data = google.visualization.arrayToDataTable([
		          ['Task', '2019년'],
		          ['60㎟미만',    values[0]*1],
		          ['66㎟',   		 values[1]*1],
		          ['90㎟미만', 	 values[2]*1],
		          ['132㎟미만',	 values[3]*1],
		          ['165㎟미만',    values[4]*1]
		        ]);
		}else{
       		 data = google.visualization.arrayToDataTable([
       			   ['Task', '2019년'],
       			   ['60㎟미만',    ${AAD.area_66_under_households}],
       			   ['66㎟',   		 ${AAD.area_66_households}],
       			   ['90㎟미만', 	 ${AAD.area_99_households}],
      		       ['132㎟미만',	 ${AAD.area_132_households}],
     		       ['165㎟미만',   ${AAD.area_165_households}]
        		]);
		}
        var options = {
          title: '면적별 현황 pie 차트',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('apartAreaChart'));

        chart.draw(data, options);
      }
//아파트 기준 시가 현황 pie 차트

      function standardMarketPriceChart() {
    	var resp = window.eventthing;
		var data = null;
		if(resp.responseText!=null){
			var values = resp.responseText.split("|");
     	   data = google.visualization.arrayToDataTable([
   			      ['Task', '2019년'],
          		  ['1억 미만',    	values[12]*1] ,
          	      ['1억 대',    	values[13]*1]  ,
       		      ['2억 대',      values[14]*1] ,
       		      ['3억 대',      values[15]*1]  ,
       		      ['4억 대',		values[16]*1]  ,
      		      ['5억 대',		values[17]*1],
     		      ['6억 대 이상',	values[18]*1]  
    		    ]);
		}else {
			data = google.visualization.arrayToDataTable([
		          ['Task', '2019년'],
		          ['1억 미만',    	  ${PAD.price_1milion_under}],
		          ['1억 대',    	  ${PAD.price_1milion}],
		          ['2억 대',        ${PAD.price_2milion}],
		          ['3억 대',        ${PAD.price_3milion}],
		          ['4억 대',		  ${PAD.price_4milion}],
		          ['5억 대',		  ${PAD.price_5milion}],
		          ['6억 대 이상',	  ${PAD.price_6milion}]
		        ]);
			}
        var options = {
          title: '아파트 기준 시가 현황 pie 차트',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('standardMarketPriceChart'));

        chart.draw(data, options);
      }
    // 학교 분기선택 변경함수
		function selectSchool(){
			var year_quater = (event.srcElement.value).split("/");
			var form={
				select_year:year_quater[0],
				select_quarter:year_quater[1],
				ipji_type:"School"
			}
			$.ajax({
				url:"getSelectedIpjiData.do",
				type:"POST",
				data: form,
				success: function(data, statusText, resp){
					var rawvalue = data.split("|");
					var tabledata = document.getElementsByName('SchoolData');
					for(var i=0; i<tabledata.length; i++){
						tabledata[i].innerHTML = rawvalue[i];
					};
				}
			})
		}
	// 아파트 주거형태 분기선택 변경함수
		function selectApart(){
			var year_quater = (event.srcElement.value).split("/");
			var form={
				select_year:year_quater[0],
				select_quarter:year_quater[1],
				ipji_type:"Apart"
			}
			$.ajax({
				url:"getSelectedIpjiData.do",
				type:"POST",
				data: form,
				success: function(data, statusText, resp){
					var rawvalue = data.split("|");
					var tabledata = document.getElementsByName('ApartData');
					var flag=1;
					for(var i=0; i<tabledata.length; i++){
						if(i%3==0){
							flag *= -1;
						}
						if(flag == -1){
							tabledata[i].innerHTML = rawvalue[i];
						}
						else if (flag != -1){
							tabledata[i].innerHTML = rawvalue[i]+"%";
							}
					};
				}
			})
		}
		// 아파트 동 세대수 추이 년도선택에 따른 Ajax 변경함수
		function selectApart_family(){
			var year_quater = (event.srcElement.value).split("/");
			var form={
				select_year:year_quater[0],
				select_quarter:year_quater[1],
				ipji_type:"Apart_family"
			}
			$.ajax({
				url:"getSelectedIpjiData.do",
				type:"POST",
				data: form,
				success: function(data, statusText, resp){
					var rawvalue = data.split("|");
					var tabledata = document.getElementsByName('Apart_familyData');
					var flag=1;
					var num = 6;
					for(var i=0; i<tabledata.length; i++){
						 
						if(i >=0 && i<5){
							tabledata[i].innerHTML = rawvalue[i];
						}else if(i == 5){
							tabledata[i].innerHTML = rawvalue[i]+"동";
						}else if(i>5 && i<12){
							tabledata[i].innerHTML = rawvalue[i]+"%";
						}else if(i >=12 && i<19){
							tabledata[i].innerHTML = rawvalue[i];
						}else if(i == 19){
							tabledata[i].innerHTML = rawvalue[i]+"동";
						}else if(i >19 && i<27){
							tabledata[i].innerHTML = rawvalue[i]+"%";
						}else if(i == 27){
							tabledata[i].innerHTML = rawvalue[i]+"원";
						}
						
					};
					window.eventthing = resp;
					RedrawApartGraph();
				}
			})
			
		}
		function RedrawApartGraph(){
			google.charts.setOnLoadCallback(apartAreaChart);
			google.charts.setOnLoadCallback(standardMarketPriceChart);
			
		}
</script>
<body>

	<!--toggle시 지역분석 내용  -->
	<div id="local" style="float: left;">
		<a href="#main-facility" style="color: black; text-decoration: none;">1.주요시설</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#school-facility" style="color: black; text-decoration: none;">2.학교시설</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#traffic-facility" style="color: black; text-decoration: none;">3.교통시설</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#residence-facility"
			style="color: black; text-decoration: none;">4.주거시설</a>
	</div>



	<!-- 주요 시설 -->
	<div class="main-container" style="float: left;">
		<h4 style="text-align: left; margin-top: 20px;">
			<b>${area} - ${food}</b>
		</h4>
		<h2 id="main-facility">1.주요시설분석</h2>
		<h3>-주요시설 추이</h3>
		<div id="chart_div"
			style="width: 98%; height: 500px; border: 1px solid rgb(201, 208, 214);"></div>

		<!--주요시설 표  -->
		<div class="container">
			<p style="margin-left: 1630px; font-size: 13px;">
				<em>(단위: 개)</em>
			</p>
			<table class="table">
				<tr class="">
					<th class="th1" rowspan="2" style="width: 10%">구분</th>
					<th class="th1" rowspan="2" style="width: 10%">지역</th>
					<th class="" colspan="3">
						<!--데이터 년도 ex)2017년 -->2017년(4분기)
					</th>
					<th class="" colspan="3">
						<!--데이터 년도 ex)2018년 -->2018년(4분기)
					</th>
					<th class="" colspan="3">
						<!--데이터 년도 ex)2018년 -->2019년(2분기)
					</th>
				</tr>
				<tr>
					<td>주요시설</td>
					<td>집객시설</td>
					<td>교통시설</td>
					<td>주요시설</td>
					<td>집객시설</td>
					<td>교통시설</td>
					<td>주요시설</td>
					<td>집객시설</td>
					<td>교통시설</td>
				</tr>
				<tr class="">
					<td class="">선택영역</td>
					<td class="">${area}</td>
					<td class="">${MFD[0].main_facil}</td>
					<td class="">${GFM[0].guest_facil}</td>
					<td class="">${TFD[0].traffic_facil}</td>
					<td class="">${MFD[1].main_facil}</td>
					<td class="">${GFM[1].guest_facil}</td>
					<td class="">${TFD[1].traffic_facil}</td>
					<td class="">${MFD[2].main_facil}</td>
					<td class="">${GFM[2].guest_facil}</td>
					<td class="">${TFD[2].traffic_facil}</td>
				</tr>
			</table>
		</div>

		<!-- 주요 시설 현황 -->
		<div>
			<h3>-주요시설 현황</h3>
		</div>
		<div>
			<div id="chart_div1"
				style="width: 49%; height: 500px; float: left; border: 1px solid rgb(201, 208, 214); margin-bottom: 30px;"></div>
			<div id="chart_div2"
				style="width: 49%; height: 500px; float: left; border: 1px solid rgb(201, 208, 214); margin-bottom: 30px;"></div>
		</div>
		<!-- 주요 시설 현황 표  -->

		<div class="container" style="margin-bottom: 550px;">
			<p style="margin-left: 1630px; font-size: 13px;">
				<em>(단위: 개)</em>
			</p>
			<table class="">
				<tr class="">
					<th class="" rowspan="2" style="width: 10%">구분</th>
					<th class="" rowspan="2" style="width: 10%">지역</th>
					<th class="" colspan="4">주요시설</th>
					<th class="" colspan="3">집객시설</th>
					<th class="" rowspan="2">교통시설</th>
					<th class="" rowspan="2">주요시설평균</th>
					<th class="" rowspan="2">집객시설평균</th>
				</tr>
				<tr class="">
					<td class="">공공기관</td>
					<td class="">금융기관</td>
					<td class="">의료/복지</td>
					<td class="">학교</td>
					<td class="">대형유통</td>
					<td class="">문화시설</td>
					<td class="">숙박시설</td>
				</tr>
				<c:forEach items="${MFSD}" var="list">
					<tr class="">
						<td class="">${list.standard_ym_code}</td>
						<td class="">${area}</td>
						<td class="">${list.office}</td>
						<td class="">${list.finance}</td>
						<td class="">${list.medical}</td>
						<td class="">${list.school}</td>
						<td class="">${list.large_Distribution}</td>
						<td class="">${list.culture}</td>
						<td class="">${list.accommodation}</td>
						<td class="">${list.traffic}</td>
						<td class="">${list.main_facilities_avg}</td>
						<td class="">${list.guest_facilities_avg}</td>
					</tr>
				</c:forEach>
			</table>
		</div>


		<!-- TIP  -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">주요/집객 시설정보는 유사한 성격의 유동인구를 지속적으로 발생시키므로
				유동인구의 규모와 성격을 파악하는데 유익한 자료입니다. 또한 주요/집객시설의 위치와 교통정보를 통해 유동인구 동선파악이
				가능하며, 업종구성과 고객흡인을 위한 전략수립에 참고할 필요가 있습니다.</div>
		</div>

		<!--3.교통시설  -->
		<div style="padding-top: 50px;">
			<h2 id="school-facility">2.학교시설분석</h2>
		</div>
		<div class="container">
			<p style="margin-left: 1630px; font-size: 13px;">
				<em>(단위: 개)</em>
			</p>
			<table class="">
				<tr class="">
					<th class="" rowspan="2" style="width: 10%">구분</th>
					<th class="" rowspan="2" style="width: 10%">지역</th>
					<th class="">대학교</th>
					<th class="">고등학교</th>
					<th class="">중학교</th>
					<th class="">초등학교</th>
					<th class="">유치원</th>
				</tr>
				<tr class="">
					<td class="">학교수</td>
					<td class="">학교수</td>
					<td class="">학교수</td>
					<td class="">학교수</td>
					<td class="">학교수</td>
				</tr>
				<tr class="">
					<!-- 만약 데이터가 없으면 "선택영역에 학교시실이 존재 하지 않습니다." -->
					<td class=""><select class="select" onchange=selectSchool()>
							<option value="2017/1">2017년 1분기</option>
							<option value="2017/2">2017년 2분기</option>
							<option value="2017/3">2017년 3분기</option>
							<option value="2017/4">2017년 4분기</option>
							<option value="2018/1">2018년 1분기</option>
							<option value="2018/2">2018년 2분기</option>
							<option value="2018/3">2018년 3분기</option>
							<option value="2018/4">2018년 4분기</option>
							<option value="2019/1">2019년 1분기</option>
							<option value="2019/2">2019년 2분기</option>
					</select></td>
					<td name="schoolData">${area }</td>
					<td name="schoolData">${SD.university }개</td>
					<td name="schoolData">${SD.highSchool }개</td>
					<td name="schoolData">${SD.middle_School }개</td>
					<td name="schoolData">${SD.elementary_School }개</td>
					<td name="schoolData">${SD.kindergarden }개</td>

				</tr>
			</table>
		</div>


		<!-- TIP -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">학생은 업종에 따라 상당한 구매력을 가진 소비계층입니다. 따라서
				학생의 동선은 구매대상으로서 비중이 높은 업종의 창업 시 중요한 변수가 될 수 있습니다. 주거지역, 교통시설등과 연계하여
				동선과 유동인구를 파악하면 유익한 입지정보를 얻을 수 있습니다. (예, 문구,서점,분식,독서실,학원 등)</div>
		</div>

		<!-- 3.교통시설 -->
		<div style="padding-top: 50px;">
			<h2 id="traffic-facility">3.교통시설분석</h2>
		</div>

		<div class="cotainer">
			<p style="margin-left: 1630px; font-size: 13px;">
				<em>(단위: 개)</em>
			</p>
			<table class="">
				<tr class="">
					<th class="" style="width: 10%">구분</th>
					<th class="" style="width: 10%">지역</th>
					<th class="">지하철역</th>
					<th class="">버스정류장</th>
				</tr>

				<tr>
					<td class="">2019년 2분기 기준</td>
					<td class="">${area}</td>
					<td class="">${FFAD.subway_Station_cnt}</td>
					<td class="">${FFAD2.bus_station}</td>
				</tr>

			</table>

		</div>



		<div class="cotainer">
			<p>
				<span style="font-size: 18px;"><b><span
						style="color: blue;">지하철</span> 이용 현황</b></span><span
					style="margin-left: 1630px; font-size: 13px;"><em>(단위:
						개)</em></span>
			</p>
			<table class="">
				<tr class="">
					<th class="" rowspan="2" style="width: 10%">구분</th>
					<th class="" rowspan="2" style="width: 10%">지역</th>
					<th class="" rowspan="2">노선구분</th>
					<th class="" rowspan="2">역명</th>
					<th class="" colspan="4">일/년평균 승하차 인원</th>

				</tr>
				<tr class="">

					<td class="">일 평균 승차인원</td>
					<td class="">일 평균 하차인원</td>
					<td class="">연 평균 승차인원</td>
					<td class="">연 평균 하차인원</td>
				</tr>

				<c:forEach items="${SAD}" var="list">
					<tr class="">
						<td class="">${list.standard_ym_code}</td>
						<td class="">${area}</td>
						<td class="">${list.line}호선</td>
						<td class="">${list.subway_station}</td>
						<td class="">${list.day_total_input_avg}</td>
						<td class="">${list.day_total_output_avg}</td>
						<td class="">${list.year_total_input_avg}</td>
						<td class="">${list.year_total_output_avg}</td>
					</tr>
				</c:forEach>
			</table>

		</div>

		<!--TIP -->
		<div class="tip-container">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">지하철역과 버스정류장은 유동인구를 유발하는 중요한 입지 요소이며
				지하철역 승하차 인원과 버스정류장수를 통해 유동인구를 예측 할 수 있습니다. 동일 도로의 지하철역과 지하철역 사이는
				유동인구가 적을 수 있으며 버스정류장과 횡단보도가 인접하는 교차로는 유동인구가 많습니다.</div>
		</div>

		<!-- 4.주거시설분석 -->
		<div style="padding-top: 50px;">
			<h2 id="residence-facility">4.주거시설분석</h2>
		</div>

		<div class="cotainer">
			<table class="">
				<tr class="">
					<th class="" rowspan="2" colspan="2" style="width: 20%">구분</th>
					<th class="" rowspan="2" colspan="2">가구수</th>
					<th class="" colspan="2">주거형태</th>
				</tr>
				<tr>
					<th>아파트 세대수</th>
					<th>이 외 세대수</th>
				</tr>
				<tr>
					<td class=""><b>제1선택영역</b></td>
					<td class=""><b>수</b></td>
					<td name="ApartData" colspan="2">${RFAD.family_total }</td>
					<td name="ApartData">${RFAD.apartment_total }</td>
					<td name="ApartData">${RFAD.non_apartment_total }</td>
				</tr>
				<tr>
					<td class=""><select class="select" onchange=selectApart()>
							<option value="2017/1">2017년 1분기</option>
							<option value="2017/2">2017년 2분기</option>
							<option value="2017/3">2017년 3분기</option>
							<option value="2017/4">2017년 4분기</option>
							<option value="2018/1">2018년 1분기</option>
							<option value="2018/2">2018년 2분기</option>
							<option value="2018/3">2018년 3분기</option>
							<option value="2018/4">2018년 4분기</option>
							<option value="2019/1">2019년 1분기</option>
							<option value="2019/2">2019년 2분기</option>
					</select></td>
					<td class=""><b>비율</b></td>
					<td name="ApartData" colspan="2">${RFAD2.family_avg }%</td>
					<td name="ApartData">${RFAD2.apartment_Avg }%</td>
					<td name="ApartData">${RFAD2.non_apartment_Avg }%</td>
				</tr>
			</table>

		</div>
		<!-- 아파트 동/세대수 추이 -->
		<div>
			<h3>-아파트 동/세대수 추이</h3>
		</div>
		<div>
			<div id="chart_div3"
				style="width: 49.3%; height: 500px; float: left; border: 1px solid rgb(201, 208, 214); margin-bottom: 30px;"></div>
			<div id="chart_div4"
				style="width: 49.3%; height: 500px; float: left; border: 1px solid rgb(201, 208, 214); margin-bottom: 30px;"></div>
		</div>


		<div class="cotainer" style="padding-top: 25px;">
			<table class="">
				<tr class="">
					<th class="" rowspan="2" style="width: 20%">구분</th>
					<th class="" colspan="2">2017년</th>
					<th class="" colspan="2">2018년</th>
					<th class="" colspan="2">2019년</th>
				</tr>
				<tr>
					<td class=""><b>동</b></td>
					<td class=""><b>세대</b></td>
					<td class=""><b>동</b></td>
					<td class=""><b>세대</b></td>
					<td class=""><b>동</b></td>
					<td class=""><b>세대</b></td>
				</tr>

				<tr>
					<td class=""><b>${area}</b></td>
					<td class="">${APAD[0].apartment_total}</td>
					<td class="">${APAD[0].apart_family}</td>
					<td class="">${APAD[1].apartment_total}</td>
					<td class="">${APAD[1].apart_family}</td>
					<td class="">${APAD[2].apartment_total}</td>
					<td class="">${APAD[2].apart_family}</td>
				</tr>

			</table>
		</div>
		<h3>-아파트 동/세대수 추이</h3>
		<div>
			<select style="width: 100px; height: 30px;"
				onchange=selectApart_family()>
				<option value="2017/2">2017년</option>
				<option value="2018/2">2018년</option>
				<option value="2019/2">2019년</option>
			</select> <span>(해당연도를 선택해주세요.)</span>

			<div>
				<div id="apartAreaChart"
					style="width: 49%; height: 400px; border: 1px solid rgb(201, 208, 214); float: left;"></div>
				<div id="standardMarketPriceChart"
					style="width: 49%; height: 400px; border: 1px solid rgb(201, 208, 214); float: left;"></div>
			</div>
			<br>

			<!-- 면적  -->
			<div class="cotainer" style="padding-top: 25px; margin-top: 400px;">
				<table class="">
					<tr class="">
						<th class="" style="width: 10%">지역</th>
						<th class="" colspan="2" style="width: 15%">구분</th>
						<th class="">66㎡미만</th>
						<th class="">66㎡미만</th>
						<th class="">90㎡미만</th>
						<th class="">132㎡미만</th>
						<th class="">165㎡미만</th>
						<th class="">평균면적</th>
					</tr>
					<tr>
						<td class="" rowspan="2"><b>${area}</b></td>
						<td class="" rowspan="2" style="width: 10%"><b>아파트 동 면적</b></td>
						<td class=""><b>동</b></td>
						<td name="Apart_familyData">${AAD.area_66_under_households }</td>
						<td name="Apart_familyData">${AAD.area_66_households }</td>
						<td name="Apart_familyData">${AAD.area_99_households }</td>
						<td name="Apart_familyData">${AAD.area_132_households }</td>
						<td name="Apart_familyData">${AAD.area_165_households }</td>
						<td name="Apart_familyData">${AAD.avg_area }동</td>

					</tr>
					<tr>
						<td><b>비율</b></td>
						<td name="Apart_familyData">${AAD2.area_66_under_Avg }%</td>
						<td name="Apart_familyData">${AAD2.area_66_Avg }%</td>
						<td name="Apart_familyData">${AAD2.area_99_Avg }%</td>
						<td name="Apart_familyData">${AAD2.area_132_Avg }%</td>
						<td name="Apart_familyData">${AAD2.area_165_Avg }%</td>
						<td name="Apart_familyData">${AAD2.apart_avg }%</td>



					</tr>
				</table>
			</div>

			<!-- 가격  -->
			<div class="cotainer" style="padding-top: 25px;">
				<table class="">
					<tr class="">
						<th class="" style="width: 10%">지역</th>
						<th class="" colspan="2" style="width: 15%">구분</th>
						<th class="">1억 미만</th>
						<th class="">1억대</th>
						<th class="">2억대</th>
						<th class="">3억대</th>
						<th class="">4억대</th>
						<th class="">5억대</th>
						<th class="">6억대 이상</th>
						<th class="">평균시세</th>
					</tr>
					<tr>
						<td class="" rowspan="2"><b>${area }</b></td>
						<td class="" rowspan="2"><b>기준시가</b></td>
						<td class=""><b>동</b></td>
						<td name="Apart_familyData">${PAD.price_1milion_under }</td>
						<td name="Apart_familyData">${PAD.price_1milion }</td>
						<td name="Apart_familyData">${PAD.price_2milion }</td>
						<td name="Apart_familyData">${PAD.price_3milion }</td>
						<td name="Apart_familyData">${PAD.price_4milion }</td>
						<td name="Apart_familyData">${PAD.price_5milion }</td>
						<td name="Apart_familyData">${PAD.price_6milion }</td>
						<td name="Apart_familyData">${PAD.apart_Price_avg }동</td>
					</tr>
					<tr>
						<td><b>비율</b></td>
						<td name="Apart_familyData">${PAD2.price_1milion_under_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_1milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_2milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_3milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_4milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_5milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.price_6milion_Avg }%</td>
						<td name="Apart_familyData">${PAD2.avg_Price }<span>원</span></td>

					</tr>
				</table>
			</div>
		</div>
		<!--TIP -->
		<div class="tip-container" style="height: 100px; padding-top: 15px;">
			<div class="tip-icon">
				<p>
					<i class="far fa-hand-point-right"></i>TIP
				</p>
			</div>
			<div class="tip-content">아파트, 비아파트 등 주거형태 분포는 입지를 선택하는 데 중요한
				요인입니다. 아파트 밀집지역의 경우 거의 일정한 유동인구의 통로가 있으나, 비 아파트의 경우 유동인구가 분산되는 경향이
				있습니다. 또한 아파트의 규모와 면적, 가격 등은 소득 수준을 예측하는 자료로서 업종의 선정이나 점포의 규모, 수준을
				계획하는 것에 도움이 됩니다. 아파트 면적별 세대 수는 소득 및 가구구성 형태를 추정할 수 있는 자료입니다. 작은 면적에
				비해 큰 면적의 세대가 상대적으로 세대 구성원의 수가 많고 소득이 큰 경우가 많습니다. 기준시가별 세대수는 소득을 추정할
				수 있는 자료입니다. 소득수준은 객단가와 관계가 있으니 배후 세대의 소득수준에 따른 세부 아이템 선정에 활용할 수
				있습니다.</div>
		</div>
	</div>

</body>
</html>