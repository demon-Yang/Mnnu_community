<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>闽师论坛</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            setInterval(function(){
                if( $(window).scrollTop() > 186){
                    var topvalue = $(window).scrollTop()-185;
                    $(".container .right").css({"position":"absolute","top":""+topvalue+"px","left":"700px"});
                }else{
                    $(".container .right").css({"position":"static"});
                }
            },500);
            //加载数据
            $.ajax({
        		type:"get",
        		url:"forum/queryList.do",
        		async:false,
        		success:function(data){}
        	});
            //点击查看更多，加载数据
            var count = 2;
            $(".more").click(function(){
            	var serach = '${serachText }';
            	var ftype = '${ftype }';
            	$.ajax({
            		type:"get",
            		url:"forum/queryMore.do",
            		dataType:"json",
            		data:{ftype:ftype,pageNum:count,pageSize:2,serach:serach},
            		success:function(data){
            			$.each(data,function(index,list){
            				if(list.fList.fimage != null){
	            				$(".list ul").append("<li>"+
	            									"<h2><a href='forum/queryById.do?fid="+list.fList.fid+"'>"+list.fList.ftitle+"</a></h2>"+
	            								    "<span class='reply'>"+list.cTotal+"</span>&nbsp;<span class='name'>"+list.uList.uname +"：</span>"+
	            								    "<span class'motto'>"+list.uList.uname +"</span>"+
	            								    "<div class='notes'>"+
	            								    "<img "+list.fList.fimage+">"+
	            								    "<span>"+list.fList.fcontent+"</span>"+
	            								    "</div>"+
	            								    "<div style='clear: both;'></div>"+
	            								    "<p align='right'style='color: #a5a3a3;padding-right: 15px;padding-bottom: 4px;'>"+list.fList.fdate+"</p>"+
	            								    "<hr>"+
	            								    "</li>");
            				}
            				else{
            					$(".list ul").append("<li>"+
    									"<h2><a href='forum/queryById.do?fid="+list.fList.fid+"'>"+list.fList.ftitle+"</a></h2>"+
    								    "<span class='reply'>"+list.cTotal+"</span>&nbsp;<span class='name'>"+list.uList.uname +"：</span>"+
    								    "<span class'motto'>"+list.uList.uname +"</span>"+
    								    "<div class='notes'>"+
    								    "<span>"+list.fList.fcontent+"</span>"+
    								    "</div>"+
    								    "<div style='clear: both;'></div>"+
    								    "<p align='right' style='color: #a5a3a3;  padding-right: 15px;padding-bottom: 4px;'>"+list.fList.fdate+"</p>"+
    								    "<hr>"+
    								    "</li>");
            				}
            			});
            			var l = data.length;
            			if(l<2){
            				$(".more").css({"display":"none"});
            				$(".none").css({"display":"block"});
            			}
            			count++;
            		}
            	});
            });
       })
       function seraches(){
        	var ftype = '${ftype}';
        	var condition = $(".seraches option:selected").val();
        	var serach = $(".serach").val();
        	console.log(serach);
        	$.ajax({
        		type:"get",
        		url:"forum/queryList.do",
        		async:false,
        		data:{ftype:ftype,condition:condition,serach:serach},
        		success:function(data){
        			location.reload();
        		}
        	});
        }
    </script>
</head>
<body>
<div class="forum">
    <div class="main">
        <div class="header">
          	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left">
                <div class="itab">
                    <ul>
                    	<c:if test="${ftype == '学习技术类' }">
                        	<li><a href="forum/queryList.do?ftype=学习技术类" class="selected">学习论坛</a></li>
                        	<li><a href="forum/queryList.do?ftype=生活兴趣类" >生活贴吧</a></li>
                        </c:if>
                        <c:if test="${ftype == '生活兴趣类' }">
                        	<li><a href="forum/queryList.do?ftype=学习技术类" >学习论坛</a></li>
                        	<li><a href="forum/queryList.do?ftype=生活兴趣类" class="selected">生活贴吧</a></li>
                        </c:if>
                    </ul>
                </div>
                <c:if test="${user == null }">
                	<a href="#" onclick="loginshow()"  class="post">发帖</a>
                </c:if>
                 <c:if test="${user != null }">
                	<a href="personfpost.jsp" class="post">发帖</a>
                </c:if>	
                <div class="seraches">
                    <form>
                        <select>
                            <option value="按用户名查找">按用户名查找</option>
                            <c:if test="${condition == '按关键字查找' }">
                            	<option value="按关键字查找" selected="selected">按关键字查找</option>
                            </c:if>
                            <c:if test="${condition != '按关键字查找' }">
                            	<option value="按关键字查找">按关键字查找</option>
                            </c:if>
                        </select>
                        <input type="text" name="serach" class="serach" value="${serachText }"/>&nbsp;&nbsp;<input type="button" onclick="seraches()" value="搜索"/>
                    </form>
                </div>
                <hr>
                <div class="list">
                    <ul>
                        <c:forEach items="${forumViewList }" var="list">
	                        <li>
	                            <h2><a href="forum/queryById.do?fid=${list.fList.fid }">${list.fList.ftitle }</a></h2>
	                            <span class="reply">${list.cTotal }</span>&nbsp;
	                            <span class="name">${list.uList.uname }：</span> <span class="motto"> ${list.uList.umotto }</span>
	                            <div class="notes">
	                            	<c:if test="${list.fList.fimage != null}">
	                                	<img ${list.fList.fimage }>
	                                </c:if>
                                <span>
		                            ${list.fList.fcontent }
                                </span>
	                            </div>
	                            <div style="clear: both;"></div>
	                            <p align="right" style="color: #a5a3a3; padding-right: 15px;padding-bottom: 4px;">${list.fList.fdate }</p>
	                            <hr>
	                         </li>
                         </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="hot">
                    <p>论坛·热搜</p>
                    <hr>
                    <ul>
                    	<c:forEach items="${fhotList }" var="list">
	                        <li>
	                            <img src="${list.uList.uportrait }"/>
	                            <span><a href="forum/queryById.do?fid=${list.fList.fid }">${list.fList.ftitle }</a></span>
	                            <div style="clear: both;"></div>
	                            <p style="margin-top:4px;margin-bottom: 3px;"><span style="display: inline-block;width: 10px;"></span><span class="name">${list.uList.uname }：</span> <span class="motto">${list.uList.umotto }</span></p>
	                            <hr/>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        <div style="clear: both;"></div>
        <div class="more"><p>点击查看更多</p></div>
        <div class="none"><p>已无数据...</p></div>
        </div>
        <div class="footer">
           <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>