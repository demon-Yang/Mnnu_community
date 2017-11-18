<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻热点</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">
        $(function(){
        	/*请求数据*/
        	$.ajax({
        		type:"get",
        		url:"admin/news/newslist.do",
        		async:false,
        		success:function(data){}
        	});
        })
     </script>
</head>
<body>
<div class="news">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div style="padding: 5px 20px; height: 15px;"></div>
            <div class="left">
                <span><a href="admin/news/queryList.do?ntype=闽师新闻">闽师新闻</a></span>
                <ul>
                	<c:forEach items="${newsMnewList }" var="mnewList">
                    	<li><a href="admin/news/findOne.do?nid=${mnewList.nid }">${mnewList.ntitle }</a></li>
                    </c:forEach>
                </ul>
                <img src="images/newsline1.gif">
                <span><a href="admin/news/queryList.do?ntype=热点聚焦">热点聚焦</a></span>
                <ul>
                    <c:forEach items="${newsHnewList }" var="hnewList">
                    	<li><a href="admin/news/findOne.do?nid=${hnewList.nid }">${hnewList.ntitle }</a></li>
                    </c:forEach>
                </ul>
                <img src="images/newsline2.gif">
                <span><a href="admin/news/queryList.do?ntype=学术报告">学术报告</a></span>
                <ul>
                   <c:forEach items="${newsAcadList }" var="acadList">
                    	<li><a href="admin/news/findOne.do?nid=${acadList.nid }">${acadList.ntitle }</a></li>
                    </c:forEach>
                </ul>
                <img src="images/newsline1.gif">
                <span><a href="admin/news/queryList.do?ntype=通知公告">通知公告</a></span>
                <ul>
                   <c:forEach items="${newsNoticeList }" var="noticeList">
                    	<li><a href="admin/news/findOne.do?nid=${noticeList.nid }">${noticeList.ntitle }</a></li>
                    </c:forEach>
                </ul>
                <img src="images/newsline3.gif">
            </div>
            <div class="right">
                <p class="loca"><a href="#">首页</a>» ${news.ntype } </p>
                <div class="cont">
                    <h1 align="center">${news.ntitle }</h1>
                    <hr size="1" noshade="noshade">
                    <p align="center" style="font-size:12px;color:#666666">稿件来源：闽南师大社区 | 发布日期：${news.ndate } </p>
                    <div class="article">
           				${news.ncontent }
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