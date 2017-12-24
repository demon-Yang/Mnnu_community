<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人商品</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript">
    	function deleteOne(mid){
    		confirm("系统提示", "您确定要删除当前商品吗!", function (isConfirm) {
    			if(isConfirm) {
    				$.ajax({
    					type:"get",
    					url:"market/delete.do?mid="+mid+"",
    					success:function(data){
    						if(data == 1)
	    						alert("系统提示", "删除成功！", function () {
	    							location.href="market/queryByUid.do";
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
<div class="personmarket">
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
                    <p>>><span class="nav">个人商品</span></p>
                    <p align="right">
                        <a href="personmedit.jsp">发布商品</a>
                    </p>
                    <div class="lists">
                        <ul>
                        	<c:forEach items="${pmpage.list }" var="list">
	                            <li>
	                                <p class="title">${list.mtitle }</p>
	                                <p class="function" align="right"><span>${list.mtype }</span>&nbsp;&nbsp;<span>${list.mdate }</span>&nbsp;&nbsp;
		                                <a href="market/queryByMid.do?mid=${list.mid }" target="_blank">查看</a>
			                            <a href="javascript:void(0)" onclick="deleteOne(${list.mid})">删除</a>
	                                </p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                     <div class="pagenav">
                       <p align="right">
						<span class="pgTotal">第${pmpage.pageNum }页/共${pmpage.pages }页 </span>
						<a href="market/queryByUid.do?pageNum=1">首页</a>
						<c:if test="${pmpage.pageNum > 1 }">	
							<a href="market/queryByUid.do?pageNum=${pmpage.pageNum-1 }">上一页</a>
						</c:if>
						<%-- 计算begin、end --%>
						<c:choose>
							<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
							<c:when test="${pmpage.pages <= 5 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="${pmpage.pages }" />
							</c:when>
							<c:otherwise>
								<%-- 当总页数>5时，通过公式计算出begin和end --%>
								<c:set var="begin" value="${pmpage.pageNum-2 }" />
								<c:set var="end" value="${pmpage.pageNum+2 }" />	
								<%-- 头溢出 --%>
								<c:if test="${begin < 1 }">
									<c:set var="begin" value="1" />
									<c:set var="end" value="5" />
								</c:if>	
								<%-- 尾溢出 --%>
								<c:if test="${end > pmpage.pages }">
									<c:set var="begin" value="${pmpage.pages - 4 }" />
									<c:set var="end" value="${pmpage.pages }" />
								</c:if>	
							</c:otherwise>
						</c:choose>
						<%-- 循环遍历页码列表 --%>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<c:choose>
								<c:when test="${i eq pmpage.pageNum }">
									<span class="pgCurrent">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="market/queryByUid.do?pageNum=${i}">${i }</a>	
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:if test="${pmpage.pageNum < pmpage.pages }">
							<a href="market/queryByUid.do?pageNum=${pmpage.pageNum+1}">下一页</a>
						</c:if>
						<a href="market/queryByUid.do?pageNum=${pmpage.pages}">尾页</a>
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