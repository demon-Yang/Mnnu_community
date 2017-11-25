<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>闽师新闻</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
     <script type="text/javascript">
    	function deleteOne(nid){
    		confirm("系统提示", "您确定要删除当前文章吗!", function (isConfirm) {
    			if(isConfirm) {
    				$.ajax({
    					type:"get",
    					url:"/Mnnu_community/admin/news/delete.do?nid="+nid+"",
    					success:function(data){
    						if(data == 1)
	    						alert("系统提示", "删除成功！", function () {
	    							location.href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻";
	    			            }, {type: 'success', confirmButtonText: '确定'});
    						else
    							alert("系统提示", "删除失败！", function () {
	    							location.reload();
	    			            }, {type: 'success', confirmButtonText: '确定'});
    					}
    				});
    	        }else {
    	            return false;
    	        }
    	    }, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});
    	}
    </script>
</head>
<body>
    <div class="mnew">
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
                        <p>>><span class="nav">闽师新闻</span></p>
                        <p align="right">
                            <a>发表闽师新闻</a>
                        </p>
                        <div class="lists">
                            <ul>
                               <c:forEach items="${mnewList }" var="list">
                                <li>
                                    <p class="title">${list.ntitle }</p>
                                    <p class="function" align="right"><span>${list.ndate }</span>&nbsp;&nbsp;<a href="/Mnnu_community/admin/news/findOne.do?nid=${list.nid }">查看</a>&nbsp;&nbsp;<a href="#" onclick="return deleteOne(${list.nid})">删除</a></p>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <c:if test="${mnewPage != null}">
	                        <div class="pagenav">
	                        <p align="right">
								第${mnewPage.pageNum }页/共${mnewPage.pages }页 
								<a href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻&pageNum=1">首页</a>
								<c:if test="${mnewPage.pageNum > 1 }">	
									<a href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻&pageNum=${mnewPage.pageNum-1 }">上一页</a>
								</c:if>
								<%-- 计算begin、end --%>
								<c:choose>
									<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
									<c:when test="${mnewPage.pages <= 5 }">
										<c:set var="begin" value="1" />
										<c:set var="end" value="${mnewPage.pages }" />
									</c:when>
									<c:otherwise>
										<%-- 当总页数>5时，通过公式计算出begin和end --%>
										<c:set var="begin" value="${mnewPage.pageNum-2 }" />
										<c:set var="end" value="${mnewPage.pageNum+2 }" />	
										<%-- 头溢出 --%>
										<c:if test="${begin < 1 }">
											<c:set var="begin" value="1" />
											<c:set var="end" value="5" />
										</c:if>	
										<%-- 尾溢出 --%>
										<c:if test="${end > mnewPage.pages }">
											<c:set var="begin" value="${mnewPage.pages - 4 }" />
											<c:set var="end" value="${mnewPage.pages }" />
										</c:if>	
									</c:otherwise>
								</c:choose>
								<%-- 循环遍历页码列表 --%>
								<c:forEach var="i" begin="${begin }" end="${end }">
									<c:choose>
										<c:when test="${i eq mnewPage.pageNum }">
											[${i }]
										</c:when>
										<c:otherwise>
											<a href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻&pageNum=${i}">[${i }]</a>	
										</c:otherwise>
									</c:choose>
								</c:forEach>		
								<c:if test="${mnewPage.pageNum < mnewPage.pages }">
									<a href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻&pageNum=${mnewPage.pageNum+1}">下一页</a>
								</c:if>
								<a href="/Mnnu_community/admin/news/queryByType.do?ntype=闽师新闻&pageNum=${mnewPage.pages}">尾页</a>
								</p>
							</div>
						</c:if>
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