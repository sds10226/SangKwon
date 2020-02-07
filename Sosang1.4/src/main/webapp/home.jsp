<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	InetAddress ip = InetAddress.getLocalHost();
	String hostAddress = ip.getHostAddress();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 손안의 강남 상권</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- link : bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- link : font-awesome 아이콘 링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <!-- script : jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- script : bootstrap -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
         /* CSS initialize */
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            font-family: 'KBIZHanmaumGothic';
            box-sizing: border-box;
        }
        /* body tag : page background image setting */
        .main-body {
            background-image: url(resources/imgBackground/back3.png);
            overflow: auto;
        }  

        /* font 링크 */
        @font-face {
            font-family: 'KBIZHanmaumGothic'; 
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')format('woff'); 
            font-weight: normal; 
            font-style: normal; 
        }

        /*
        ---------------------------------------------------------------------
        Module(headLine, top, foter)
        ---------------------------------------------------------------------
        */

        /* 사이트 최상단 title 들어오는 자리 */
        #headLine {
            height: 100px; 
            line-height: 90px; 
            background-color: rgb(245,245,215); 
            text-align: center; 
            font-size: 44px;
            font-weight: bold;
            font-family: 'Cute Font', cursive;
            
            border-bottom: 4px double rgb(200,200,180);
            border-top: 4px double rgb(200,200,180);
            width: 100%;
            min-width: 1340px;
        }

        /* top menubar setting */
        .navbar-inverse {
            background-color: #f1c40f;
            opacity: 0.9;
             /* 구버전 전용 */
            filter: alpha(opacity=90);
        }
        .navbar {
            border: 1px solid #f1c40f; 
            border-radius: 0; 
            z-index: 9999;
            width: 100%;
            min-width: 1340px;
        }
        .navbar-brand {
            font-weight: bold;
        } 
        /* top-menu addclass, removeclass해서 상단에 고정시킬 용도 */
        .fixed-topMenu {
            position: fixed;
            top: 0px;
        }

        /* footer setting */
        #main-footer {
            border-top: 3px double #fff;
            height: 50px;
            background-color: rgb(47, 33, 33);  
            width: 100%;
            min-width: 1340px;
            color: #fff;
        }
        #main-footer-left {
            margin: 0 auto;
            float: right;
            line-height: 48px;
            font-weight: 500;            
        }
        #main-footer-right a {
            text-decoration: none;
            color: #fff;
        }
        #main-footer-right a:visited {
            text-decoration: none;
            color: #fff;
        }
        #main-footer-right a:link {
            text-decoration: none;
            color: #fff;
        }
        /* about us 들어가는 footer */
        #main-add-footer {
            background-color: rgb(67, 53, 53);
            height: 390px;
            width: 100%;
            min-width: 1340px;
        }
        #add-footer-table tr th,
        #add-footer-table tr td {
            font-size: 16px;
            height: 35px;
        }
        #add-footer-table tr th {
            text-align: right;
            padding-right: 20px;
        }
        #add-footer-table tr td {
            color: rgb(27, 13, 13);
        }


        /*
        ---------------------------------------------------------------------
        Main Layout setting
        ---------------------------------------------------------------------
        */
        /* 메인 높이만 잡아주는 용도 */
        #containerKing {
            border: 0px solid;
            height: 800px; 
            width: 100%;
            margin: 0 auto; 
        }

        /* 메인 컨테이너 */
        #main-container {
            height: auto;
            width: 740px;
            margin: 0 auto;
        }
        /* 메인 컨테이너 백그라운드 */
        #main-container-background {
            border: 4px solid rgb(47, 33, 33); 
            box-shadow: 0px 0px 3px 3px rgb(47, 33, 33);
            border-radius: 15px; 
            width: 740px; 
            height: 830px; 
            z-index: -9999; 
            background-color: #fff; 
            /* 위치 설정 */
            margin: 0 auto;            
        }
        /* 사이트 이용 방법 창 */
        #main-useInfo {
            width: 740px; 
            height: 831px; 
            background-color: rgba(47, 33, 33, 0.7); 
            border-radius: 15px; 
            z-index: 2; 
            /* 위치설정 */
            position: relative;
            margin: 0 auto;
            margin-top: -830px;
            cursor: pointer; 
        }
        /* 맵 컨테이너 */
        #map-container {
            width: 660px;
            height: auto;
            border: 5px solid #f1c40f;
            box-shadow: 0px 0px 3px 3px #f1c40f;
            z-index: 1;
            margin-left: 28px;
            /* 위치 설정 */
            position: relative;
            margin: 0 auto;
            margin-top: -820px;
        }

        /* 사이트 이용 방법 버튼 */
        #main-useInfoBtn {
            cursor: pointer; 
            color: rgba(47, 33, 33);
            background-color: rgb(241, 196, 15); 
            width: 200px; 
            height: 40px; 
            line-height: 40px; 
            text-align: center; 
            font-size: 20px; 
            font-weight: bold; 
            /* 위치 설정 */
            margin: 0 auto; 
            margin-top: 10px;
            border-radius: 10px; 
        }
        #main-useInfoBtn:hover {
            background-color: #f1c40f;
            box-shadow: 0px 0px 2px 2px #f1c40f;
        }
        /* 사용법에 표시되어있는 화살표들 움직이게 제어 */
        .fa-arrow-down {
            animation: horizontal 0.5s ease-in-out infinite;
        }
        @keyframes horizontal {
            0% {
                margin-top: 9px;
            }
            50% {
                margin-top: 12px;
            }
            100% {
                margin-top: 9px;
            }
        }
        
        /* 검색 버튼 */
        .main-searchBtn {
            background-color: #f1c40f;
            color: rgba(47, 33, 33);
            border: 2px solid #f1c40f;
            border-radius: 5px;
            height: 45px;
            width: 120px;
            font-size: 20px;
            font-weight: bold;
            margin: 0 auto;
            display: block;
            
            transition: .2s;
        }
        .main-searchBtn:hover {
            background-color: #f1c40f;
            box-shadow: 0px 0px 2px 2px #f1c40f;
        }

        /* 이미지 선택지들 setting */
        #main-searchImgBox {
            width: 647px;
            margin: 0 auto;
        }
        #main-searchImgBox img {
            margin: 5px;
            width: 50px;
            height: 50px;
            position: relative;
            cursor: pointer;
            padding: 2px;
        }
        #main-searchImgBox img:nth-child(10) {
            height: 41px;
            width: 42px;
            padding-bottom: 3px;
        } 
        #main-searchImgBox img:hover {
            box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
        }

        /* 오른쪽 컨테이너 */
        #main-rightContainer {
            width: 300px;
            height: 300px;
           
            border-radius: 10px;
            padding: 17px;
            background-color: rgb(47, 33, 33);
            color: #fff;
            z-index: 100;
            /* 위치 설정 */
            position: relative;
            margin-top: -925px;
            margin-right: 30px;
            float: right;
        }
        /* 오른쪽 안내 상자 닫는 버튼 */
        .rightContainerXBtn {
            cursor: pointer;
            float: right; 
            margin-top: -50px;
        }

        
        /* 
        ---------------------------------------------------------------------
       	 지도설정
        ---------------------------------------------------------------------
        */
        /* 각 동에 mouseover 이벤트가 발생하면 생기는 customOverlay */
        .area {
            position: absolute;
            font-size: 12px;
            top: -5px;
            left: 15px;
            height: 34px;
            line-height: 34px;
            width: 6em;
            text-align: center;

            -webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            -moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

            background-color: rgba(0, 0, 0, 0.8);

            -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            -moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
                
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
                
            color: #FFFFFF;
        }

        .info {
            font-size: 12px;
            padding: 5px;
        }
        .info .title {
            font-weight: bold;
        }

        
        /* 외식업 종류 선택 툴팁 작업 */
        [data-tooltip-text]:hover {
            position: relative;
        }
        [data-tooltip-text]:after {
            -webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            -moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

            background-color: rgba(0, 0, 0, 0.8);

            -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            -moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
                
            color: #FFFFFF;
            font-size: 12px;
            margin-bottom: 10px;
            padding: 7px 12px;
            position: absolute;
            width: auto; 
            min-width: 85px;
            max-width: 500px;
            word-wrap: break-word;
            text-align: center;
            z-index: 1;
            opacity: 0;
             /* 구버전 전용 */
            filter: alpha(opacity=0);
            left: -9999px;
            content: attr(data-tooltip-text);
        }
        [data-tooltip-text]:after {
            top: -405%;
            left: -10px;
            opacity: 1;
             /* 구버전 전용 */
            filter: alpha(opacity=100);
        }

        /* 동을 클릭했을 때 생성되는 customOverlay CSS styling */
        .main-label {
            margin-bottom: 96px;
        }
        .main-label * {
            display: inline-block;
            vertical-align: top;
        }
        .main-label .main-center {
            background: rgba(50, 50, 50, 0.4);
            display: inline-block;
            height: 34px;
            font-size: 12px;
            line-height: 34px;
            width: 5em;
            text-align: center;

            /* 생성될 위치 설정 */
            position: absolute;
            top: 10px;
            left: -30px;
            
            -webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            -moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
            transition: bottom .3s ease-in-out, opacity .3s ease-in-out;

            background-color: rgba(0, 0, 0, 0.8);

            -webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            -moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
            box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
                
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
                
            color: #FFFFFF;
        }
  
        /* top 버튼 */
        #top-btn {
            position: fixed;
            right: 30px;
            bottom: 25px;
            width: 50px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #f1c40f;
            border-radius: 10px;
            text-align: center;
            background-color: #f1c40f;
            text-decoration: none;
            color: rgb(47, 33, 33);
            display: none;
            z-index: 9999;
        }
        #top-btn:visited {
            text-decoration: none;
            color: rgb(47, 33, 33);
        }

        /* big data img container */
        #bigDataImg-container {
            display: block;
            width: 100%;
            min-width: 1340px;
            height: 750px;
            background-color: rgb(241, 221, 21);
        }
        #bigDataImg {
            display: block;
            margin: 0 auto;
            width: 1200px;
        }

        /* left Benner */
        #main-leftBenner {
            position: fixed;
            top: 45%;
            left: 1%;
            width: 40px;
            z-index: 9999;
        }
        .fab {
            font-size: 25px;
            color: black;
            cursor: pointer;
            padding: 5px;
        }
        .fab:nth-child(1),
        .fab:nth-child(2) {
            margin-left: 5px;
        }
        #leftBenner {
            display: block;
            margin: 0 auto;
            margin-top: 10px;
            margin-left: 18px;
        }

        /* step img container */
        #stepImg-container {
            min-width: 1340px;
            height: 640px;
            background-color: #fff;
        }
        /* step img table */
        #stepImg-table {
            width: 1200px;
            display: block;
            margin: 0 auto;
        }
        #tableTitle {
            min-width: 1340px;
            text-align: center;
            height: 120px;
            border: 1px solid #fff;
        }
        #img-step1,
        #img-step2,
        #img-step3,
        #img-step4 {
            width: 0px;
            transition: 1s;
        }

        /* 상권 분석 예시 컨테이너 셋팅 */
        #sample-container {
            width: 100%; 
            min-width: 1340px;
            
            height: 950px; 
            background-color: rgba(255,255,255, 0.7);
            z-index: -999;   
        }
        #sample-result {
            height: 910px;
            margin: 0 auto;

            width: 1300px;
        }
        #sample-img-table {
            margin: 0 auto;
            /* td 사이 띄우기 */
            border-collapse: separate;
            border-spacing: 20px;
        }
        #sample-img-table tr td {
            width: 500px;
            height: 350px;
        }
        #sample-img-table tr td img {
            width: 0px;
            height: 350px;
        }
        #sampleImg1,
        #sampleImg2,
        #sampleImg3,
        #sampleImg4 {
            width: 0px;
            transition: 1s;
        }
        
    </style>
    <script>
        /* 쿠키 구하기 */
        function getCookie(name) {
            var cookieName = name + "=";
            var x = 0;

            while(x <= document.cookie.length) {
                var y = (x + cookieName.length);
                if(document.cookie.substring(x, y) == cookieName) {
                    if((endCookieName = document.cookie.indexOf(';', y) ) == -1) {
                        endCookieName = document.cookie.length;
                    }
                    return unescape(document.cookie.substring(y, endCookieName));
                }
                x = document.cookie.indexOf(' ', x) + 1;
                if(x == 0) {
                    break;
                }
                return '';
            }
        }

        /* 사용방법 창 클릭해도 사라지게 만듦 */
        function useinfoClick() {
            $('#main-useInfo').fadeOut();
        }

        /* 그림 선택하면 input에 입력 */
        $(document).ready(function() {
        	// 사이트 이용 방법 버튼 클릭했을 때 이용 설명서 판(?)이 나타났다 사라졌다 하게 만드는 jquery문
            $('#main-useInfoBtn').click(function() {
                $('#main-useInfo').fadeToggle();
            });

            // top 버튼 설정
            $(function() {
                $(window).scroll(function() {
                    // 스크롤 위치에 따라서 나타나는 top 버튼
                    if ($(this).scrollTop() > 500) {
                        $('#top-btn').fadeIn();
                    } else {
                        $('#top-btn').fadeOut();
                    }
                });
                
                // top으로 올라가는 속도 조절
                $("#top-btn").click(function() {
                    $('html, body').animate({
                        scrollTop : 0
                    }, 400);
                    return false;
                });
            });

            // top-nav 스크롤 내리면 고정
            $(function() {
                var topOffset = $('#top-menu').offset();
               $(window).scroll(function() {
                    if ($(this).scrollTop() > topOffset.top) {
                        $('#top-menu').addClass('fixed-topMenu');
                    } else {
                        $('#top-menu').removeClass('fixed-topMenu');
                    }
               });
            });
            
            // bigdata img fade... 설정
            $(function() {
                $(window).scroll(function() {
                    // 스크롤 위치에 따라서 나타나는 bigdata img 설정
                    if($(this).scrollTop() > 500) {
                        $('#bigDataImg').fadeIn();
                    } else {
                        $('#bigDataImg').fadeOut();
                    }
                });
            });

            // step table  fade... 설정
            $(function() {
                $(window).scroll(function() {
                    // 스크롤 위치에 따라서 나타나는 bigdata img 설정
                    if($(this).scrollTop() > 1100) {
                        $('#tableTitle').fadeIn(function() { 
                            $('#img-step1').css('width','300px');
                            $('#img-step2').css('width','300px');
                            $('#img-step3').css('width','300px');
                            $('#img-step4').css('width','300px');
                        });
                    } else {
                        $('#tableTitle').fadeOut();
                        $('#img-step1').css('width','0px');
                        $('#img-step2').css('width','0px');
                        $('#img-step3').css('width','0px');
                        $('#img-step4').css('width','0px');
                    }
                });
            });

            $(function() {
                $(window).scroll(function() {
                    if($(this).scrollTop() > 2000) {
                        $('#sample-table-title').fadeIn(function() {
                            $('#sampleImg1').css('width','500px');
                            $('#sampleImg2').css('width','500px');
                            $('#sampleImg3').css('width','500px');
                            $('#sampleImg4').css('width','500px');
                            
                        });
                    } else {
                        $('#sample-table-title').fadeOut(function() {
                            $('#sampleImg1').css('width','0px');
                            $('#sampleImg2').css('width','0px');
                            $('#sampleImg3').css('width','0px');
                            $('#sampleImg4').css('width','0px');
                        });
                    }
                })
            })

        	// 외식업 분류를 선택했을 때 처리
        	// 한식
            $('#hansik').click(function() {
                document.getElementById('subclass').value = $('#hansik').attr('name');
            });
            // 일식
            $('#ilsik').click(function() {
                document.getElementById('subclass').value = $('#ilsik').attr('name');
            });
         	// 중식
            $('#jungsik').click(function() {
                document.getElementById('subclass').value = $('#jungsik').attr('name');
            });
         	// 양식
            $('#yangsik').click(function() {
                document.getElementById('subclass').value = $('#yangsik').attr('name');
            });
         	// 분식
            $('#boonsik').click(function() {
                document.getElementById('subclass').value = $('#boonsik').attr('name');
            });
         	// 치킨
            $('#chiken').click(function() {
                document.getElementById('subclass').value = $('#chiken').attr('name');
            });
         	// 패스트푸드
            $('#fastfood').click(function() {
                document.getElementById('subclass').value = $('#fastfood').attr('name');
            });
         	// 제과제빵
            $('#dessert').click(function() {
                document.getElementById('subclass').value = $('#dessert').attr('name');
            });
         	// 제과제빵
            $('#cafe').click(function() {
                document.getElementById('subclass').value = $('#cafe').attr('name');
            });
         	// 호프
            $('#hof').click(function() {
                document.getElementById('subclass').value = $('#hof').attr('name');
            });
   
            // 외식업 분류를 선택했을 때 tooltip 처리
            $('[data-tooltip-text]').click(function() {
                $('[data-tooltip-text]').each(function(){
                    $(this).css('position', 'static');
                })
                $(this).css('position', 'relative');
            });

        });

		// 선택사항 유효성 검사
        function validationChk(mainSubmitForm) {
            if(!mainSubmitForm.area.value) {
                alert('동을 선택해주세요.');
                return false;
            }
            if(!mainSubmitForm.food.value) {
                alert('외식업 종류를 선택해주세요.');
                return false;
            }

            // 유효성 검사 이후 jsp로 parameter submit 하기
            var area = mainSubmitForm.area.value;
            var food = mainSubmitForm.food.value;
            mainSubmitForm.action = "analysis/showData.do";
            mainSubmitForm.submit();
            
        }

    </script>
