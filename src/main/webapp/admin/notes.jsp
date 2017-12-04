<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言表白</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	function deleteOne(nid){
    		confirm("系统提示", "您确定要删除当前评论吗!", function (isConfirm) {
    			if(isConfirm) {
    				$.ajax({
    					type:"get",
    					url:"/Mnnu_community/notes/delete.do?nid="+nid+"",
    					success:function(data){
    						if(data == 1)
	    						alert("系统提示", "删除成功！", function () {
	    							location.href="/Mnnu_community/notes/queryAll.do";
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
<div class="notes">
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
                    <p>>><span class="nav">留言表白</span></p><br/><br/>
                    <div class="lists">
                        <ul>
                           <c:forEach items="${notespage.list }" var="list">
	                            <li>
	                                <p class="text">${list.ncontent }</p>
	                                <p class="function" align="right"><span class="ndate">${list.ndate }</span>&nbsp;&nbsp;
	                                	<a href="javascript:void(0)" onclick="return deleteOne(${list.nid})">删除</a>
	                                </p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                     <c:if test="${notespage != null}">
	                        <div class="pagenav">
	                        <p align="right">
								<span class="pgTotal">第${notespage.pageNum }页/共${notespage.pages }页 </span>
								<a href="/Mnnu_community/notes/queryAll.do?pageNum=1">首页</a>
								<c:if test="${notespage.pageNum > 1 }">	
									<a href="/Mnnu_community/notes/queryAll.do?pageNum=${notespage.pageNum-1 }">上一页</a>
								</c:if>
								<%-- 计算begin、end --%>
								<c:choose>
									<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
									<c:when test="${notespage.pages <= 5 }">
										<c:set var="begin" value="1" />
										<c:set var="end" value="${notespage.pages }" />
									</c:when>
									<c:otherwise>
										<%-- 当总页数>5时，通过公式计算出begin和end --%>
										<c:set var="begin" value="${notespage.pageNum-2 }" />
										<c:set var="end" value="${notespage.pageNum+2 }" />	
										<%-- 头溢出 --%>
										<c:if test="${begin < 1 }">
											<c:set var="begin" value="1" />
											<c:set var="end" value="5" />
										</c:if>	
										<%-- 尾溢出 --%>
										<c:if test="${end > notespage.pages }">
											<c:set var="begin" value="${notespage.pages - 4 }" />
											<c:set var="end" value="${notespage.pages }" />
										</c:if>	
									</c:otherwise>
								</c:choose>
								<%-- 循环遍历页码列表 --%>
								<c:forEach var="i" begin="${begin }" end="${end }">
									<c:choose>
										<c:when test="${i eq notespage.pageNum }">
											<span class="pgCurrent">${i }</span>
										</c:when>
										<c:otherwise>
											<a href="/Mnnu_community/notes/queryAll.do?pageNum=${i}">${i }</a>	
										</c:otherwise>
									</c:choose>
								</c:forEach>		
								<c:if test="${notespage.pageNum < notespage.pages }">
									<a href="/Mnnu_community/notes/queryAll.do?pageNum=${notespage.pageNum+1}">下一页</a>
								</c:if>
								<a href="/Mnnu_community/notes/queryAll.do?pageNum=${notespage.pages}">尾页</a>
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