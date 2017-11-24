<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>论坛评论</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="css/Pager.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.pager.js"></script>
    <script type="text/javascript" src="kindeditor/kindeditor-all-min.js"></script>
    <script type="text/javascript">
	    KindEditor.ready(function(K) {
	        K.create('#editor', {
	            width : '660px',
	            uploadJson : 'comment/upload.do',
	            allowFileManager : true,
	            items : [
	        		'source', '|', 'undo', 'redo', '|', 'preview', 'code', 'cut', 'copy', 'paste',
	        		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
	        		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
	        		'superscript', 'quickformat', 'selectall', '|', 'fullscreen', '/',
	        		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
	        		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
	        		'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
	        		'anchor', 'link', 'unlink', '|', 'about'
	        	],
	        });
	    });
        $(function(){
        	//论坛热搜移动
            setInterval(function(){
                if( $(window).scrollTop() > 186){
                    var topvalue = $(window).scrollTop()-185;
                    $(".container .right").css({"position":"absolute","top":""+topvalue+"px","left":"700px"});
                }else{
                    $(".container .right").css({"position":"static"});
                }
            },500);
        	$(".message").keypress(function(e){
        		if($(this).text().length > 5 && e.which != 8)
        			e.preventDefault();
        	});
         //点击小图片，显示表情
           $(".emo").click(function(e){
               $(this).parent().next().slideDown(500);//慢慢向下展开
               e.stopPropagation();   //阻止冒泡事件
           });

           //在桌面任意地方点击，他是关闭
           $(document).click(function(){
               $(".emotions").slideUp(500);//慢慢向上收
           });

           //点击小图标时，添加功能
           $(".emotions ul li").click(function(){
               var simg=$(this).find("img").clone();
               $(".message").append(simg);
           });
            
           //提交评论
           $("#submit").click(function(){
			var uid = $(".user_id").val();
			if(uid == 0){
				loginshow();
				return false;
			}
           	var fid = $(".forum_id").val();
           	var ccontent = $(document.getElementsByTagName("iframe")[0].contentWindow.document.body).html();
           	var result = 0;
           	 if(ccontent == ''){
           		 $(".ccontent_info").html("*不能为空");
           		 result++;
           	 }else{
           		 $(".ccontent_info").html("");
           	 }
           	 
           	 if(result == 0){
           		 $.ajax({
           			 type:"post",
           			 url:"comment/edit.do",
           			 async:false,
           			 data:{fid:fid,ccontent:ccontent},
           			 success:function(data){
           				 if(data == 1)
           					 alert("系统提示", "评论成功！", function () {
           						 location.href="forum.jsp";
           			            }, {type: 'success', confirmButtonText: '确定'});
           				 else
           					 alert("系统提示", "评论失败！", function () {
           						 location.reload();
           			            }, {type: 'success', confirmButtonText: '确定'});
           			 }
           		 });
           	 }else 
           		 return false;
       	  });
           //点击查看更多，加载数据
           var count = 2;
           $(".more").click(function(){
	           	var fid = '${forumView.fList.fid }';
	           	$.ajax({
	           		type:"get",
	           		url:"comment/queryMore.do",
	           		dataType:"json",
	           		data:{fid:fid,pageNum:count,pageSize:2},
	           		success:function(data){
	           			$.each(data,function(index,list){
	           				console.log(list);
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
	  //查看回复滑动
      function slideReply(reply,rtotal,cid){
              if($(reply).text().trim().substring(0,4) == "查看回复"){
            	  $(reply).parent().parent().next().find(".pager").html(renderpager(1,5));
            		/* $.ajax({
    	           		type:"get",
    	           		url:"comment/queryReply.do",
    	           		dataType:"json",
    	           		async:"false",
    	           		data:{cid:cid},
    	           		success:function(data){
    	           			$pager = renderpager(1,2,PageClick);
    	           		}
    	           	}); */
                    $(reply).text("收取回复"+"("+rtotal+")");
              }else{
                    $(reply).text("查看回复"+"("+rtotal+")");
              }
              $(reply).parent().parent().next().slideToggle(500);
     }
      //点击回复，显示在编辑框
     function reply(reply,toName,toid){
   			$(reply).parent().parent().parent().next().children(".message").text("回复 "+toName+" :");
     }
     function replyComment(reply,toName,toid){
    	 $(reply).parent().next().text("回复 "+toName+" :");
     }
	</script>
</head>
<body>
<div class="detail">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left">
                <div class="landlord">
                    <div class="img"><img src="${forumView.uList.uportrait }"/></div>
                    <div class="info"><p class="name">${forumView.uList.uname }</p><p class="motto"> ${forumView.uList.umotto }</p></div>
                    <p align="right"><button class="gocomment">我要评论</button><span class="type">${forumView.fList.ftype }</span>&nbsp;当前评论人数：<span class="reply">${forumView.cTotal }</span></p>
                    <hr/>
                    <p class="title" align="center">${forumView.fList.ftitle }</p>
                    <hr/>
                    <div class="content">${forumView.fList.fcontent }</div>
                 </div>
                <div class="comments">
                     <ul>
                     	<c:forEach items="${commentViewList }" var="list">
	                        <li class="per">
	                            <div class="inleft">
	                                <img src="${list.user.uportrait }"><p class="name" align="center">${list.user.uname }</p>
	                            </div>
	                            <div class="inright">
	                                <div class="comment">
	                                    <div>${list.comment.ccontent }</div>
	                                    <div class="empty"></div>
	                                    <div><p align="right">${list.comment.cdate }&nbsp;&nbsp;<span class="retract" onclick="slideReply(this,${list.rtotal },${list.comment.cid })">&nbsp;查看回复(${list.rtotal })&nbsp;&nbsp;</span></p></div>
	                                    <div class="reply">
	                                        <ul>
	                                            <li class="list">
	                                                <img src="images/userdefault.png" class="face">
	                                                <span class="total">
	                                                	<span class="from">andy刘德华</span> :回复  <span class="to">沈卓盈</span>:&nbsp;
	                                                	<span class="content">说的很好说的很好说的很好说的很好说的很好说的很好说的很好说的很好说的很好说的很好</span>
	                                                </span>
	                                                <p align="right">2017-10-11&nbsp;<span class="replyOne" onclick="reply(this,'andy刘德华','1')">回复</span>&nbsp;&nbsp;</p>
	                                                <hr/>
	                                            </li>
	                                        </ul>
	                                        <div class="answer">
	                                        	<div class="bar">
	                                        		<div class="pager">
	                                        			首页 上一页 [1] [2] [3] 下一页 尾页
	                                        		</div>
	                                        		<div class="say" onclick="replyComment(this,'${list.user.uname }','${list.user.uid }')">我也说一句</div>
	                                        	</div>
	                                            <div class="message" contentEditable='true'></div>
	                                            <span><img src="images/qqface/1.gif" class="emo"></span>
	                                            <div class="emotions">
	                                                <jsp:include page="qqFace.jsp"></jsp:include>
	                                            </div>
	                                            <button class="send">发表</button>
	                                        </div>
	                                    </div>
	                                </div>
	                              </div>
	                           	  <div style="clear: both"></div>
	                           </li>
                           </c:forEach>
                     </ul>
                </div>
                <div style="clear: both;"></div>
		        <div class="more"><p>点击查看更多</p></div>
		        <div class="none"><p>已无数据...</p></div>
                <div class="edit">
                    <p>发表评论</p>
                    <div class="content">
                        <form >
                        	<input type="hidden" class="forum_id" value="${forumView.fList.fid }"/>
                        	<input type="hidden" class="user_id" value="${user.uid }"/>
	                        <textarea name="ccontent" id="editor"></textarea>
	                        <span class="ccontent_info error"></span>
                            <input type="button" id="submit" value="提交"/>
                        </form>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="hot">
                    <p>论坛·热搜</p>
                    <hr>
                    <ul>
                    	<c:forEach items="${chotList }" var="list">
	                        <li>
	                            <img src="${list.uList.uportrait }"/>
	                            <span><a href="forum/queryById.do?fid=${list.fList.fid }" target="_blank">${list.fList.ftitle }</a></span>
	                            <div style="clear: both;"></div>
	                            <p style="margin-top:4px;margin-bottom: 3px;"><span style="display: inline-block;width: 10px;"></span><span class="name">${list.uList.uname }：</span> <span class="motto">${list.uList.umotto }</span></p>
	                            <hr/>
	                        </li>
                        </c:forEach>
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