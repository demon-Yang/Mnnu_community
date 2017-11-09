<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                uploadJson : '/Mnnu_community/news/upload.do',
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
                    <form action="/Mnnu_community/news/edit.do" method="post">
                        <p>标题：<input type="text" name="ntitle"/></p>
                       	 <p>类型：&nbsp;<input type="radio" name="ntype" value="闽师新闻" checked/>闽师新闻&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="热点聚焦"/>热点聚焦&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="学术报告"/>学术报告&nbsp;&nbsp;
                                       <input type="radio" name="ntype" value="通知公告"/>通知公告&nbsp;&nbsp;</p>
                        <textarea name="ncontent" id="editor"></textarea>
                        <input type="submit" value="提交"/>
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