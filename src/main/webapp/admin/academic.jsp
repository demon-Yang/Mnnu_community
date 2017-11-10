<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学术报告</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="academic">
        <div class="main">
            <div class="header">
                <jsp:include page="header.jsp"></jsp:include>
            </div>
            <div class="container">
                <div class="left">
                    <jsp:include page="left.jsp"></jsp:include>
                </div>
                <div class="right">
                    <div class="private">
                        <p>>><span class="nav">学术报告</span></p>
                        <p align="right">
                            <a>发表学术报告</a>
                        </p>
                        <hr>
                        <div class="lists">
                            <ul>
                            	<c:forEach items="${nlist }" var="list">
                                <li>
                                    <p class="title">${list.ntitle }</p>
                                    <p class="function" align="right"><span>${list.ndate }</span>&nbsp;&nbsp;<a href="/Mnnu_community/news/findOne.do?nid=${list.nid }">查看</a>&nbsp;&nbsp;<a>删除</a></p>
                                    <hr/>
                                </li>
                                </c:forEach>
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