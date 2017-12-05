<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>论坛评论</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/detail-pager.js"></script>
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
        	$(".message").on("paste",function(){
        			$(this).siblings(".error").text("温馨提示：不能粘贴！！");
        			return false;
        	}); 
           //点击小图片，显示表情
           $(document).on("click",".emo",(function(e){
	               $(this).parent().next().slideDown(500);//慢慢向下展开
	               e.stopPropagation();   //阻止冒泡事件
           		})
           );

           //在桌面任意地方点击，关闭
           $(document).click(function(){
               $(".emotions").slideUp(500);//慢慢向上收
           });

           //点击小图标时，添加功能
           $(document).on("click",".emotions ul li",function(){
               var simg=$(this).find("img").clone();
               $(this).parents(".emotions").siblings(".message").append(simg);
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
           						 location.href="forum/queryById.do?fid="+fid+"";
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
	           				$(".comments > ul").append(
	           						"<li class='per'>"+
		                            "<div class='inleft'>"+
		                                "<img src='"+list.user.uportrait+"'><p class='name' align='center'>"+list.user.uname+"</p>"+
		                            "</div>"+
		                            "<div class='inright'>"+
		                                "<div class='comment'>"+
		                                    "<div>"+list.comment.ccontent+"</div>"+
		                                    "<div class='empty'></div>"+
		                                    "<div>"+
		                                    	"<p align='right'>"+list.comment.cdate+"&nbsp;&nbsp;"+
		                                    		"<span class='retract' onclick='slideReply(this,"+list.rtotal+","+list.comment.cid+","+list.rtotal+")'>&nbsp;查看回复("+list.rtotal+")&nbsp;&nbsp;</span>"+
		                                    	"</p>"+
		                                    "</div>"+
		                                    "<div class='reply'>"+
		                                        "<ul class='lists'>"+
		                                        "</ul>"+
		                                        "<div class='answer'>"+
		                                        	"<div class='bar'>"+
		                                        		"<div class='pager'>"+
		                                        		"</div>"+
		                                        		"<div class='say' onclick='replyComment(this,\""+list.user.uname+"\","+list.user.uid+")'>我也说一句</div>"+
		                                        	"</div>"+
		                                            "<div class='message' contentEditable='true'></div>"+
		                                            "<span><img src='images/qqface/1.gif' class=\"emo\"></span>"+
		                                            "<div class='emotions'>"+
		                                            	"<jsp:include page='qqFace.jsp'></jsp:include>"+
		                                            "</div>"+
		                                            "<button class='send'>发表</button>"+
		                                        "</div>"+
		                                    "</div>"+
		                                "</div>"+
		                              "</div>"+
		                           	  "<div style='clear: both'></div>"+
		                           "</li>");
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
      function slideReply(reply,rtotal,cid,rtotal){
              if($(reply).text().trim().substring(0,4) == "查看回复"){
            		 $.ajax({
    	           		type:"get",
    	           		url:"reply/queryReply.do",
    	           		dataType:"json",
    	           		async:"false",
    	           		data:{cid:cid},
    	           		success:function(data){
    	           			if(rtotal != 0){
    	           				$(reply).parent().parent().next().find('.lists').empty();
    	           				$.each(data.list,function(index,list){
    	           					$(reply).parent().parent().next().find('.lists').append(
        	           						"<li class='list'>"+
    		                                "<img src='"+list.from.uportrait+"' class='face'>"+
    		                                "<span class='total'>"+
    		                                	"<span class='from'>"+list.from.uname+"</span> :回复  <span class='to'>"+list.to.uname+"</span>:&nbsp;"+
    		                                	"<span class='content'>"+list.reply.rcontent+"</span>"+
    		                                "</span>"+
    		                                "<p align='right'>"+list.reply.rdate+"&nbsp;<span class='replyOne' onclick='rshow(this,\""+(list.from.uname)+"\","+list.from.uid+")'>回复</span>&nbsp;&nbsp;</p>"+
    		                                "<hr/>"+
    		                                "</li>");
    	           				});
    	           				$(reply).parent().parent().next().find(".pager").html(renderpager(data.pageNum,data.pages,cid));
    	           			}
    	           		}
    	           	}); 
                    $(reply).text("收取回复"+"("+rtotal+")");
              }else{
                    $(reply).text("查看回复"+"("+rtotal+")");
              }
              $(reply).parent().parent().next().slideToggle(500);
     }
       
     //点击回复，显示在编辑框
     function rshow(reply,toname,toid){
   			$(reply).parents(".lists").next().find(".message").text("回复 "+toname+" :");
   			$(reply).parents(".lists").next().find(".toname").val(toname);
   			$(reply).parents(".lists").next().find(".toid").val(toid);
     }
     function replyComment(reply,toname,toid){
    	 $(reply).parent().next().text("");
    	 $(reply).parents(".answer").find(".toname").val(toname);
    	 $(reply).parents(".answer").find(".toid").val(toid);
     }
     //点击发表，提交数据
     function send(send,cid,cuid,cuname){
    	 var uid = '${user.uid}';
		 if(uid == 0){
			 loginshow();
			 return false;
		 } 
		 var length = ((String)($(send).siblings(".message").text())).trim().length;
		 var rcontent = (String)($(send).siblings(".message").html());
		 //判断是否有表情
		 var img = rcontent.match(/<img.*?(?:>|\/>)/gi);
		 //有表情长度增加
		 if(img != null)
		 	length = length + img.length;
		 if(length == 0){
			 $(send).prev().text("温馨提示：回复不能为空哟！！");
			 return false;
		 }
		 if(rcontent.length > 200){
			 $(send).prev().text("温馨提示：一个表情算30个字，输入的文字不能超过150个哟！！");
			 return false;
		 }
		 //设置要回复的ID
    	 var toid = $(send).parent().find(".toid").val();
  	  	 var toname = $(send).parent().find(".toname").val();
  	  	 if(toid == "") {
  	  		 toid = cuid;
  	  		 toname = cuname;
  	  	 }
  	  	 var l = ("回复 "+""+toname+""+" :").length;
  	  	 var t = rcontent.substring(0,l);
  	  	 if(("回复 "+""+toname+""+" :") == t){
  	  		 rcontent = rcontent.substring(l);
  	  		 var arr = rcontent.match(/($nbsp;)*/gi);
  	  		 if(rcontent.length == 0){
		  	  		 $(send).prev().text("温馨提示：回复不能为空哟！！");
					 return false;
  	  		 }else{
  	  			//清除$nbsp;格式的空格
  	  			if(rcontent.replace(/[ ]|[&nbsp;]/g, '').length == 0){
	  	  		 $(send).prev().text("温馨提示：回复不能为空哟！！");
				 return false;
  	  			}
  	  		 }
  	  	 }else{
  	  		 toid = cuid;
  	  	 }
  	  	 $.ajax({
  	  	 	type:"post",
			 url:"reply/add.do",
			 data:{rcontent:rcontent,cid:cid,fromid:uid,toid:toid},
			 success:function(data){
				 alert("系统提示", "回复成功！", function () {
					 	$(send).siblings(".message").text("");
					 	$(send).siblings(".error").text("");
					 	queryReply(send,cid,1);
		            }, {type: 'success', confirmButtonText: '确定'});
			 }
  	  	 });
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
	                                    <div>
	                                    	<p align="right">${list.comment.cdate }&nbsp;&nbsp;
	                                    		<span class="retract" onclick="slideReply(this,${list.rtotal },${list.comment.cid },${list.rtotal })">&nbsp;查看回复(${list.rtotal })&nbsp;&nbsp;</span>
	                                    	</p>
	                                    </div>
	                                    <div class="reply">
	                                        <ul class="lists">
	                                           <!--  <li class="list">
	                                                <img src="images/userdefault.png" class="face">
	                                                <span class="total">
	                                                	<span class="from">andy刘德华</span> :回复  <span class="to">沈卓盈</span>:&nbsp;
	                                                	<span class="content">说的很好说</span>
	                                                </span>
	                                                <p align="right">2017-10-11&nbsp;<span class="replyOne" onclick="rshow(this,'andy刘德华','1')">回复</span>&nbsp;&nbsp;</p>
	                                                <hr/>
	                                            </li> -->
	                                        </ul>
	                                        <div class="answer">
	                                        	<div class="bar">
	                                        		<div class="pager">
	                                        		</div>
	                                        		<div class="say" onclick="replyComment(this,'${list.user.uname }','${list.user.uid }')">我也说一句</div>
	                                        	</div>
	                                            <div class="message" contentEditable='true' ></div>
	                                            <span><img src="images/qqface/1.gif" class="emo"></span>
	                                            <div class="emotions">
	                                                <jsp:include page="qqFace.jsp"></jsp:include>
	                                            </div>
	                                            <input type="hidden" value="" class="toname"/>
	                                            <input type="hidden" value="" class="toid"/>
	                                            <span class="error"></span>
	                                            <button class="send" onclick="send(this,${list.comment.cid },${list.user.uid },'${list.user.uname }')">发表</button>
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