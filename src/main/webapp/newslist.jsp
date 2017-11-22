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
<div class="newslist">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div style="padding: 5px 20px; height: 5px;"></div>
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
                <p class="loca"><a href="#">首页</a>» ${nlistType } </p>
                <div class="serach" align="right">
                	<form action="admin/news/queryList.do">
                		<input type="hidden" name="ntype" value="${nlistType }"/>
                		<span>文章标题：</span><input type="text" name="ntitle" value="${sntitle }"/>&nbsp;&nbsp;
                		<span>日期：</span><input type="date" name="ndate" value="${sndate }"/>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="submit" value="搜索"/>
                	</form>
                </div>
                <hr/>
                <div class="cont">
                	<ul>
                		<c:forEach items="${newsList }" var="list" varStatus="status">
	                		<li>
	                			<span class="title"><span>${status.index+1 }</span><a href="admin/news/findOne.do?nid=${list.nid }">${list.ntitle }</a></span>&nbsp;&nbsp;
	                			<span class="time">${list.ndate }</span>
	                		</li>
                		</c:forEach>
                	</ul>
                </div>
                <c:if test="${page != null}">
                      <div class="pagenav">
                      <p align="right">
					第${page.pageNum }页/共${page.pages }页 
					<a href="/Mnnu_community/admin/news/queryList.do?ntype=${nlistType }&pageNum=1&ntitle=${sntitle }&ndate=${sndate }">首页</a>
					<c:if test="${acadPage.pageNum > 1 }">	
						<a href="/Mnnu_community/admin/news/queryList.do?ntype=${nlistType }&pageNum=${page.pageNum-1 }&ntitle=${sntitle }&ndate=${sndate }">上一页</a>
					</c:if>
					<%-- 计算begin、end --%>
					<c:choose>
						<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
						<c:when test="${page.pages <= 5 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="${page.pages }" />
						</c:when>
						<c:otherwise>
							<%-- 当总页数>5时，通过公式计算出begin和end --%>
							<c:set var="begin" value="${page.pageNum-2 }" />
							<c:set var="end" value="${page.pageNum+2 }" />	
							<%-- 头溢出 --%>
							<c:if test="${begin < 1 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="5" />
							</c:if>	
							<%-- 尾溢出 --%>
							<c:if test="${end > page.pages }">
								<c:set var="begin" value="${page.pages - 4 }" />
								<c:set var="end" value="${page.pages }" />
							</c:if>	
						</c:otherwise>
					</c:choose>
					<%-- 循环遍历页码列表 --%>
					<c:forEach var="i" begin="${begin }" end="${end }">
						<c:choose>
							<c:when test="${i eq page.pageNum }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a href="/Mnnu_community/admin/news/queryList.do?ntype=${nlistType }&pageNum=${i}&ntitle=${sntitle }&ndate=${sndate }">[${i }]</a>	
							</c:otherwise>
						</c:choose>
					</c:forEach>		
					<c:if test="${page.pageNum < page.pages }">
						<a href="/Mnnu_community/admin/news/queryList.do?ntype=${nlistType }&pageNum=${page.pageNum+1}&ntitle=${sntitle }&ndate=${sndate }">下一页</a>
					</c:if>
					<a href="/Mnnu_community/admin/news/queryList.do?ntype=${nlistType }&pageNum=${page.pages}&ntitle=${sntitle }&ndate=${sndate }">尾页</a>
					</p>
				</div>
			</c:if>
            </div>
        </div>
        <div class="footer">
           <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>