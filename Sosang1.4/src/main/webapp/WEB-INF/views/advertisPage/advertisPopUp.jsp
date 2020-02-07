<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	InetAddress ip = InetAddress.getLocalHost();
	String hostAddress = ip.getHostAddress();
%>  
    
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>광고</title>
    <style> 
        /* css initialize */
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
        }

        table {
            border-collapse: collapse;
        }

        a {
            color: #fff;
            font-weight: bold;
        }
        a:visited {
            color: #fff;
            font-weight: bold;
        }
        a:link {
            color: #fff;
            font-weight: bold;
        }

        #popUpForm {
            width: 300px;
            height: 400px;
        }
        #popUpTable {
            width: 100%;
            height: 100%;
            background-color: rgb(47, 33, 33);
        }
        #popUpImgBox {
            border: 1px solid #000;
            background-color: #fff;
            height: 320px;
        }
        #popUpImg {
            width: 280px;
            height: 320px;
            animation: horizontal 0.5s ease-in-out infinite;
        }
        @keyframes horizontal {
            0% {
                margin-left: 9px;
            }
            50% {
                margin-left: 14px;
            }
            100% {
                margin-left: 9px;
            }
        }
        
        #innerPopUpTable {
            width: 100%;
            color: #fff;
            margin-bottom: 10px;
        }
        #innerPopUpTable td:nth-child(1) {
            padding-left: 15px;
            width: 250px;
        }
        #innerPopUpTable td:nth-child(2) {
            padding-right: 15px;
            width: 70px;
            height: 30px;
            color: #fff;
        }
        #closeBtn {
            border: 1px solid #f1c40f; 
            border-radius: 10px;
            text-align: center; 
            height: 30px; 
            line-height: 27px;
            background-color: #f1c40f;
            
        }
    </style>

    <script>
        // 쿠키 생성
        function setCookie(name, value, expiredays) {
            var today = new Date();
            today.setDate(today.getDate() + expiredays);
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
        }    

        // 체크 후 닫기버튼 누르면 창 닫기
        function closePopUp() {
            if(document.pop.Notice1.checked) {
                setCookie("<%=hostAddress %>", "done", 1);
                self.close();
            } else {
                self.close();
            }
        }
    </script>
</head>
<body>

    <form name="pop" id="popUpForm">
        <table id="popUpTable">
            <tr id="popUpImgBox"> 
                <td  valign="top">
                    <img id="popUpImg" src="../resources/advertisImg/bonobono.jpg" alt="">
                </td>
            </tr>

            <tr>
                <td valign="bottom">
                    <table id="innerPopUpTable">
                        <tr>
                            <td>
                                <input type="checkbox" name="Notice1" value="">
                                <span class=""> 
                                    <font>오늘 하루 이창을 열지않음</font>
                                </span>
                            </td>
                            <td>
                                <a href="javascript:history.onclick=closePopUp()">
                                    <div id="closeBtn">닫기</div>
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>