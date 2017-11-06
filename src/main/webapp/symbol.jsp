<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校标释义</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .left{
            float: left;
            background-color: #ADADAD;
        }
        .right{
            background-color: #f4f4f4;
        }
        .right img{
            margin-left: 45px;
        }
    </style>
</head>
<body>
<div class="symbol">
    <div class="main">
        <div class="header">
          	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left"><img border="0" src="images/menu.jpg"><div style="height: 1230px;"></div></div>
            <div class="right">
                <img src="images/symbol1.png">
                <img src="images/symbol2.png">
                <img src="images/symbol4.png">
            </div>
        </div>
        <div class="footer">
           <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>