</head>
<body class="main-body">

    <!-- headLine -->
    <div id="headLine">
        <div style="width: 1240px; margin: 0 auto;">
            <div id="logoSpace" style="float: left; margin-left: -25px; margin-top: -7px;"><a class="navbar-brand name-brand" href="#"></a><img src="resources/imgIcon/Logo.png" alt="기업로고" style="width: 200px; height: 100px;"></div>
            <span style="margin-left: -175px;">내 손안의 강남 상권</span>
        </div>
    </div>

<%
	// 회원 로그인 확인
	request.setCharacterEncoding("utf-8");
	// test용도
	/* session.setAttribute("id", "gang6607"); */
	String id = (String) session.getAttribute("id");
%>


    <!-- top menu 자리 -->
    <nav class="navbar navbar-inverse" id="top-menu">
        <div class="container-fluid">
            <div class="navbar-header">
            <!-- 빈 공간 -->
            </div>
            <div style="width: 1200px; margin: 0 auto;">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home.jsp" style="background-color: #f1c40f; color: rgba(47, 33, 33);"><font style="color: rgb(47, 33, 33);"><i class="fas fa-home"></i> <b>Home</b></font></a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                <% if(id == null) { %>
                    <li><a href="member/memberRegisterForm.do" style="color: rgba(47, 33, 33);"><span class="glyphicon glyphicon-user" style="color: rgb(47, 33, 33);"></span><font style="color: rgb(47, 33, 33);"> 회원가입</font></a></li>
                    <li><a href="member/loginForm.do" style="color: rgba(47, 33, 33);"><span class="glyphicon glyphicon-log-in" style="color: rgb(47, 33, 33);"></span><font style="color: rgb(47, 33, 33);"> 로그인</font></a></li>
                <% } else { %>
                	<li><a style="color: rgba(47, 33, 33);"><font style="color: rgb(47, 33, 33);"><%=id %>님, 환영합니다.</font></a></li>
                    <li><a href="member/mypage.do" style="color: rgba(47, 33, 33);"><i class="fas fa-user" style="color: rgb(47, 33, 33);"></i><font style="color: rgb(47, 33, 33);"> 마이페이지</font></a></li>
                    <li><a href="member/logout.do" style="color: rgba(47, 33, 33);"><i class="fas fa-sign-out-alt" style="color: rgb(47, 33, 33);"></i><font style="color: rgb(47, 33, 33);"> 로그아웃</font></a></li>
                <% } %>
                </ul>
            </div>
        </div>
    </nav> 

    <br>
    
    
    <div id="containerKing">
        <!-- main-container-->
        <div id="main-container">
            <div id="main-useInfoBtn">사이트 이용 방법</div>
            <br>
            <br>
            <!-- main-container 뒷 판  -->
            <div id="main-container-background"></div>
            
            <br>
            <!-- 지도를 담는 container -->    
            <div id="map-container">
                <!-- 지도를 표시할 div -->
                <div id="map" style="width: 650px; height:600px;"></div>
            </div>
            <br>
            <br>
            <!-- 지도와 하단 툴 사이의 경계선 -->
            <p style="border-top: 2px solid rgb(47, 33, 33); height: 10px; width: 90%; margin: 0 auto;"></p>
            <!-- 하단 검색 툴 -->
            <form name="main-search-form" method="GET">
                <div id="main-searchImgBox">
                    <span data-tooltip-text="한식"><img src="resources/imgIcon/hansik.png" name="한식음식점" id="hansik"></span>
                    <span data-tooltip-text="일식"><img src="resources/imgIcon/ilsik.png" name="일식음식점" id="ilsik"></span>
                    <span data-tooltip-text="중식"><img src="resources/imgIcon/jungsik.png" name="중식음식점" id="jungsik"></span>
                    <span data-tooltip-text="양식"><img src="resources/imgIcon/yangsik.png" name="양식음식점" id="yangsik"></span>
                    <span data-tooltip-text="분식"><img src="resources/imgIcon/boonsik.png" name="분식전문점" id="boonsik"></span>
                    <span data-tooltip-text="치킨"><img src="resources/imgIcon/chiken.png" name="치킨전문점" id="chiken"></span>
                    <span data-tooltip-text="패스트푸드"><img src="resources/imgIcon/fastfood.png" name="패스트푸드점" id="fastfood"></span>
                    <span data-tooltip-text="제과제빵"><img src="resources/imgIcon/dessert.png" name="제과점" id="dessert"></span>
                    <span data-tooltip-text="카페"><img src="resources/imgIcon/cafe.png" name="커피·음료" id="cafe"></span>
                    <span data-tooltip-text="호프"><img src="resources/imgIcon/suljib.png" name="호프·간이주점" id="hof"></span>
                </div>

                <br>
                <!-- 선택 값을 받는 input hidden -->
                <input type="hidden" name="area" class="setDongname" id="setDongname" value="" placeholder="동을 선택하세요.">
                <input type="hidden" name="food" class="subclass" id="subclass" value="" placeholder="외식업 종류를 선택하세요.">
                <%
                	if(id != null) {
                %>
                	<input type="hidden" name="id" id="setId" value="<%=id %>">
                <% 
                	} 
                %>
                <!-- 검색 버튼 -->
                <!-- <input type="button" onclick="validationChk(this.form)" value="검  색" class="main-searchBtn"> -->
                <button type="button" onclick="validationChk(this.form)" class="main-searchBtn"><i class="fas fa-search"></i> 검 색</button>
                
            </form>
            
        <!-- end main-container -->
        </div>      
        <!-- 사용 방법 설명 -->
        <div id="main-useInfo" onclick="useinfoClick()"> 
            <!-- 
            	닫기 버튼 : 혹시 사용할지 몰라서 주석처리
            <button style="position: absolute; color: white; right: 10px; top: 10px; border: none; border-radius: 30px; background-color: rgba(0, 0, 0, 0.7);" onclick="btnClose(); function btnClose(){$('#main-useInfo').remove();}">
                <i class="far fa-times-circle" style="font-size: 25px;"></i>
            </button>  
            -->
            <div style="width: 100%;">
                <div style="width: 9.5em; color: white; font-size: 15px; margin: 0 auto; margin-top: 10px;"><br>[ 클릭하면 사라져요! ]</div>
            </div>
            <div style="width: 195px; color: white; font-size: 20px; position: absolute; top: 240px; left: 100px;">1. 지역을 선택하세요</div>
            <div style="width: 195px; color: white; font-size: 20px; position: absolute; top: 630px; left: 50px;">2. 분류를 선택하세요</div>
            <div style="width: 240px; color: white; font-size: 20px; position: absolute; top: 700px; left: 256px;">3. 검색 버튼을 클릭하세요</div>
            <!-- 움직이는 화살표들 -->
            <i class="fas fa-arrow-down" style="font-size: 30px; color: red; position: absolute; top: 260px; left: 190px;"></i>
            <i class="fas fa-arrow-down" style="font-size: 30px; color: red; position: absolute; top: 650px; left: 126px;"></i>
            <i class="fas fa-arrow-down" style="font-size: 30px; color: red; position: absolute; top: 720px; left: 359px;"></i>
        </div>  
    <!-- end containerKing --> 
    </div>

    <div style="height: 200px;"></div>
    
    <!-- 오른쪽 컨테이너 -->
    <div id="main-rightContainer">
        <div style="text-align: center; margin-top: 5px; font-size: 16px;"><b style="color: #f1c40f;">내 손안의 강남 상권</b>을<br>방문해주셔서 감사합니다.</div>
        <i class="far fa-times-circle rightContainerXBtn" onclick="closebtn(); function closebtn() {$('#main-rightContainer').fadeOut(100)};"></i>
        <hr>
        <p style="height: 10px;"></p>
        <div style="padding-left: 15px;">                
            <h5><i class="fas fa-info-circle" style="color: #f1c40f;"></i> 홈페이지 이용 안내</h5>
            <font style="font-size: 30px;">1599-0000&emsp;</font><i class="fas fa-headset" style="color: #f1c40f; font-size: 250%;"></i>
            <p style="height: 3px;"></p>
            <ul style="margin-left: 20px;">
                <li>평일 09:30 ~ 18:30</li>
                <li>점심시간 12:30 ~ 13:30</li>
                <li>주말 및 공휴일 휴무</li>
            </ul>
        </div>
    </div>

    <!-- 왼쪽 배너 -->
    <div id="main-leftBenner">
        <a href="#" target="_blank"><i class="fab fa-facebook-square" style="margin-left: 8px;"></i></a>
        <a href="#" target="_blank"><i class="fab fa-instagram" style="margin-left: 8px;"></i></a>
        <a href="#" target="_blank"><i class="fab fa-youtube"></i></a>
        <img id="leftBenner" src="resources/images/leftbanner.png" alt="왼쪽 베너">
    </div>



    <!-- 빅데이터 이미지 담는 컨테이너 -->
    <div id="bigDataImg-container">
        <img id="bigDataImg" src="resources/images/bigdataImg.png" alt="빅데이터 이미지">
    </div>

    <!-- 상권 분석 step 이미지 담는 컨테이너 -->
    <div id="stepImg-container">
        <br>
        <div id="tableTitle"><h1>상권 분석 프로세스</h1></div>
        
        <table id="stepImg-table">
            <tr>
                <td><img id="img-step1" src="resources/images/step1.png"></img></td>
                <td><img id="img-step2" src="resources/images/step2.png"></img></td>
                <td><img id="img-step3" src="resources/images/step3.png"></img></td>
                <td><img id="img-step4" src="resources/images/step4.png"></img></td>
            </tr>
        </table>
        
    </div>


    <!-- sample container -->
    <div id="sample-container">
        <br>
        <br>
        <div id="sample-result">
            <h1 id="sample-table-title" style="text-align: center;">상권 분석 예시</h1>

            <br>
            <table id="sample-img-table">
                <tr>
                    <td><img id="sampleImg1" src="resources/images/sampleImg1.jpg" alt=""></td>
                    <td><img id="sampleImg2" src="resources/images/sampleImg2.jpg" alt=""></td>
                </tr>
                <tr>
                    <td><img id="sampleImg3" src="resources/images/sampleImg3.jpg" alt=""></td>
                    <td><img id="sampleImg4" src="resources/images/sampleImg4.jpg" alt=""></td>
                </tr>
            </table>
        </div>
    </div>


    <!-- main-add-footer -->
    <div id="main-add-footer">
        <div style="height: 50px;"></div>
        <div style="width: 1280px; height: 350px; margin: 0 auto; color: #fff;">
            <div id="add-footer-table-container">
                <h2 style="text-align: center; height: 60px;">About us</h2>
                <table id="add-footer-table" style=" margin: 0 auto;">
                    <tr>
                        <th>Address.</th>
                        <td>서울특별시 강남구 테헤란로 123 여삼빌딩 15층</td>
                    </tr>
                    <tr>
                        <th>Email.</th>
                        <td>gangnaminhand@gmail.com</td>
                    </tr>
                    <tr>
                        <th>Tel.</th>
                        <td>02-1111-1111</td>
                    </tr>
                    <tr>
                        <th>Fax.</th>
                        <td>02-2222-2222</td>
                    </tr>
                </table>
                <br>
                <div style="width: 200px; margin: 0 auto;">
                    <a href="#" target="_blank"><i style="color: #fff; font-size: 45px;" class="fab fa-facebook-square"></i></a>
                    <a href="#" target="_blank"><i style="color: #fff; font-size: 45px;" class="fab fa-instagram"></i></a>
                    <a href="#" target="_blank"><i style="color: #fff; font-size: 45px;" class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>

    <a href="" id="top-btn">TOP</a>
    <div id="main-footer">
        <div style="width: 1200px; margin: 0 auto;">
            <div id="main-footer-right" style="float: left; line-height: 48px;">
                <a href="home.jsp">HOME</a>  |
                <a href="home/privacyPolicy.do">개인정보취급정책</a>  |
                <a href="home/termsOfUse.do">이용약관</a>  |
                <a href="home/rejectEmailCollection.do">이메일수집거부</a>
            </div>
            <div id="main-footer-left">Copyright ⓒ 내손안에강남상권 Reserved</div>
        </div>
    </div> 
    
