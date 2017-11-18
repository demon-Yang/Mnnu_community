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
            setInterval(function(){
                if( $(window).scrollTop() > 186){
                    var topvalue = $(window).scrollTop()-185;
                    $(".container .right").css({"position":"absolute","top":""+topvalue+"px","left":"700px"});
                }else{
                    $(".container .right").css({"position":"static"});
                }
            },500);

          $(".retract").click(function(){
              if($(this).text() == "回复")
                    $(this).text("收取回复");
              else
                    $(this).text("回复");
              $(this).parent().parent().next().slideToggle(1000);
          });

            //点击小图片，显示表情
            $("#emo").click(function(e){
                $(".emotions").slideDown(500);//慢慢向下展开
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
        })

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
                    <p align="right"><button class="gocomment">我要评论</button><span class="type">${forumView.fList.ftype }</span>&nbsp;当前评论人数：<span class="reply">100</span></p>
                    <hr/>
                    <p class="title" align="center">${forumView.fList.ftitle }</p>
                    <hr/>
                    <div class="content">${forumView.fList.fcontent }</div>
                 </div>
                <div class="comments">
                     <ul>
                        <li class="per">
                            <div class="inleft">
                                <img src="images/detail1.jpg"><p class="name" align="center">沈卓盈</p>
                            </div>
                            <div class="inright">
                                <div class="comment">
                                    <p>终于有人回应了，谢谢关照</p>
                                    <img src="images/symbol3.png">
                                    <div class="empty"></div>
                                    <div><p align="right">2017-09-30 16:59&nbsp;&nbsp;<span class="retract">&nbsp;收起回复&nbsp;&nbsp;</span></p></div>
                                    <div class="reply">
                                        <ul>
                                            <li>
                                                <img src="images/detail1.jpg" class="face">
                                                <span class="total"><span class="from">法拉诗韵:</span> 回复  <span class="to">魄岁月 </span>:华仔哈哈哈，你好你好</span>
                                                <p align="right">2014-9-27 09:34&nbsp;回复&nbsp;&nbsp;</p>
                                                <hr/>
                                            </li>
                                            <li>
                                                <img src="images/detail1.jpg" class="face">
                                                <span class="total"><span class="from">法拉诗韵:</span> 回复  <span class="to">魄岁月 </span>:华仔哈哈哈，你好你好</span>
                                                <p align="right">2014-9-27 09:34&nbsp;回复&nbsp;&nbsp;</p>
                                                <hr/>
                                            </li>
                                        </ul>
                                        <div class="answer">
                                            <div class="message" contentEditable='true'></div>
                                            <span><img src="images/qqface/1.gif" id="emo"></span>
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
                     </ul>
                </div>
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