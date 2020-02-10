<%@page import="com.cafe24.sosang.dto.SalesDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
Long[] amt = new Long[5];
Long[] co = new Long[5];
double db = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/45f7a374e1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

    var queryObject = "";
    var queryObjectLen = "";
    var queryObjectLen2 = "";
    var queryObjectLen3 = "";
    var queryObjectLen4 = "";
    var queryObjectLen5 = "";
	
	$.ajax({
    	type : 'POST',
        url : 'saleschart.do',
        dataType : 'json',
        async: false,
        success : function(data) {
        	
            queryObject = eval('(' + JSON.stringify(data,null, 2) + ')');  
            // stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
            // eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
            // queryObject.barlist[0].city ="korea"
            queryObjectLen = queryObject.barlist.length;
            queryObjectLen2 = queryObject.barlist2.length;
            queryObjectLen3 = queryObject.barlist3.length;
            queryObjectLen4 = queryObject.barlist4.length;
            queryObjectLen5 = queryObject.barlist5.length;
            
            //alert('데이터수 : ' + queryObjectLen + "," + queryObjectLen2 + "," + queryObjectLen3 + "," + queryObjectLen4 + "," + queryObjectLen5);
            
            // alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
        },
        error : function(xhr, type) {
            alert('server error occoured')
        }
    });

	    
    google.charts.load('current', {
        packages : [ 'corechart', 'bar' ]
    });
    
    google.charts.setOnLoadCallback(drawMultSeries);
    google.charts.setOnLoadCallback(drawMultSeries2);
    google.charts.setOnLoadCallback(drawMultSeries3);
    google.charts.setOnLoadCallback(drawMultSeries4);
    google.charts.setOnLoadCallback(drawMultSeries5);
    google.charts.setOnLoadCallback(drawMultSeries6);
    google.charts.setOnLoadCallback(drawMultSeries7);
    google.charts.setOnLoadCallback(drawMultSeries8);
    
    function drawMultSeries() {
    	
         var data = new google.visualization.DataTable();
         data.addColumn('string', 'part');
         data.addColumn('number', '매출');
         
        //alert('data생성');
        for (var i = 0; i < queryObjectLen; i++) {
            var part = queryObject.barlist[i].part;
            var amt = queryObject.barlist[i].amt;
            //alert(city + amount + per);
             data.addRows([
                  [part,amt]
             ]);
        }
        
        var options = {
            title : '분기매출',
            chartArea : {
                width : '73%',
                height : '50%'
            },
            hAxis : {
                minValue : 0
            },
            series : {
            	0 : {color : 'blue'}
            }
            
        };
        
        var chart = new google.visualization.AreaChart(document
                .getElementById('chart_div'));
        chart.draw(data, options);
    }
    
    function drawMultSeries2() {
    	
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'part');
        data.addColumn('number', '건수');
        
       //alert('data생성');
       for (var i = 0; i < queryObjectLen; i++) {
           var part = queryObject.barlist[i].part;
           var co = queryObject.barlist[i].co;
           //alert(city + amount + per);
            data.addRows([
                 [part,co]
            ]);
       }
       
       var options = {
           title : '분기건수',
           chartArea : {
        	   width : '73%',
               height : '50%'
           },
           hAxis : {
               minValue : 0
           },
           series : {
           	0 : {color : 'red'}
           }
           
       };
       
       var chart2 = new google.visualization.AreaChart(document
               .getElementById('chart_div2'));
       chart2.draw(data, options);
   }
    
    function drawMultSeries3() {

    	// System.out.println(barlist);
        var data = new google.visualization.DataTable();
        data.addColumn('string', '요일별 매출');
        data.addColumn('number', '월요일');
        data.addColumn('number', '화요일');
        data.addColumn('number', '수요일');
        data.addColumn('number', '목요일');
        data.addColumn('number', '금요일');
        data.addColumn('number', '토요일');
        data.addColumn('number', '일요일');
        
        data.addRows([
             [" ",queryObject.barlist2[0].amt,queryObject.barlist2[1].amt,queryObject.barlist2[2].amt,queryObject.barlist2[3].amt,
                 queryObject.barlist2[4].amt,queryObject.barlist2[5].amt,queryObject.barlist2[6].amt]
        ]);
       
       
       var options = {
    	   title : ' ',
           chartArea : {
               width : '73%',
               height : '50%'
           },
           hAxis : {
        	   title : '요일별 매출',
               minValue : 0
           },
           series : {
           	0 : {color : 'red'}
           }
           
       };
       
       var chart3 = new google.charts.Bar(document
               .getElementById('chart_div3'));
       chart3.draw(data, options);
   }
   
   function drawMultSeries4() {
   	
       var data = new google.visualization.DataTable();
       data.addColumn('string', 'part');
       data.addColumn('number', '비율');
       
      //alert('data생성');
      for (var i = 0; i < queryObjectLen2; i++) {
          var part = queryObject.barlist2[i].part;
          var rate = queryObject.barlist2[i].rate;
          //alert(city + amount + per);
           data.addRows([
                [part,rate]
           ]);
      }
      
      var options = {
          title : '비율',
          chartArea : {
              width : '100%',
              height : '90%'
          },
          hAxis : {
              minValue : 0
          },
          series : {
          	0 : {color : 'red'}
          },
          pieHole: 0.4,
          
      };
      
      var chart4 = new google.visualization.PieChart(document
              .getElementById('chart_div4'));
      chart4.draw(data, options);
  }
   
   function drawMultSeries5() {
   	
       var data = new google.visualization.DataTable();
       data.addColumn('string', '시간별 매출');
       data.addColumn('number', '00 ~ 06시');
       data.addColumn('number', '06 ~ 11시');
       data.addColumn('number', '11 ~ 14시');
       data.addColumn('number', '14 ~ 17시');
       data.addColumn('number', '17 ~ 21시');
       data.addColumn('number', '21 ~ 24시');
       
       data.addRows([
           [" ",queryObject.barlist3[0].amt,queryObject.barlist3[1].amt,queryObject.barlist3[2].amt,
               queryObject.barlist3[3].amt,queryObject.barlist3[4].amt,queryObject.barlist3[5].amt]
      ]);
      
      var options = {
          title : '시간별 매출',
          chartArea : {
              width : '73%',
              height : '50%'
          },
          hAxis : {
              minValue : 0
          },
          series : {
          	0 : {color : 'red'}
          }
          
      };
      
      var chart5 = new google.charts.Bar(document
              .getElementById('chart_div5'));
      chart5.draw(data, options);
  }
  
  function drawMultSeries6() {
  	
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'part');
      data.addColumn('number', '비율');
      
     //alert('data생성');
     for (var i = 0; i < queryObjectLen3; i++) {
         var part = queryObject.barlist3[i].part;
         var rate = queryObject.barlist3[i].rate;
         //alert(city + amount + per);
          data.addRows([
               [part,rate]
          ]);
     }
     
     var options = {
         title : '비율',
         chartArea : {
             width : '100%',
             height : '90%'
         },
         hAxis : {
             minValue : 0
         },
         series : {
         	0 : {color : 'red'}
         },
         pieHole: 0.4,
         
     };
     
     var chart6 = new google.visualization.PieChart(document
             .getElementById('chart_div6'));
     chart6.draw(data, options);
 }
  
  function drawMultSeries7() {
  	
      var data = new google.visualization.DataTable();
      data.addColumn('string', '남녀 성비');
      data.addColumn('number', '남자');
      data.addColumn('number', '여자');
      
      data.addRows([
          [" ",queryObject.barlist4[0].amt,queryObject.barlist4[1].amt]
     ]);     
     var options = {
         title : '성별',
         chartArea : {
             width : '100%',
             height : '50%'
         },
         hAxis : {
             minValue : 0
         }
         
     };
     
     var chart7 = new google.charts.Bar(document
             .getElementById('chart_div7'));
     chart7.draw(data, options);
 }
 
 function drawMultSeries8() {
 	
     var data = new google.visualization.DataTable();
     data.addColumn('string', 'part');
     data.addColumn('number', '연령대');
     
    //alert('data생성');
    for (var i = 0; i < queryObjectLen5; i++) {
        var part = queryObject.barlist5[i].part;
        var rate = queryObject.barlist5[i].rate;
        //alert(city + amount + per);
         data.addRows([
              [part,rate]
         ]);
    }
    
    var options = {
        title : '비율',
        chartArea : {
            width : '100%',
            height : '90%'
        },
        hAxis : {
            minValue : 0
        },
        series : {
        	0 : {color : 'red'}
        },
        pieHole: 0.4,
        
    };
    
    var chart8 = new google.visualization.PieChart(document.getElementById('chart_div8'));
    chart8.draw(data, options);
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
<style>
body {
	margin-right: auto;
	margin-bottom: 8px;
	width: 1700px;
	height: auto;
	padding: auto;
	display: block;
}

.middle_container {
	width: 1700px;
	height: 50px;
}

ul.middle-ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #f1c40f;
}