<!-- 지도를 표시할 javascript : 반드시 하단에 위치할 것 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1ff058e429ac6e20018824c1f0d801f&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.49513411765609, 127.06806422245424), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption),
	    customOverlay = new kakao.maps.CustomOverlay({}),
	    infowindow = new kakao.maps.InfoWindow({removable: false});
	
	
	// 지도에 폴리곤 형식으로 표시할 영역데이터 배열
	var areas = [
	    {
	        name : '세곡동',
	        path : [
	            /* 좌측 상단 */
	            new kakao.maps.LatLng(37.46895359815481, 127.08774383954872),
	            new kakao.maps.LatLng(37.46963534384816, 127.09172377904852),
	            new kakao.maps.LatLng(37.46927486976101, 127.09181377322592),
	            new kakao.maps.LatLng(37.47035394203423, 127.09452817072861),
	            new kakao.maps.LatLng(37.47038635437867, 127.09895957359505),
	            new kakao.maps.LatLng(37.47089019692847, 127.09981938518565),
	            new kakao.maps.LatLng(37.470203927045674, 127.1015819695039),
	            /* 우측 상단 */
	            new kakao.maps.LatLng(37.46958935497057, 127.10375157776629),
	            new kakao.maps.LatLng(37.469012430664584, 127.10406730046675),
	            new kakao.maps.LatLng(37.4662715522059, 127.10609819858068 ),
	            new kakao.maps.LatLng(37.4661264933406, 127.10709273262353),
	            new kakao.maps.LatLng(37.467027338946636, 127.10727488144632),
	            new kakao.maps.LatLng(37.468717429531274, 127.11139204078468),
	            new kakao.maps.LatLng(37.46709223559863, 127.11491647658518),
	            new kakao.maps.LatLng(37.46662265044207, 127.11600093475295),
	            new kakao.maps.LatLng(37.46608231079038, 127.11572880760406),
	            new kakao.maps.LatLng(37.467699934385564, 127.11993642208292),
	            new kakao.maps.LatLng(37.467950785915505, 127.12133853445515),
	            new kakao.maps.LatLng(37.46831053778405, 127.12197214999588),
	            new kakao.maps.LatLng(37.472025371644, 127.1193554865958),
	            new kakao.maps.LatLng(37.472637553868594, 127.11985387263668),
	            /* 하단 */
	            new kakao.maps.LatLng(37.46668693555272, 127.12368771036084),
	            new kakao.maps.LatLng(37.46409488324351, 127.12092537523463),
	            new kakao.maps.LatLng(37.463017496919186, 127.11712570329713),
	            new kakao.maps.LatLng(37.45901696682521, 127.11716467471197),
	            new kakao.maps.LatLng(37.45992163815694, 127.11341351749341),
	            new kakao.maps.LatLng(37.46082428493258, 127.1116968165708),
	            new kakao.maps.LatLng(37.461544536195696, 127.11228565237437),
	            new kakao.maps.LatLng(37.46281236136963, 127.10532468248654),
	            new kakao.maps.LatLng(37.46252500021767, 127.10423916158493),
	            new kakao.maps.LatLng(37.461263145851845, 127.10473474721071),
	            new kakao.maps.LatLng(37.45993016953139, 127.10414513623901),
	            new kakao.maps.LatLng(37.45867146223922, 127.1010238369526),
	            new kakao.maps.LatLng(37.45622247106891, 127.0989409080226),
	            new kakao.maps.LatLng(37.45665781973342, 127.0954603336368),
	            new kakao.maps.LatLng(37.45928939108945, 127.09469508662998),
	            new kakao.maps.LatLng(37.461811420407166, 127.095692949005),
	            new kakao.maps.LatLng(37.462895717891804, 127.09180597244324),
	            new kakao.maps.LatLng(37.46552684379585, 127.09158311435705)
	        ]
	    }, {
	        name : '율현동',
	        path : [
	            /* 하단 */
	            new kakao.maps.LatLng(37.470203927045674, 127.1015819695039),
	            new kakao.maps.LatLng(37.46958935497057, 127.10375157776629),
	            new kakao.maps.LatLng(37.469012430664584, 127.10406730046675),
	            new kakao.maps.LatLng(37.4662715522059, 127.10609819858068),
	            new kakao.maps.LatLng(37.4661264933406, 127.10709273262353),
	            new kakao.maps.LatLng(37.467027338946636, 127.10727488144632),
	            new kakao.maps.LatLng(37.468717429531274, 127.11139204078468),
	            new kakao.maps.LatLng(37.46709223559863, 127.11491647658518),
	            new kakao.maps.LatLng(37.46662265044207, 127.11600093475295),
	            new kakao.maps.LatLng(37.46608231079038, 127.11572880760406),
	            new kakao.maps.LatLng(37.467699934385564, 127.11993642208292),
	            new kakao.maps.LatLng(37.467950785915505, 127.12133853445515),
	            new kakao.maps.LatLng(37.46831053778405, 127.12197214999588),
	            new kakao.maps.LatLng(37.472025371644, 127.1193554865958),
	            new kakao.maps.LatLng(37.472637553868594, 127.11985387263668),
	            /* 상단 */
	            new kakao.maps.LatLng(37.47754269622166, 127.11619870099918),
	            new kakao.maps.LatLng(37.477003812813, 127.1144342101992),
	            new kakao.maps.LatLng(37.474337788252356, 127.11343529751537),
	            new kakao.maps.LatLng(37.47390504348403, 127.11370596405564),
	            new kakao.maps.LatLng(37.473042272109616, 127.11139845876691),
	            new kakao.maps.LatLng(37.47383693486574, 127.10950039592531),
	            new kakao.maps.LatLng(37.47391026492411, 127.10814389995058),
	            new kakao.maps.LatLng(37.47347876910085, 127.10705800211034),
	            new kakao.maps.LatLng(37.47542527459605, 127.1066990105167),
	            new kakao.maps.LatLng(37.475605965032294, 127.10615661394341),
	            new kakao.maps.LatLng(37.47459667300205, 127.10633606845357),
	            new kakao.maps.LatLng(37.47168028978451, 127.10307618641562),
	            new kakao.maps.LatLng(37.47132090588537, 127.10190001084945)
	        ]
	    }, {
	        name : '자곡동',
	        path : [
	            /* 하단 */
	            new kakao.maps.LatLng(37.46895359815481, 127.08774383954872),
	            new kakao.maps.LatLng(37.46963534384816, 127.09172377904852),
	            new kakao.maps.LatLng(37.46927486976101, 127.09181377322592),
	            new kakao.maps.LatLng(37.47035394203423, 127.09452817072861),
	            new kakao.maps.LatLng(37.47038635437867, 127.09895957359505),
	            new kakao.maps.LatLng(37.47089019692847, 127.09981938518565),
	            new kakao.maps.LatLng(37.470203927045674, 127.1015819695039),
	            new kakao.maps.LatLng(37.47132090588537, 127.10190001084945),
	            new kakao.maps.LatLng(37.47168028978451, 127.10307618641562),
	            new kakao.maps.LatLng(37.47459667300205, 127.10633606845357),
	            new kakao.maps.LatLng(37.475605965032294, 127.10615661394341),
	            new kakao.maps.LatLng(37.47542527459605, 127.1066990105167),
	            new kakao.maps.LatLng(37.47347876910085, 127.10705800211034),
	            new kakao.maps.LatLng(37.47391026492411, 127.10814389995058),
	            new kakao.maps.LatLng(37.47383693486574, 127.10950039592531),
	            new kakao.maps.LatLng(37.473042272109616, 127.11139845876691),
	            new kakao.maps.LatLng(37.47390504348403, 127.11370596405564),
	            new kakao.maps.LatLng(37.474337788252356, 127.11343529751537),
	            new kakao.maps.LatLng(37.477003812813, 127.1144342101992),
	            new kakao.maps.LatLng(37.47754269622166, 127.11619870099918),
	            new kakao.maps.LatLng(37.47754269622166, 127.11619870099918),
	            /* 상단 */
	            new kakao.maps.LatLng(37.48410621924388, 127.11186714613255),
	            new kakao.maps.LatLng(37.48363846363536, 127.11105238144677),
	            new kakao.maps.LatLng(37.4830981989625, 127.110689776737),
	            new kakao.maps.LatLng(37.48310050310369, 127.1082023701304),
	            new kakao.maps.LatLng(37.48277762033127, 127.10657378857422),
	            new kakao.maps.LatLng(37.48295871504644, 127.10557908364457),
	            new kakao.maps.LatLng(37.485519415790925, 127.10350224063647),
	            new kakao.maps.LatLng(37.48433189075607, 127.10142018887457),
	            new kakao.maps.LatLng(37.4831433726751, 127.10046884336147),
	            new kakao.maps.LatLng(37.48325206846511, 127.09979060293708),
	            new kakao.maps.LatLng(37.48195541608445, 127.09883915451552),
	            new kakao.maps.LatLng(37.48101889610737, 127.09820477951963),
	            new kakao.maps.LatLng(37.48022548135265, 127.09883687587437),
	            new kakao.maps.LatLng(37.47712540625895, 127.09955634562574),
	            new kakao.maps.LatLng(37.47640558440403, 127.09837962900386),
	            new kakao.maps.LatLng(37.476694880192554, 127.0972042419393),
	            new kakao.maps.LatLng(37.47619373595452, 127.09295277379913),
	            new kakao.maps.LatLng(37.47648269623894, 127.09213914190954),
	            new kakao.maps.LatLng(37.475547731856516, 127.08942472857989),
	            new kakao.maps.LatLng(37.475261696235414, 127.08634936519849),
	            new kakao.maps.LatLng(37.474830584633395, 127.084449601435),
	            new kakao.maps.LatLng(37.4735696226633, 127.08381510404638),
	            new kakao.maps.LatLng(37.47057710554859, 127.08543961419548)
	        ]
	    }, {
	        name : '수서동',
	        path : [
	            // 왼쪽면 
	            new kakao.maps.LatLng(37.474830584633395, 127.084449601435), // 왼쪽면 시작점
	            new kakao.maps.LatLng(37.47785676627732, 127.08612623861622),
	            new kakao.maps.LatLng(37.480019252155294, 127.08603827293494),
	            new kakao.maps.LatLng(37.4812438610986, 127.0870798411526),
	            new kakao.maps.LatLng(37.482252989916375, 127.08708101226782),
	            new kakao.maps.LatLng(37.48574952938993, 127.08622575294308),
	            new kakao.maps.LatLng(37.48589418371678, 127.08554750926267),
	            new kakao.maps.LatLng(37.48661495673595, 127.08559355891168),
	            new kakao.maps.LatLng(37.487587583957875, 127.08622786551086),
	            new kakao.maps.LatLng(37.48798105511281, 127.09020843335443),
	            new kakao.maps.LatLng(37.4877283227959, 127.0907960990806),
	            new kakao.maps.LatLng(37.48895267669189, 127.09210922692064),
	            new kakao.maps.LatLng(37.489565537277784, 127.09188383173817),
	            new kakao.maps.LatLng(37.491260960450674, 127.0898957637526),
	            new kakao.maps.LatLng(37.49233885619659, 127.09414878957344),
	            new kakao.maps.LatLng(37.49418059787424, 127.08940170749426), // 오른쪽면 일원1동글자 옆에 꼭지점
	            // 오른쪽 면
	            new kakao.maps.LatLng(37.49619418126904, 127.09537493474312),
	            new kakao.maps.LatLng(37.495398395394176, 127.09890210110127),
	            new kakao.maps.LatLng(37.49380985430063, 127.10215671730056),
	            new kakao.maps.LatLng(37.49121148947158, 127.10608823442867),
	            new kakao.maps.LatLng(37.48929942868194, 127.10821131087903),
	            new kakao.maps.LatLng(37.48410621924388, 127.11186714613255),
	            // 하단
	            new kakao.maps.LatLng(37.48363846363536, 127.11105238144677),
	            new kakao.maps.LatLng(37.4830981989625, 127.110689776737),
	            new kakao.maps.LatLng(37.48310050310369, 127.1082023701304),
	            new kakao.maps.LatLng(37.48277762033127, 127.10657378857422),
	            new kakao.maps.LatLng(37.48295871504644, 127.10557908364457),
	            new kakao.maps.LatLng(37.485519415790925, 127.10350224063647),
	            new kakao.maps.LatLng(37.48433189075607, 127.10142018887457),
	            new kakao.maps.LatLng(37.4831433726751, 127.10046884336147),
	            new kakao.maps.LatLng(37.48325206846511, 127.09979060293708),
	            new kakao.maps.LatLng(37.48195541608445, 127.09883915451552),
	            new kakao.maps.LatLng(37.48101889610737, 127.09820477951963),
	            new kakao.maps.LatLng(37.48022548135265, 127.09883687587437),
	            new kakao.maps.LatLng(37.47712540625895, 127.09955634562574),
	            new kakao.maps.LatLng(37.47640558440403, 127.09837962900386),
	            new kakao.maps.LatLng(37.476694880192554, 127.0972042419393),
	            new kakao.maps.LatLng(37.47619373595452, 127.09295277379913),
	            new kakao.maps.LatLng(37.47648269623894, 127.09213914190954),
	            new kakao.maps.LatLng(37.475547731856516, 127.08942472857989),
	            new kakao.maps.LatLng(37.475261696235414, 127.08634936519849),
	            new kakao.maps.LatLng(37.474830584633395, 127.084449601435)
	        ]
	    }, {
	        name : '일원동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.474830584633395, 127.084449601435), // 하단 오른쪽 시작점
	            new kakao.maps.LatLng(37.47411380249278, 127.07861538520316),
	            new kakao.maps.LatLng(37.474979606945716, 127.07735011099139),
	            new kakao.maps.LatLng(37.47425950505552, 127.07626408120123), // 개포동의 오른쪽 겹치는 시작점
	            new kakao.maps.LatLng(37.47498123754652, 127.07481775040773),
	            new kakao.maps.LatLng(37.47671196991724, 127.0735532654192),
	            new kakao.maps.LatLng(37.47743333658912, 127.07264952775778), // 하단 오른쪽 꼭지점
	            // 왼쪽 면
	            new kakao.maps.LatLng(37.47858696023222, 127.07210796941293 ),
	            new kakao.maps.LatLng(37.47909149746617, 127.07215367744756),
	            new kakao.maps.LatLng(37.48445839271223, 127.07708852325284),
	            new kakao.maps.LatLng(37.48622386332833, 127.07785920529243),
	            new kakao.maps.LatLng(37.48698097704385, 127.07745293916071),
	            new kakao.maps.LatLng(37.48600914798172, 127.07550715762103),
	            new kakao.maps.LatLng(37.49145293408051, 127.07279879618152), // 대모산입구연
	            new kakao.maps.LatLng(37.494186757941854, 127.08085280463516), // 대청역
	            new kakao.maps.LatLng(37.49465552820415, 127.08049144907541),
	            new kakao.maps.LatLng(37.49537660967225, 127.0800851255288),
	            new kakao.maps.LatLng(37.49635045721464, 127.078955324556),
	            new kakao.maps.LatLng(37.497252510495244, 127.07737307794665),
	            new kakao.maps.LatLng(37.499665457736, 127.07999923447166),
	            new kakao.maps.LatLng(37.501143411720534, 127.07954844600486), // 최 상단 꼭지점
	            // 오른쪽 면
	            new kakao.maps.LatLng(37.49872255019839, 127.08823101042648),
	            new kakao.maps.LatLng(37.49698879898645, 127.0932047125258),
	            new kakao.maps.LatLng(37.49619418126904, 127.09537493474312), // 수서 오른쪽과 겹치는 꼭지점
	            // 수서랑 겹치는 부분 나머지 오른쪽 면
	            new kakao.maps.LatLng(37.49418059787424, 127.08940170749426),
	            new kakao.maps.LatLng(37.49233885619659, 127.09414878957344),
	            new kakao.maps.LatLng(37.491260960450674, 127.0898957637526),
	            new kakao.maps.LatLng(37.489565537277784, 127.09188383173817),
	            new kakao.maps.LatLng(37.48895267669189, 127.09210922692064),
	            new kakao.maps.LatLng(37.4877283227959, 127.0907960990806),
	            new kakao.maps.LatLng(37.48798105511281, 127.09020843335443),
	            new kakao.maps.LatLng(37.487587583957875, 127.08622786551086),
	            new kakao.maps.LatLng(37.48661495673595, 127.08559355891168),
	            new kakao.maps.LatLng(37.48589418371678, 127.08554750926267),
	            new kakao.maps.LatLng(37.48574952938993, 127.08622575294308),
	            new kakao.maps.LatLng(37.482252989916375, 127.08708101226782),
	            new kakao.maps.LatLng(37.4812438610986, 127.0870798411526),
	            new kakao.maps.LatLng(37.480019252155294, 127.08603827293494),
	            new kakao.maps.LatLng(37.47785676627732, 127.08612623861622)
	        ]
	    }, {
	        name : '개포동',
	        path: [
	            // 개포동 오른쪽 면
	            new kakao.maps.LatLng(37.47425950505552, 127.07626408120123), // 일원동의 왼쪽 끝 겹치는 시작점
	            new kakao.maps.LatLng(37.47498123754652, 127.07481775040773),
	            new kakao.maps.LatLng(37.47671196991724, 127.0735532654192),
	            new kakao.maps.LatLng(37.47743333658912, 127.07264952775778), // 하단 오른쪽 꼭지점
	            // 왼쪽 면
	            new kakao.maps.LatLng(37.47858696023222, 127.07210796941293 ),
	            new kakao.maps.LatLng(37.47909149746617, 127.07215367744756),
	            new kakao.maps.LatLng(37.48445839271223, 127.07708852325284),
	            new kakao.maps.LatLng(37.48622386332833, 127.07785920529243),
	            new kakao.maps.LatLng(37.48698097704385, 127.07745293916071),
	            new kakao.maps.LatLng(37.48600914798172, 127.07550715762103),
	            new kakao.maps.LatLng(37.49145293408051, 127.07279879618152), // 대모산입구연
	            new kakao.maps.LatLng(37.494186757941854, 127.08085280463516), // 대청역
	            new kakao.maps.LatLng(37.49465552820415, 127.08049144907541),
	            new kakao.maps.LatLng(37.49537660967225, 127.0800851255288),
	            new kakao.maps.LatLng(37.49635045721464, 127.078955324556),
	            new kakao.maps.LatLng(37.497252510495244, 127.07737307794665), // 일원동의 최상단 겹치는 꼭지점
	            // 개포동 상단
	            new kakao.maps.LatLng(37.49638931985359, 127.07461293411458),
	            new kakao.maps.LatLng(37.49480391914404, 127.07402333171252),
	            new kakao.maps.LatLng(37.49487700872741, 127.07239502489317),
	            new kakao.maps.LatLng(37.49271576927487, 127.07044798665683),
	            new kakao.maps.LatLng(37.49127511831978, 127.06881833280349),
	            new kakao.maps.LatLng(37.48997999414057, 127.06470123305705),
	            new kakao.maps.LatLng(37.48886577384521, 127.05891094381461),
	            new kakao.maps.LatLng(37.487758754261435, 127.05641120206128), // 도곡역 아래 다리 : 대치동과 도곡동 분기
	            new kakao.maps.LatLng(37.48616514762383, 127.05388857066411),
	            new kakao.maps.LatLng(37.48083488876109, 127.04502078203515),
	            new kakao.maps.LatLng(37.4796459487974, 127.04397992655917), // 도곡 카이스트 캠퍼스 꼭지점
	            // 왼쪽 면
	            new kakao.maps.LatLng(37.47744711200644, 127.04497352738785),
	            new kakao.maps.LatLng(37.471425905484324, 127.05102921456339),
	            new kakao.maps.LatLng(37.47005706166782, 127.0494004434507),
	            new kakao.maps.LatLng(37.46919132168018, 127.0512085646414),
	            // 하단
	            new kakao.maps.LatLng(37.46746169260502, 127.05048392514101),
	            new kakao.maps.LatLng(37.46832530924256, 127.05355924493972),
	            new kakao.maps.LatLng(37.46818090037136, 127.05410174187391),
	            new kakao.maps.LatLng(37.46890129128726, 127.05500660298195),
	            new kakao.maps.LatLng(37.46846812384719, 127.05645322434152),
	            new kakao.maps.LatLng(37.469041958832975, 127.06206058629503),
	            new kakao.maps.LatLng(37.469473965350026, 127.06296529224643),
	            new kakao.maps.LatLng(37.4691849606484, 127.06423113329078),
	            new kakao.maps.LatLng(37.471200783862265, 127.06857383219958),
	            new kakao.maps.LatLng(37.47134398953104, 127.07020183137037),
	            new kakao.maps.LatLng(37.47292744881429, 127.07400175186906),
	            new kakao.maps.LatLng(37.47307115500186, 127.07472540722068)
	        ]
	    }, {
	        name : '대치동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.501143411720534, 127.07954844600486),
	            new kakao.maps.LatLng(37.499665457736, 127.07999923447166),
		        new kakao.maps.LatLng(37.497252510495244, 127.07737307794665),
	            new kakao.maps.LatLng(37.49638931985359, 127.07461293411458),
	            new kakao.maps.LatLng(37.49480391914404, 127.07402333171252),
	            new kakao.maps.LatLng(37.49487700872741, 127.07239502489317),
	            new kakao.maps.LatLng(37.49271576927487, 127.07044798665683),
	            new kakao.maps.LatLng(37.49127511831978, 127.06881833280349),
	            new kakao.maps.LatLng(37.48997999414057, 127.06470123305705),
	            new kakao.maps.LatLng(37.48886577384521, 127.05891094381461),
	            new kakao.maps.LatLng(37.487758754261435, 127.05641120206128), // 도곡역 아래 다리 : 대치동과 도곡동 분기
	            // 왼쪽면
	            new kakao.maps.LatLng(37.49627940936705, 127.05288373565557), // 한티역 : 상하로 도곡동 역삼동 분기
	            // 상단
	            new kakao.maps.LatLng(37.50449375634194, 127.04899335864857), // 선릉역
	            new kakao.maps.LatLng(37.508892929125835, 127.06319066295339), // 삼성역
	            new kakao.maps.LatLng(37.509846199633046, 127.06646018531795),
	            new kakao.maps.LatLng(37.510277261898324, 127.06893756929344), // 삼성교 중앙
	            // 오른쪽면
	            new kakao.maps.LatLng(37.50299685446952, 127.06942848897296), // 대치동 주민센터 우측
	            new kakao.maps.LatLng(37.50219937680684, 127.07684664572156)
	        ]
	    }, {
	        name : '도곡동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.487758754261435, 127.05641120206128), // 도곡역 아래 다리 : 대치동과 도곡동 분기
	            new kakao.maps.LatLng(37.48616514762383, 127.05388857066411),
	            new kakao.maps.LatLng(37.48083488876109, 127.04502078203515),
	            new kakao.maps.LatLng(37.4796459487974, 127.04397992655917), // 도곡 카이스트 캠퍼스 꼭지점
	            // 오른쪽 면
	            new kakao.maps.LatLng(37.485548482215854, 127.04141674674507), // 양천전화국 교차로
	            new kakao.maps.LatLng(37.484573231109025, 127.0340838550619), // 양재역
	            // 상단
	            new kakao.maps.LatLng(37.489570002596636, 127.03163242185803), // 좌측 상단 꼭지점 : 뱅뱅사거리
	            new kakao.maps.LatLng(37.48984894858141, 127.03297247007515), // 뚜레쥬르 앞
	            new kakao.maps.LatLng(37.48946139782917, 127.03339067251714), 
	            new kakao.maps.LatLng(37.49008252733799, 127.03533583319961), // 싸리고개 근린공원 상단 삼거리
	            new kakao.maps.LatLng(37.490623210974555, 127.03507036052667),
	            new kakao.maps.LatLng(37.49627940936705, 127.05288373565557) // 한티역 : 상하로 도곡동 역삼동 분기
	        ]
	    }, {
	        name : '역삼동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.489570002596636, 127.03163242185803), // 좌측 상단 꼭지점 : 뱅뱅사거리
	            new kakao.maps.LatLng(37.48984894858141, 127.03297247007515), // 뚜레쥬르 앞
	            new kakao.maps.LatLng(37.48946139782917, 127.03339067251714), 
	            new kakao.maps.LatLng(37.49008252733799, 127.03533583319961), // 싸리고개 근린공원 상단 삼거리
	            new kakao.maps.LatLng(37.490623210974555, 127.03507036052667),
	            new kakao.maps.LatLng(37.49627940936705, 127.05288373565557), // 한티역 : 상하로 도곡동 역삼동 분기
	            // 오른쪽면 : 선릉역 ~ 선정릉역
	            new kakao.maps.LatLng(37.50449375634194, 127.04899335864857), // 선릉역
	            new kakao.maps.LatLng(37.506073077134765, 127.04824228390382),
	            new kakao.maps.LatLng(37.506514725927495, 127.04785803001607),
	            new kakao.maps.LatLng(37.50687984476888, 127.04733234815382),
	            new kakao.maps.LatLng(37.508187132264126, 127.04521251178606),
	            new kakao.maps.LatLng(37.508439538632416, 127.04488466722496),
	            new kakao.maps.LatLng(37.50872796505292, 127.04460773811678),
	            new kakao.maps.LatLng(37.50915154784723, 127.04431392129493),
	            new kakao.maps.LatLng(37.5092641967239, 127.0442517809153),
	            // 상단
	            new kakao.maps.LatLng(37.510300451016185, 127.0439865955597), // 선정릉역
	            new kakao.maps.LatLng(37.50453516518507, 127.02449103861625) // 신논현역 : 교보타워사거리
	        ]
	    }, {
	        name : '삼성동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.510277261898324, 127.06893756929344), // 삼성교 중앙
	            new kakao.maps.LatLng(37.509846199633046, 127.06646018531795),
	            new kakao.maps.LatLng(37.508892929125835, 127.06319066295339), // 삼성역
	            new kakao.maps.LatLng(37.50449375634194, 127.04899335864857), // 선릉역
	            // 왼쪽면
	            new kakao.maps.LatLng(37.506073077134765, 127.04824228390382),
	            new kakao.maps.LatLng(37.506514725927495, 127.04785803001607),
	            new kakao.maps.LatLng(37.50687984476888, 127.04733234815382),
	            new kakao.maps.LatLng(37.508187132264126, 127.04521251178606),
	            new kakao.maps.LatLng(37.508439538632416, 127.04488466722496),
	            new kakao.maps.LatLng(37.50872796505292, 127.04460773811678),
	            new kakao.maps.LatLng(37.50915154784723, 127.04431392129493),
	            new kakao.maps.LatLng(37.5092641967239, 127.0442517809153),
	            // 삼성동, 논현동 교차점
	            new kakao.maps.LatLng(37.510300451016185, 127.0439865955597), // 선정릉역
	            new kakao.maps.LatLng(37.51720762668314, 127.04127021989746), // 강남구청역 : 삼성동, 청담동 교차점
	            // 상단
	            new kakao.maps.LatLng(37.52006624260626, 127.05706333069203), // 경기고앞 사거리
	            new kakao.maps.LatLng(37.521649798926816, 127.06146499314374), // 청담 배수지공원 상단
	            new kakao.maps.LatLng(37.52179356243109, 127.06222303175903),
	            new kakao.maps.LatLng(37.52180238718551, 127.06257371884618),
	            new kakao.maps.LatLng(37.52218065192843, 127.06286815474157),
	            new kakao.maps.LatLng(37.521946264666305, 127.06310551578609),
	            new kakao.maps.LatLng(37.521837761469186, 127.0638180965015),
	            new kakao.maps.LatLng(37.52522450544953, 127.06568758790111), // 청담대교 좌측 한강의 왼쪽 꼭지점
	            new kakao.maps.LatLng(37.524953544728355, 127.06686387381251),
	            // 오른쪽면 시작
	            new kakao.maps.LatLng(37.524358250744676, 127.06797198084259), // 오른쪽면 최상단 오른쪽 꼭지점
	            new kakao.maps.LatLng(37.52006063964031, 127.0676739705334) // 헬기장 좌측
	        ]
	    }, {
	        name : '논현동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.50453516518507, 127.02449103861625), // 신논현역 : 교보타워사거리
	            // 오른쪽면
	            new kakao.maps.LatLng(37.510300451016185, 127.0439865955597), // 선정릉역
	            new kakao.maps.LatLng(37.51720762668314, 127.04127021989746), // 강남구청역 : 삼성동, 청담동 교차점
	            new kakao.maps.LatLng(37.523218016904124, 127.03921466176904), // 오른쪽 상단 꼭지점 : 논현동, 청담동 교차점
	            // 상단
	            new kakao.maps.LatLng(37.51972528420103, 127.02813844659454), // 강남을지병원앞 교차로
	            new kakao.maps.LatLng(37.51612300051029, 127.01957436841067), // 신사역 : 신사역 교차로
	            // 왼쪽면
	            new kakao.maps.LatLng(37.51109508654405, 127.02137144639735) //논현역
	        ]
	    }, {
	        name : '청담동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.52522450544953, 127.06568758790111), // 하단 우측 꼭지점
	            new kakao.maps.LatLng(37.521837761469186, 127.0638180965015),
	            new kakao.maps.LatLng(37.521946264666305, 127.06310551578609),
	            new kakao.maps.LatLng(37.52218065192843, 127.06286815474157),
	            new kakao.maps.LatLng(37.52180238718551, 127.06257371884618),
	            new kakao.maps.LatLng(37.52179356243109, 127.06222303175903),
	            new kakao.maps.LatLng(37.521649798926816, 127.06146499314374), // 청담 배수지공원 상단
	            new kakao.maps.LatLng(37.52006624260626, 127.05706333069203), // 경기고앞 사거리
	            new kakao.maps.LatLng(37.51720762668314, 127.04127021989746), // 강남구청 : 삼성동, 청담동 교차점
	            // 왼쪽면
	            new kakao.maps.LatLng(37.51720762668314, 127.04127021989746), // 강남구청역 : 삼성동, 청담동 교차점
	            new kakao.maps.LatLng(37.523218016904124, 127.03921466176904), // 왼쪽 꼭지점 : 논현동, 청담동 교차점
	            new kakao.maps.LatLng(37.527767575665344, 127.04069906619456), // 압구정로데오역
	            new kakao.maps.LatLng(37.52703215879512, 127.04377581377486), // 청담고등학교 아래 사거리
	            new kakao.maps.LatLng(37.53026628408613, 127.045027848799), // 올림픽대로 : 압구정로 61길 통과
	            new kakao.maps.LatLng(37.53017608012779, 127.04529931894841),
	            new kakao.maps.LatLng(37.53385173346173, 127.0464103209946), // 한강 : 수상콜택시
	            // 오른쪽면
	            new kakao.maps.LatLng(37.529090819652914, 127.05486975799543), // 영동대교 좌측
	            new kakao.maps.LatLng(37.527520464218476, 127.0602310237649) // 영동대교, 청담대교 사이
	        ]
	    }, {
	        name : '신사동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.527767575665344, 127.04069906619456), // 압구정로데오역
	            new kakao.maps.LatLng(37.523218016904124, 127.03921466176904), // 왼쪽 꼭지점 : 논현동, 청담동 교차점
	            new kakao.maps.LatLng(37.523218016904124, 127.03921466176904), // 오른쪽 상단 꼭지점 : 논현동, 청담동 교차점
	            new kakao.maps.LatLng(37.51972528420103, 127.02813844659454), // 강남을지병원앞 교차로
	            new kakao.maps.LatLng(37.51612300051029, 127.01957436841067), // 신사역 : 신사역 교차로
	            // 왼쪽면
	            new kakao.maps.LatLng(37.52173202886505, 127.0177828434141), // 한남IC
	            // 상단
	            new kakao.maps.LatLng(37.52713596829268, 127.02839577373054), // 압구정역 사거리
	            new kakao.maps.LatLng(37.52831571197917, 127.03067018119644),
	            new kakao.maps.LatLng(37.52854084102315, 127.031134117406),
	            new kakao.maps.LatLng(37.52861286729371, 127.03133778638205),
	            new kakao.maps.LatLng(37.528792916161684, 127.03190352706422),
	            new kakao.maps.LatLng(37.52898193804895, 127.03259372104763),
	            new kakao.maps.LatLng(37.529152781573174, 127.03382695178657), // 성수대교 남단 교차로
	            new kakao.maps.LatLng(37.52911630771962, 127.03530898494196), // 압구정 파출소
	            new kakao.maps.LatLng(37.528962880737005, 127.03615741257504),
	            new kakao.maps.LatLng(37.528782449471436, 127.03690400364134)
	        ]
	    }, {
	        name : '압구정동',
	        path : [
	            // 하단
	            new kakao.maps.LatLng(37.52173202886505, 127.0177828434141), // 한남IC        
	            new kakao.maps.LatLng(37.52713596829268, 127.02839577373054), // 압구정역 사거리
	            new kakao.maps.LatLng(37.52831571197917, 127.03067018119644),
	            new kakao.maps.LatLng(37.52854084102315, 127.031134117406),
	            new kakao.maps.LatLng(37.52861286729371, 127.03133778638205),
	            new kakao.maps.LatLng(37.528792916161684, 127.03190352706422),
	            new kakao.maps.LatLng(37.52898193804895, 127.03259372104763),
	            new kakao.maps.LatLng(37.529152781573174, 127.03382695178657), // 성수대교 남단 교차로
	            new kakao.maps.LatLng(37.52911630771962, 127.03530898494196), // 압구정 파출소
	            new kakao.maps.LatLng(37.528962880737005, 127.03615741257504),
	            new kakao.maps.LatLng(37.528782449471436, 127.03690400364134),
	            new kakao.maps.LatLng(37.527767575665344, 127.04069906619456), // 압구정로데오역
	            new kakao.maps.LatLng(37.52703215879512, 127.04377581377486), // 청담고등학교 아래 사거리
	            new kakao.maps.LatLng(37.53026628408613, 127.045027848799), // 올림픽대로 : 압구정로 61길 통과
	            new kakao.maps.LatLng(37.53017608012779, 127.04529931894841),
	            new kakao.maps.LatLng(37.53385173346173, 127.0464103209946), // 한강 : 수상콜택시
	            // 상단
	            new kakao.maps.LatLng(37.534131308486764, 127.04573164746076),
	            new kakao.maps.LatLng(37.53596263449499, 127.03936276428207), // 분당선 좌측(한강중앙)
	            new kakao.maps.LatLng(37.53614750954211, 127.02110139053961), // 동호대교
	            new kakao.maps.LatLng(37.53432806614954, 127.01757086510784),
	            new kakao.maps.LatLng(37.53180549747476, 127.01591846398836),
	            new kakao.maps.LatLng(37.53157130615301, 127.01539798276646),
	            new kakao.maps.LatLng(37.52964351238612, 127.01243346623737), // 한남대교 우측
	            // 왼쪽면
	            new kakao.maps.LatLng(37.526057022930004, 127.01652813872997), // 한남대교(강남) 전망대 상단 축구장
	            new kakao.maps.LatLng(37.524363270870545, 127.01555487814535), // 한남대교 전망대
	            new kakao.maps.LatLng(37.52266915711707, 127.01720613431259) 
	        ]
	    }
	]; 
	
	// 커스텀 오버레이를 지도에 표시합니다
	customOverlay.setMap(map);
	
	// 지도 움직임 제어
	window.onload = function setMapSetting() {
	    // 지도 확대 축소 막기 : map.setZoomable false
	    map.setZoomable(false);     
	    // 지도 이동 막기 : map.setDraggable false
	    map.setDraggable(false); 
	    // 키보드로 지도를 조작할 수 없도록 설정한다
	    map.setKeyboardShortcuts(false);
	    // 지도 확대 최소 레벨 설정
	    map.setMinLevel(7);
	    // 마우스 커서 설정
	    map.setCursor('move');
	    
        /* 광고 팝업창 열기 */
        if(getCookie("<%=hostAddress %>") != 'done') {
            window.open('home/advertisPopUp.do', 'notice1', 'width=300, height=401, left=10, top=10');
        }
	}
	
	// 지도에 영역데이터를 폴리곤으로 표시합니다 
	for (var i = 0, len = areas.length; i < len; i++) {
	    displayArea(areas[i]);
	}
	
	// 다각형을 생상하고 이벤트를 등록하는 함수입니다
	function displayArea(area) {
	    // 다각형을 생성합니다 
	    var polygon = new kakao.maps.Polygon({
	        map: map, // 다각형을 표시할 지도 객체
	        path: area.path,
	        strokeWeight: 2,
	        strokeColor: 'black',
	        strokeOpacity: 0.4,
	        fillColor: 'rgba(47, 33, 33, 0.8)',
	        fillOpacity: 0.7
	    });
	
	    // 마우스로 각 동을 클릭했을 때 생성되는 tooltip
	    var ifClickSetTooltip = new kakao.maps.CustomOverlay({
	        zIndex: 3
	    });
	
	    // click event가 발생하면 사용할 polygon과 ifClickSetTooltip을 생성 + 초기화
	    area.polygon = polygon;
	    area.ifClickSetTooltip = ifClickSetTooltip;
	
	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	        if(area.selected == true) return;
	        polygon.setOptions({fillColor: 'rgb(27, 14, 14)'});
	        customOverlay.setContent('<div class="area">' + area.name + '</div>');
	        customOverlay.setPosition(mouseEvent.latLng); 
	        customOverlay.setMap(map);
	    });
	
	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
	    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
	        customOverlay.setPosition(mouseEvent.latLng); 
	    });
	
	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
	    // 커스텀 오버레이를 지도에서 제거합니다 
	    kakao.maps.event.addListener(polygon, 'mouseout', function() {
	        if(area.selected == true) return;
	        customOverlay.setMap(null);
	        polygon.setOptions({fillColor: 'rgba(47, 33, 33, 0.8)'});
	    }); 
	
	 // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당 동 이름을 customOverlay로 띄웁니다
	    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
	        /* for of문은 IE가 인식을 못해서 결국 이렇게 바꿈 */
	        for(let i = 0; i < areas.length; i++) {
	            areas[i].selected = false;
	            areas[i].polygon.setOptions({fillColor: 'rgba(47, 33, 33, 0.8)'});
	            customOverlay.setMap(null);
	            areas[i].ifClickSetTooltip.setMap(null);
	        }
	        area.selected = true;
	        polygon.setOptions({fillColor: '#f1c40f;'});
	
	        // 동을 선택했을 때 나타나는 Tooltip
	        var content = '<div class ="main-label"><span class="main-center">' + area.name + '</span></div>';
	        ifClickSetTooltip.setContent(content);
	        ifClickSetTooltip.setPosition(mouseEvent.latLng); 
	        ifClickSetTooltip.setMap(map);
	
	        // 데이터가 없는 세 개의 동 처리
	        if(area.name == '세곡동' || area.name == '율현동' || area.name == '자곡동') {
	            alert(area.name + '에 해당하는 데이터가 없습니다.');
	            
	            for(let i = 0; i < areas.length; i++) {
	                areas[i].selected = false;
	                areas[i].polygon.setOptions({fillColor: 'rgba(47, 33, 33, 0.8)'});
	                customOverlay.setMap(null);
	                areas[i].ifClickSetTooltip.setMap(null);
	            }
	        } else {
	            document.getElementById('setDongname').value = area.name;
	        }
	
	        // 필요 없어서 제거 : infowindow 사용할 때를 대비해서 주석처리
	        /* var content = '<div class="info" style="border: 0px solid black; width: 150px; text-align: center;"><div class="title">' + area.name + '</div></div>'; */
	        /* infowindow.setContent(content); 
	        infowindow.setPosition(mouseEvent.latLng); 
	        infowindow.setMap(map); */
	        
	    });
	
	}
</script>
</body>
</html>