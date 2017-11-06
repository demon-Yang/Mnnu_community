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
                uploadJson : '../jsp/upload_json.jsp',
                fileManagerJson : '../jsp/file_manager_json.jsp',
                allowFileManager : true
            });
        });
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
                    <form action="">
                        <p>标题：<input type="text" name=""/></p>
                        <p>类型：&nbsp;<input type="radio" name="type" checked/>学习技术类&nbsp;&nbsp;<input type="radio" name="type" />生活兴趣类</p>
                        <textarea name="content" id="editor"></textarea>
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