ul.middle-ul li {
	float: left;
}

ul.middle-ul li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

ul.middle-ul li a:hover:not (.active ) {
	background-color: skyblue;
	color: rgb(49, 99, 227);
	font-weight: bold;
}

ul.middle-ul li a.active {
	background-color: #4CAF50;
}

@media screen and (max-width: 600px) {
	ul.middle-ul li {
		float: none;
	}
}

h2 {
	color: #785655;
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
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
	height: 2700px;
	margin: auto;
}
</style>
</head>
<body>
	<!--toggle시 지역분석 내용  -->
	<div id="local" style="float: left;">
		<a href="#part1" style="color: black; text-decoration: none;">1.총매출</a><span
			style="color: rgb(201, 208, 214); margin-left: 10px;">|</span> <a
			href="#part2" style="color: black; text-decoration: none;">2.주중,주말
			요일별 매출</a><span style="color: rgb(201, 208, 214); margin-left: 10px;">|</span>
		<a href="#part3" style="color: black; text-decoration: none;">3.시간대별
			매출</a><span style="color: rgb(201, 208, 214); margin-left: 10px;">|</span>
		<a href="#part4" style="color: black; text-decoration: none;">4.성별,연령별
			매출</a>
	</div>


	<div class="main-container" style="float: left;" id="store">
		<h4 style="text-align: left; margin-top: 20px;">
			<b>${area} - ${food}</b>
		</h4>
		<h2 id="part1" style="text-align: left;">1.총매출 비교</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="2">업종</th>
					<th rowspan="2" style="height: 73px; vertical-align: middle;">2017년
						전반기</th>
					<th rowspan="2" colspan="2"
						style="height: 73px; vertical-align: middle;">2017년 후반기</th>
					<th rowspan="2" colspan="2"
						style="height: 73px; vertical-align: middle;">2018년 전반기</th>
					<th rowspan="2" colspan="2"
						style="height: 73px; vertical-align: middle;">2018년 후반기</th>
					<th rowspan="2" colspan="2"
						style="height: 73px; vertical-align: middle;">2019년 전반기</th>
				</tr>
				<tr>
					<th colspan="2">분식전문점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th colspan="2">지역</th>
					<td>액/건</td>
					<%for(int i=0; i<4; i++) { %>
						<td>액/건</td>
						<td>증감률</td>
					<%} %>
				</tr>
				<tr>
					<td rowspan="2" style="height: 78px; vertical-align: middle;"><b>강남구 논현동</b></td>
					<th>매출액</th>
					<%
						for(int i=0; i<5; i++) { 
		   					switch(i) {
		   					case 0 :
		   						SalesDTO salesDtoOne = (SalesDTO)request.getAttribute("salesDtoOne");
		   						amt[i] = salesDtoOne.getThsmon_selng_amt();
		   			%>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoOne.thsmon_selng_amt}" /></td>
					<%
		   					break;
		   					case 1 :
		   						SalesDTO salesDtoTwo = (SalesDTO)request.getAttribute("salesDtoTwo");
		   						amt[i] = salesDtoTwo.getThsmon_selng_amt();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoTwo.thsmon_selng_amt}" /></td>
		   					<td><%
					     			db = (double) (amt[i]-amt[i-1])*100/amt[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
				     				if (db > 0) {
		                        %>
		                           <i class="fas fa-caret-up"
		                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
		                        
		                        <%
		                           } else if (db < 0) {
		                        %>
		                           <i class="fas fa-caret-down"
		                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
		                        <%
		                           }
		                        %>
     							<%=db %>%
	     					</td>
		   			<%
		   					break;
		   					case 2 :
		   						SalesDTO salesDtoThr = (SalesDTO)request.getAttribute("salesDtoThr");
		   						amt[i] = salesDtoThr.getThsmon_selng_amt();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoThr.thsmon_selng_amt}" /></td>
		   					<td>
		   						<%
					     			db = (double) (amt[i]-amt[i-1])*100/amt[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
				     				if (db > 0) {
		                        %>
		                           <i class="fas fa-caret-up"
		                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
		                        
		                        <%
		                           } else if (db < 0) {
		                        %>
		                           <i class="fas fa-caret-down"
		                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
		                        <%
		                           }
		                        %>
     							<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					case 3 :
		   						SalesDTO salesDtoFou = (SalesDTO)request.getAttribute("salesDtoFou");
		   						amt[i] = salesDtoFou.getThsmon_selng_amt();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoFou.thsmon_selng_amt}" /></td>
		   					<td>
		   						<%
					     			db = (double) (amt[i]-amt[i-1])*100/amt[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
				     				if (db > 0) {
		                        %>
		                           <i class="fas fa-caret-up"
		                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
		                        
		                        <%
		                           } else if (db < 0) {
		                        %>
		                           <i class="fas fa-caret-down"
		                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
		                        <%
		                           }
		                        %>
     							<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					case 4 :
		   						SalesDTO salesDtoFiv = (SalesDTO)request.getAttribute("salesDtoFiv");
		   						amt[i] = salesDtoFiv.getThsmon_selng_amt();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoFiv.thsmon_selng_amt}" /></td>
		   					<td>
		   						<%
					     			db = (double) (amt[i]-amt[i-1])*100/amt[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
				     				if (db > 0) {
		                        %>
		                           <i class="fas fa-caret-up"
		                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
		                        
		                        <%
		                           } else if (db < 0) {
		                        %>
		                           <i class="fas fa-caret-down"
		                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
		                        <%
		                           }
		                        %>
     							<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					}
						} 
					%>
				</tr>
				<tr>
					<th>건수</th>
					<%
						for(int i=0; i<5; i++) { 
		   					switch(i) {
		   					case 0 : 
		   						SalesDTO salesDtoOne = (SalesDTO)request.getAttribute("salesDtoOne");
		   						co[i] = salesDtoOne.getThsmon_selng_co();
		   			%>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoOne.thsmon_selng_co}" /></td>
					<%
		   					break;
		   					case 1 :
		   						SalesDTO salesDtoTwo = (SalesDTO)request.getAttribute("salesDtoTwo");
		   						co[i] = salesDtoTwo.getThsmon_selng_co();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoTwo.thsmon_selng_co}" /></td>
		   					<td>
		   						<%
					     			db = (double) (co[i]-co[i-1])*100/co[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
					     			if (db > 0) {
				                        %>
				                           <i class="fas fa-caret-up"
				                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
				                        
				                        <%
				                           } else if (db < 0) {
				                        %>
				                           <i class="fas fa-caret-down"
				                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
				                        <%
				                           }
				                        %>
					     		<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					case 2 :
		   						SalesDTO salesDtoThr = (SalesDTO)request.getAttribute("salesDtoThr");
		   						co[i] = salesDtoThr.getThsmon_selng_co();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoThr.thsmon_selng_co}" /></td>
		   					<td>
		   						<%
					     			db = (double) (co[i]-co[i-1])*100/co[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
					     			if (db > 0) {
				                        %>
				                           <i class="fas fa-caret-up"
				                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
				                        
				                        <%
				                           } else if (db < 0) {
				                        %>
				                           <i class="fas fa-caret-down"
				                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
				                        <%
				                           }
				                        %>
					     		<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					case 3 :
		   						SalesDTO salesDtoFou = (SalesDTO)request.getAttribute("salesDtoFou");
		   						co[i] = salesDtoFou.getThsmon_selng_co();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoFou.thsmon_selng_co}" /></td>
		   					<td>
		   						<%
					     			db = (double) (co[i]-co[i-1])*100/co[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
					     			if (db > 0) {
				                        %>
				                           <i class="fas fa-caret-up"
				                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
				                        
				                        <%
				                           } else if (db < 0) {
				                        %>
				                           <i class="fas fa-caret-down"
				                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
				                        <%
				                           }
				                        %>
					     		<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					case 4 :
		   						SalesDTO salesDtoFiv = (SalesDTO)request.getAttribute("salesDtoFiv");
		   						co[i] = salesDtoFiv.getThsmon_selng_co();
		   			%>
		   					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesDtoFiv.thsmon_selng_co}" /></td>
		   					<td>
		   						<%
					     			db = (double) (co[i]-co[i-1])*100/co[i-1];
					     			db = Double.parseDouble(String.format("%.2f", db));
					     			if (db > 0) {
				                        %>
				                           <i class="fas fa-caret-up"
				                              style="font-size:24px; margin-right: 2px; color: #FF0000;"></i>
				                        
				                        <%
				                           } else if (db < 0) {
				                        %>
				                           <i class="fas fa-caret-down"
				                              style="font-size:24px; margin-right: 2px; color: #0054FF;"></i>
				                        <%
				                           }
				                        %>
					     		<%=db %>%
		   					</td>
		   			<%
		   					break;
		   					}
						} 
					%>
				</tr>
			</tbody>
		</table>
		<br>
		<center>
		  <div id="chart_div" style="width: 750px; float: left; height: 300px;"></div>
		  <div id="chart_div2" style="width: 750px; float: right; height: 300px;"></div>
	  	</center>
  		<br>
  		
		<h2 id="part2" style="text-align: left; float: inherit;">2.주중,주말 요일별 매출 비교</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th style="height: 75px; vertical-align: middle;">업종</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">구분</th>
        <th rowspan="2" colspan="2" style="height: 150px; vertical-align: middle;">주말/주중<br>(일평균)</th>
        <th rowspan="2" colspan="7" style="height: 150px; vertical-align: middle;">요일별</th>
      </tr>
      <tr>
        <th style="height: 75px; vertical-align: middle;">분식전문점</th>
      </tr>
      <tr>
     	<th style="height: 50px; vertical-align: middle;">지역</th>
     	<th>주중</th>
     	<th>주말</th>
     	<th>월</th>
     	<th>화</th>
     	<th>수</th>
     	<th>목</th>
     	<th>금</th>
     	<th>토</th>
     	<th>일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th rowspan="2" style="height: 72px; vertical-align: middle;">강남구 논현동</th>
        <th>매출액</th>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.mdwk_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.wkend_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.mon_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tues_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.wed_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.thur_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.fri_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.sat_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.sun_selng_amt}" /></td></td>
      </tr>
      <tr>
      	<th>비율</th>
      	<td>${salesData.mdwk_selng_rate}%</td>
      	<td>${salesData.wkend_selng_rate}%</td>
      	<td>${salesData.mon_selng_rate}%</td>
      	<td>${salesData.tues_selng_rate}%</td>
      	<td>${salesData.wed_selng_rate}%</td>
      	<td>${salesData.thur_selng_rate}%</td>
      	<td>${salesData.fri_selng_rate}%</td>
      	<td>${salesData.sat_selng_rate}%</td>
      	<td>${salesData.sun_selng_rate}%</td>
      </tr>
    </tbody>
  </table>
  <br>
  <center>
		  <div id="chart_div3" style="width: 750px; float: left; height: 300px;"></div>
		  <div id="chart_div4" style="width: 750px; float: right; height: 300px;"></div>
	  	</center>
  		<br>
   <h2 id="part3" style="text-align: left; float: inherit;">3.시간대별 매출, 비율</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th style="height: 75px; vertical-align: middle;">업종</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">구분</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">00 ~ 06시</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">06 ~ 11시</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">11 ~ 14시</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">14 ~ 17시</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">17 ~ 21시</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">21 ~ 24시</th>
      </tr>
      <tr>
        <th style="height: 75px; vertical-align: middle;">분식전문점</th>
      </tr>
      <tr>
     	<th style="height: 50px; vertical-align: middle;">지역</th>
     	
      </tr>
    </thead>
    <tbody>
      <tr>
        <th rowspan="2" style="height: 72px; vertical-align: middle;">강남구 논현동</th>
        <th>매출액</th>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_00_06_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_06_11_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_11_14_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_14_17_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_17_21_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.tmzon_21_24_selng_amt}" /></td></td>
      </tr>
      <tr>
      	<th>비율</th>
        <td>${salesData.tmzon_00_06_selng_rate}%</td>
        <td>${salesData.tmzon_06_11_selng_rate}%</td>
        <td>${salesData.tmzon_11_14_selng_rate}%</td>
        <td>${salesData.tmzon_14_17_selng_rate}%</td>
        <td>${salesData.tmzon_17_21_selng_rate}%</td>
        <td>${salesData.tmzon_21_24_selng_rate}%</td>
      </tr>
    </tbody>
  </table>
  <br>
  <center>
		  <div id="chart_div5" style="width: 750px; float: left; height: 300px;"></div>
		  <div id="chart_div6" style="width: 750px; float: right; height: 300px;"></div>
	  	</center>
  <br>
  
 <h2 id="part4" style="text-align: left; float: inherit;">4.성별,연령별 매출 비교</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th style="height: 75px; vertical-align: middle;">업종</th>
        <th rowspan="3" style="height: 150px; vertical-align: middle;">구분</th>
        <th rowspan="2" colspan="2" style="height: 150px; vertical-align: middle;">성별</th>
        <th rowspan="2" colspan="6" style="height: 150px; vertical-align: middle;">연령별</th>
      </tr>
      <tr>
        <th style="height: 75px; vertical-align: middle;">분식전문점</th>
      </tr>
      <tr>
     	<th style="height: 50px; vertical-align: middle;">지역</th>
     	<th>남성</th>
     	<th>여성</th>
     	<th>10대</th>
     	<th>20대</th>
     	<th>30대</th>
     	<th>40대</th>
     	<th>50대</th>
     	<th>60대이상</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th rowspan="2" style="height: 72px; vertical-align: middle;">강남구 논현동</th>
        <th>매출액</th>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.ml_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.fml_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_10_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_20_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_30_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_40_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_50_selng_amt}" /></td></td>
        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${salesData.agrde_60_above_selng_amt}" /></td></td>
      </tr>
      <tr>
      	<th>비율</th>
        <td>${salesData.ml_selng_rate}%</td>
        <td>${salesData.fml_selng_rate}%</td>
        <td>${salesData.agrde_10_selng_rate}%</td>
        <td>${salesData.agrde_20_selng_rate}%</td>
        <td>${salesData.agrde_30_selng_rate}%</td>
        <td>${salesData.agrde_40_selng_rate}%</td>
        <td>${salesData.agrde_50_selng_rate}%</td>
        <td>${salesData.agrde_60_above_selng_rate}%</td>
      </tr>
    </tbody>
  </table>
  <br>
  <center>
		  <div id="chart_div7" style="width: 750px; float: left; padding-left: 200px; height: 300px;"></div>
		  <div id="chart_div8" style="width: 750px; float: right; height: 300px;"></div>
	  	</center>
  		<br>
	</div>
	<div id="top" onclick="scrollMove()"
      style="font-size:25px; position:fixed; cursor: pointer; width: fit-content; border:1px solid black; left: 1700px; bottom:40px; text-align: right; padding: 5px 10px 10px 10px;">
      <b>top</b>
   </div>
</body>
</html>
