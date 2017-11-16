<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人发帖</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="kindeditor/kindeditor-all-min.js"></script>
        <script type="text/javascript">
        KindEditor.ready(function(K) {
            K.create('#editor', {
                width : '660px',
                uploadJson : 'forum/upload.do',
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
        	$("input[type='button']").click(function(){
        		var ftitle = $(".ftitle").val();
        		var ftype = $("input[type='radio']:checked").val();
            	var fcontent = $(document.getElementsByTagName("iframe")[0].contentWindow.document.body).html();
            	var result = 0;
            	 if(ftitle == ''){
         			$(".ftitle_info").html("*不能为空");
    	     			result++;
    	     	  }else{
    	     		  if(ftitle.length>50){
    	     			  $(".ftitle_info").html("*长度不能大于50个字");
    	     			  result++;
    	     		  }else{
    	     			  	$(".ftitle_info").html("");
    	     		  }
    	     	  }
            	 if(fcontent == ''){
            		 $(".fcontent_info").html("*不能为空");
            		 result++;
            	 }else{
            		 $(".fcontent_info").html("");
            	 }
            	 
            	 if(result == 0){
            		 $.ajax({
            			 type:"post",
            			 url:"forum/edit.do",
            			 async:false,
            			 data:{ftitle:ftitle,fcontent:fcontent,ftype:ftype},
            			 success:function(data){
            				 if(data == 1)
            					 alert("系统提示", "发帖成功！", function () {
            						 location.href="forum.jsp";
            			            }, {type: 'success', confirmButtonText: '确定'});
            				 else
            					 alert("系统提示", "发帖失败！", function () {
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
<div class="personfpost">
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
                    <p>>><span class="nav">发表帖子</span></p>
                    <form >
                        <p>标题：<input type="text" name="ftitle" class="ftitle"/><span class="ftitle_info" id="ftitle_info"></span></p>
                        <p>类型：&nbsp;<input type="radio" name="ftype" value="学习技术类" checked/>学习技术类&nbsp;&nbsp;
                        			  <input type="radio" name="ftype" value="生活兴趣类"/>生活兴趣类</p>
                        <textarea name="fcontent" id="editor"></textarea>
                        <span class="fcontent_info error"></span>
                        <input type="button" value="提交"/>
                    </form>
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