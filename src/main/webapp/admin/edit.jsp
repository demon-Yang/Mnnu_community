<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑新闻</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../kindeditor/kindeditor-all-min.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            K.create('#editor', {
                width : '660px',
                uploadJson : '/Mnnu_community/admin/news/upload.do',
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
        		var ntitle = $(".ntitle").val();
        		var ntype = $("input[type='radio']:checked").val();
            	var ncontent = $(document.getElementsByTagName("iframe")[0].contentWindow.document.body).html();
            	var result = 0;
            	 if(ntitle == ''){
         			$(".ntitle_info").html("*不能为空");
    	     			result++;
    	     	  }else{
    	     		  if(ntitle.length>50){
    	     			  $(".ntitle_info").html("*长度不能大于50个字");
    	     			  result++;
    	     		  }else{
    	     			  	$(".ntitle_info").html("");
    	     		  }
    	     	  }
            	 if(ncontent == ''){
            		 $(".ncontent_info").html("*不能为空");
            		 result++;
            	 }else{
            		 $(".ncontent_info").html("");
            	 }
            	 
            	 if(result == 0){
            		 $.ajax({
            			 type:"post",
            			 url:"/Mnnu_community/admin/news/edit.do",
            			 async:false,
            			 data:{ntitle:ntitle,ncontent:ncontent,ntype:ntype},
            			 success:function(data){
            				 if(data == 1)
            					 alert("系统提示", "上传成功！", function () {
            						 location.reload();
            			            }, {type: 'success', confirmButtonText: '确定'});
            				 else
            					 alert("系统提示", "上传失败！", function () {
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
<div class="edit">
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
                    <p>>><span class="nav">编辑新闻</span></p>
                    <form id="edit_form">
                        <p>标题：<input type="text" name="ntitle" class="ntitle"/>&nbsp;&nbsp;<span class="ntitle_info" id="ntitle_info"></span></p>
                       	 <p>类型：&nbsp;<input type="radio" name="ntype" value="闽师新闻" checked/>闽师新闻&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="热点聚焦"/>热点聚焦&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="学术报告"/>学术报告&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="通知公告"/>通知公告&nbsp;&nbsp;</p>
                        <textarea name="ncontent" id="editor"></textarea>
                        <span class="ncontent_info error"></span>
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