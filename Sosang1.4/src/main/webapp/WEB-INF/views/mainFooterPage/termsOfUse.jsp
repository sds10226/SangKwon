<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>이용약관</title>
        <!-- link : bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- link : font-awesome 아이콘 링크 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <!-- script : jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- script : bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    
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
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')format('woff'); 
            font-weight: normal; 
            font-style: normal; 
        }
    
         /*
        ---------------------------------------------------------------------
        Module(top, foter)
        ---------------------------------------------------------------------
        */
    
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
    
            position: fixed;
            top: 0px;
        }
        .navbar-brand {
            font-weight: bold;
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
    
    
    
        /* pre태크 안 내용 정리 */
        #inputTxtContent {
            /* 줄바꿈 정렬 설정 */
            white-space: pre-wrap; /* CSS3*/
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-all; /* Internet Explorer 5.5+ */ 
    
            font-family: 'KBIZHanmaumGothic';
            border: none;
            background-color: #fff;
            margin: 0 auto;
            width: 1200px;
            font-size: 110%;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#inputTxtContent').load('../resources/txtfiles/termsOfUse.txt', function(txt, status) {
                if(status == 'success') {
                } else if(status == 'error') {
                    alert(status);
                }
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
    
        });
    </script>
    
    <body>
    
        <!-- top -->
  		<jsp:include page="module/top.jsp"></jsp:include>
    
        <!-- left benner -->
		<jsp:include page="module/leftBenner.jsp"></jsp:include>
        
        <br><br><br><br><br><br>
    
    
        <div style="width: 100%; text-align: center;">
            <h1>서비스 이용약관</h1>
        </div>
    
    
        <br><br><br>
    
        <div>
            <pre id="inputTxtContent"></pre>
        </div>
    
    	<!-- top 버튼 -->
    	<a href="" id="top-btn">TOP</a>
    
        <br><br><br>
    
        <!-- footer -->
    	<jsp:include page="module/footer.jsp"></jsp:include>
    </body>
    </html>