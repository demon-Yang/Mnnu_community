<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>评论我的</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="personfmsg">
    <div class="main">
        <div class="header">
   			   <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left">
               <jsp:include page="personleft.jsp"></jsp:include>
            </div>
            <div class="right">
                <div class="private">
                    <p>>><span class="nav">评论我的</span></p>
                     <p align="right">
                    	<a href="personfmsg.jsp">评论我的</a>
                    	<a href="personrmsg.jsp">回复我的</a>
                    </p>
                    <div class="lists">
                        <ul>
                           <li>
                                <p class="title"><span><span class="to">陈法拉</span>&nbsp;回复&nbsp;我:&nbsp;</span>本人有大量tvb经典古装配乐要的留邮箱。一周之内发送。</p>
                                <p class="source"><span>来自:&nbsp;</span>tvb配乐吧</p>
                                <p class="function" align="right"><span>2017-10-10 01:24</span>&nbsp;&nbsp;<a>查看</a><a>未读</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
           <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>