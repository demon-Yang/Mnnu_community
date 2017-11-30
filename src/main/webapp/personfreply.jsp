<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人回复</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	function deleteOne(rid){
    		confirm("系统提示", "您确定要删除当前回复吗!", function (isConfirm) {
    			if(isConfirm) {
    				$.ajax({
    					type:"get",
    					url:"reply/delete.do?rid="+rid+"",
    					success:function(data){
    						if(data == 1)
	    						alert("系统提示", "删除成功！", function () {
	    							location.href="reply/queryByUid.do";
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
<div class="personfreply">
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
                    <p>>><span class="nav">我的回复</span></p>
                    <br/>
                    <div class="lists">
                        <ul>
                        	<c:forEach items="${pfrpage.list }" var="list">
	                            <li>
	                                <p class="title"><span>我&nbsp;回复&nbsp;&nbsp;<span class="to">${list.uname }</span>&nbsp;:&nbsp;</span>${list.reply.rcontent }</p>
	                                <p class="source"><span>来&nbsp;自&nbsp;:&nbsp;</span><span class="ftitle">${list.ftitle }</span></p>
	                                <p class="function" align="right"><span>${list.reply.rdate }</span>&nbsp;&nbsp;
		                                <a href="forum/queryOne.do?fid=${list.fid }&cid=${list.reply.cid}" target="_blank">查看</a>
		                                <a href="javascript:void(0)" onclick="deleteOne(${list.reply.rid})">删除</a>
	                                </p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="pagenav">
                       <p align="right">
						<span class="pgTotal">第${pfrpage.pageNum }页/共${pfrpage.pages }页 </span>
						<a href="reply/queryByUid.do?pageNum=1">首页</a>
						<c:if test="${pfrpage.pageNum > 1 }">	
							<a href="reply/queryByUid.do?pageNum=${pfrpage.pageNum-1 }">上一页</a>
						</c:if>
						<%-- 计算begin、end --%>
						<c:choose>
							<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
							<c:when test="${pfrpage.pages <= 5 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="${pfrpage.pages }" />
							</c:when>
							<c:otherwise>
								<%-- 当总页数>5时，通过公式计算出begin和end --%>
								<c:set var="begin" value="${pfrpage.pageNum-2 }" />
								<c:set var="end" value="${pfrpage.pageNum+2 }" />	
								<%-- 头溢出 --%>
								<c:if test="${begin < 1 }">
									<c:set var="begin" value="1" />
									<c:set var="end" value="5" />
								</c:if>	
								<%-- 尾溢出 --%>
								<c:if test="${end > pfrpage.pages }">
									<c:set var="begin" value="${pfrpage.pages - 4 }" />
									<c:set var="end" value="${pfrpage.pages }" />
								</c:if>	
							</c:otherwise>
						</c:choose>
						<%-- 循环遍历页码列表 --%>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<c:choose>
								<c:when test="${i eq pfrpage.pageNum }">
									<span class="pgCurrent">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="reply/queryByUid.do?pageNum=${i}">${i }</a>	
								</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:if test="${pfrpage.pageNum < pfrpage.pages }">
							<a href="reply/queryByUid.do?pageNum=${pfrpage.pageNum+1}">下一页</a>
						</c:if>
						<a href="reply/queryByUid.do?pageNum=${pfrpage.pages}">尾页</a>
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