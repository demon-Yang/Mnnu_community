<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>物品市场</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".goods .right .big").not(":first-child").hide();
            $(".goods .left .small").click(function(){
                var current = ("." + this.alt);
                if($(current).is(":hidden")){
                    $(this).parent().next().children().not(""+current+"").slideUp();
                   $(this).parent().next().children(""+current+"").slideDown();
                }
            });
        })
         function seraches(){
        	var mtype = '${mtype}';
        	var condition = $(".condition").val();
        	$.ajax({
        		type:"get",
        		url:"market/queryByType.do",
        		async:false,
        		data:{mtype:mtype,condition:condition},
        		success:function(data){
        			location.reload();
        		}
        	});
        }
    </script>
</head>
<body>
<div class="market">
    <div class="main">
        <div class="header">
          	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="itab">
                <ul>
                <c:if test="${mtype == '共享图书' }">
                    <li><a href="market/queryByType.do?mtype=共享图书" class="selected">共享图书</a></li>
                    <li><a href="market/queryByType.do?mtype=二手物品">二手物品</a></li>
                </c:if>
                <c:if test="${mtype == '二手物品' }">
                    <li><a href="market/queryByType.do?mtype=共享图书">共享图书</a></li>
                    <li><a href="market/queryByType.do?mtype=二手物品"  class="selected">二手物品</a></li>
                </c:if>
                </ul>
            </div>
            <c:if test="${user == null }">
                	<a href="javascript:void(0)" onclick="loginshow()"  class="edit">发布</a>
            </c:if>
             <c:if test="${user != null }">
                	<a href="personmedit.jsp" class="edit">发布</a>
             </c:if>	
            <div class="seraches">
                <input type="text" name="condition" class="condition" value="${condition }" placeholder="关键字"/>&nbsp;&nbsp;<input type="button" onclick="seraches()" value="搜索"/>
            </div>
            <hr>
            <div class="goods">
                <ul>
                	<c:forEach items="${marketView }" var="list">
	                    <li>
	                        <p align="center" class="title">${list.market.mtitle }</p>
	                        <hr/>
	                        <div class="left">
	                            <img src="${list.mimage1 }" class="small" alt="img1">
	                            <img src="${list.mimage2 }" class="small" alt="img2">
	                            <img src="${list.mimage3 }" class="small" alt="img3">
	                            <img src="${list.mimage4 }" class="small" alt="img4">
	                        </div>
	                        <div class="right">
	                            <img src="${list.mimage1 }" class="big img1"/>
	                            <img src="${list.mimage2 }" class="big img2"/>
	                            <img src="${list.mimage3 }" class="big img3"/>
	                            <img src="${list.mimage4 }" class="big img4"/>
	
	                        </div>
	                        <p class="contact">联系方式：<span>${list.market.mcontact }</span></p>
	                        <p class="content">说明：
	                            <span>${list.market.mcontent }</span>
	                        </p>
	                        <p class="time" align="right">${list.market.mdate }</p>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="pagenav">
                     <p align="right">
				<span class="pgTotal">第${mtypepage.pageNum }页/共${mtypepage.pages }页 </span>
				<a href="market/queryByType.do?pageNum=1&condition=${condition}">首页</a>
				<c:if test="${mtypepage.pageNum > 1 }">	
					<a href="market/queryByType.do?pageNum=${mtypepage.pageNum-1 }&condition=${condition}">上一页</a>
				</c:if>
				<%-- 计算begin、end --%>
				<c:choose>
					<%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
					<c:when test="${mtypepage.pages <= 5 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${mtypepage.pages }" />
					</c:when>
					<c:otherwise>
						<%-- 当总页数>5时，通过公式计算出begin和end --%>
						<c:set var="begin" value="${mtypepage.pageNum-2 }" />
						<c:set var="end" value="${mtypepage.pageNum+2 }" />	
						<%-- 头溢出 --%>
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="5" />
						</c:if>	
						<%-- 尾溢出 --%>
						<c:if test="${end > mtypepage.pages }">
							<c:set var="begin" value="${mtypepage.pages - 4 }" />
							<c:set var="end" value="${mtypepage.pages }" />
						</c:if>	
					</c:otherwise>
				</c:choose>
				<%-- 循环遍历页码列表 --%>
				<c:forEach var="i" begin="${begin }" end="${end }">
					<c:choose>
						<c:when test="${i eq mtypepage.pageNum }">
							<span class="pgCurrent">${i }</span>
						</c:when>
						<c:otherwise>
							<a href="market/queryByType.do?pageNum=${i}&condition=${condition}">${i }</a>	
						</c:otherwise>
					</c:choose>
				</c:forEach>		
				<c:if test="${mtypepage.pageNum < mtypepage.pages }">
					<a href="market/queryByType.do?pageNum=${mtypepage.pageNum+1}&condition=${condition}">下一页</a>
				</c:if>
				<a href="market/queryByType.do?pageNum=${mtypepage.pages}&condition=${condition}">尾页</a>
				</p>
			</div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>