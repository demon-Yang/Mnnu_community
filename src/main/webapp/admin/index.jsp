<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员主页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	function backup() {
    		confirm("系统提示", "您确定要备份吗!", function (isConfirm) {
    	  		if(isConfirm) {
    	  			$.ajax({
    	  				type:"get",
    	  				url:"/Mnnu_community/backup/backup.do",
    	  				success:function(data){
    	  					alert("系统提示", "备份成功！", function () {
    			            }, {type: 'success', confirmButtonText: '确定'});
    	  				}
    	  			});
    	          }else {
    	              return;
    	          }
    	      }, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});
		}
    </script>
</head>
<body>
<div class="index">
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
                	<span onclick="backup()">数据备份</span>
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