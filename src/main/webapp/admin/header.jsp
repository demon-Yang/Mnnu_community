<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>头部</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="../BeAlert/BeAlert.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../BeAlert/BeAlert.js"></script>
    <script type="text/javascript">
	  //退出登录
	    function mloginout() {
	  	confirm("系统提示", "您确定要退出登录吗!", function (isConfirm) {
	  		if(isConfirm) {
	  			$.ajax({
	  				type:"get",
	  				url:"/Mnnu_community/manager/loginout.do",
	  				success:function(data){
	  					location.href="/Mnnu_community/admin/news/index.do";
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
    <div class="main">
        <div class="header">
            <div class="img"></div>
            <div class="manager">
                <a href="#" id="signout" onclick="mloginout()">退出登录</a>
                <span class="name">admin</span>
            </div>
        </div>
    </div>
</body>
</html>