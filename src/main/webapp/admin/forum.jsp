<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>论坛帖子</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="forum">
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
                    <p>>><span class="nav">论坛帖子</span></p>
                    <p align="right">
                        <a>学习技术类</a>
                        <a>生活兴趣类</a>
                    </p>
                    <div class="lists">
                        <ul>
                           <c:forEach items="${forumpage.list }" var="list">
	                            <li>
	                                <p class="title">${list.ftitle }</p>
	                                <p class="function" align="right"><span>${list.ftype }</span>&nbsp;&nbsp;<span>${list.fdate }</span>&nbsp;&nbsp;<a target="_blank">查看</a><a>删除</a></p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                     <div class="pagenav">
                       <p align="right">
						<span class="pgTotal">第${forumpage.pageNum }页/共${forumpage.pages }页 </span>
						<a href="/Mnnu_community/forum/queryAll.do?pageNum=1">首页</a>
						<c:if test="${forumpage.pageNum > 1 }">	
							<a href="/Mnnu_community/forum/queryAll.do?pageNum=${forumpage.pageNum-1 }">上一页</a>
						</c:if>
						<%-- 计算begin、end --%>
						<c:choose>
							<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
							<c:when test="${forumpage.pages <= 5 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="${forumpage.pages }" />
							</c:when>
							<c:otherwise>
								<%-- 当总页数>5时，通过公式计算出begin和end --%>
								<c:set var="begin" value="${forumpage.pageNum-2 }" />
								<c:set var="end" value="${forumpage.pageNum+2 }" />	
								<%-- 头溢出 --%>
								<c:if test="${begin < 1 }">
									<c:set var="begin" value="1" />
									<c:set var="end" value="5" />
								</c:if>	
								<%-- 尾溢出 --%>
								<c:if test="${end > forumpage.pages }">
									<c:set var="begin" value="${forumpage.pages - 4 }" />
									<c:set var="end" value="${forumpage.pages }" />
								</c:if>	
							</c:otherwise>
						</c:choose>
						<%-- 循环遍历页码列表 --%>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<c:choose>
								<c:when test="${i eq forumpage.pageNum }">
									<span class="pgCurrent">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="/Mnnu_community/forum/queryAll.do?pageNum=${i}">${i }</a>	
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:if test="${forumpage.pageNum < forumpage.pages }">
							<a href="/Mnnu_community/forum/queryAll.do?pageNum=${forumpage.pageNum+1}">下一页</a>
						</c:if>
						<a href="/Mnnu_community/forum/queryAll.do?pageNum=${forumpage.pages}">尾页</a>
						</p>
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