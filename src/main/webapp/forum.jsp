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
            $.ajax({
        		type:"get",
        		url:"forum/queryList.do",
        		async:false,
        		success:function(data){}
        	});
       })
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
                            <option>按用户名查找</option>
                            <option>按关键字查找</option>
                        </select>
                        <input type="text" name="" />&nbsp;&nbsp;<input type="submit" value="搜索"/>
                    </form>
                </div>
                <hr>
                <div class="list">
                    <ul>
                        <c:forEach items="${forumViewList }" var="list">
	                        <li>
	                            <h2><a href="forum/queryById.do?fid=${list.fList.fid }">${list.fList.ftitle }</a></h2>
	                            <span class="reply">100</span>&nbsp;
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
	                            <p align="right">${list.fList.fdate }</p>
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
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                    </ul>
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