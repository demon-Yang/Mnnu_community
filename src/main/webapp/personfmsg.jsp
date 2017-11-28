<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    	<a href="comment/queryByPuid.do">评论我的</a>
                    	<a href="reply/queryByPuid.do">回复我的</a>
                    </p>
                    <div class="lists">
                        <ul>
                        	<c:forEach items="${pfmpage.list }" var="list">
	                           <li>
	                                <p class="title"><span><span class="to">${list.uname }</span>&nbsp;回复&nbsp;我&nbsp;:&nbsp;</span>${list.comment.ccontent }</p>
	                                <p class="source"><span>来&nbsp;自&nbsp;:&nbsp;</span><span class="ftitle">${list.ftitle }</span></p>
	                                <p class="function" align="right"><span>${list.comment.cdate }</span>&nbsp;&nbsp;
	                                	<a href="forum/queryOne.do?fid=${list.comment.fid }&cid=${list.comment.cid}" target="_blank">查看</a>
	                                	<c:if test="${list.comment.cread == 'no' }">
	                                		<a style="background-color: #dc4141;" href="comment/changeRead.do?cid=${list.comment.cid }">未读</a>
	                                	</c:if>
	                                	<c:if test="${list.comment.cread != 'no' }">
	                                		<a>已读</a>
	                                	</c:if>
	                                </p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                     <div class="pagenav">
                       <p align="right">
						<span class="pgTotal">第${pfmpage.pageNum }页/共${pfmpage.pages }页 </span>
						<a href="comment/queryByPuid.do?pageNum=1">首页</a>
						<c:if test="${pfmpage.pageNum > 1 }">	
							<a href="comment/queryByPuid.do?pageNum=${pfmpage.pageNum-1 }">上一页</a>
						</c:if>
						<%-- 计算begin、end --%>
						<c:choose>
							<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
							<c:when test="${pfmpage.pages <= 5 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="${pfmpage.pages }" />
							</c:when>
							<c:otherwise>
								<%-- 当总页数>5时，通过公式计算出begin和end --%>
								<c:set var="begin" value="${pfmpage.pageNum-2 }" />
								<c:set var="end" value="${pfmpage.pageNum+2 }" />	
								<%-- 头溢出 --%>
								<c:if test="${begin < 1 }">
									<c:set var="begin" value="1" />
									<c:set var="end" value="5" />
								</c:if>	
								<%-- 尾溢出 --%>
								<c:if test="${end > pfmpage.pages }">
									<c:set var="begin" value="${pfmpage.pages - 4 }" />
									<c:set var="end" value="${pfmpage.pages }" />
								</c:if>	
							</c:otherwise>
						</c:choose>
						<%-- 循环遍历页码列表 --%>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<c:choose>
								<c:when test="${i eq pfmpage.pageNum }">
									<span class="pgCurrent">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="comment/queryByPuid.do?pageNum=${i}">${i }</a>	
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:if test="${pfmpage.pageNum < pfmpage.pages }">
							<a href="comment/queryByPuid.do?pageNum=${pfmpage.pageNum+1}">下一页</a>
						</c:if>
						<a href="comment/queryByPuid.do?pageNum=${pfmpage.pages}">尾页</a>
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