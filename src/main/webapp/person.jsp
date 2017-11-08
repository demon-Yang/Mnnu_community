<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人主页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
      //更新用户基本信息
      function updatebase(){
		  var uname = $(".base .uname").val();
		  var umotto = $(".base .umotto").val();
		  var uportrait = $(".base .uportrait").val();
		  var result = 0;
		  
		  if(uname == ''){
				$(".base .uname_info").html("*不能为空");
				result++;
		  }else{
			  if(uname.length<3||uname.length>15){
				  $(".base .uname_info").html("*长度3-15之间");
				  result++;
			  }else{
				  	$(".base .uname_info").html("");
			  }
		  }
		  
		  if(result == 0){
			  $.ajaxFileUpload({
				 	url:"user/updateBase.do",
				  	secureuri : false,
				  	type:"post",
				  	fileElementId : ["uportrait"],
				  	enctype:'multipart/form-data',
				  	dataType:"JSON",
				  	data:{uname:uname,umotto:umotto},
					success:function(data){
						if(data == 1)
							alert("系统提示", "更新成功！", function () {
								location.reload();
				            }, {type: 'success', confirmButtonText: '确定'});
					}
				});
		  }else 
			  return false;
	  }
        //修改用户密码
        function changeupwd(){
  		  var oupwd = $(".pwd .oupwd").val();
  		  var upwd = $(".pwd .upwd").val();
  		  var urpwd = $(".pwd .urpwd").val();
  		  var result = 0;
  		if(oupwd == ''){
			$(".pwd .oupwd_info").html("*不能为空");
			result++;
		  }else{
			  if(oupwd.length<6||oupwd.length>20){
				  $(".pwd .oupwd_info").html("*长度6-20之间");
				  result++;
			  }else{
				  	$.ajax({
				  		type:"post",
				  		url:"user/queryUpwd.do",
				  		data:{oupwd:oupwd},
				  		async:false,
				  		success:function(data){
				  			if(data == 1)
				  				$(".pwd .oupwd_info").html("");
				  			else
				  				$(".pwd .oupwd_info").html("*原密码错误");
				  		}
				  	});
			  }
		 }
  		
  		if(upwd == ''){
			$(".pwd .upwd_info").html("*不能为空");
			result++;
		  }else{
			  if(upwd.length<6||upwd.length>20){
				  $(".pwd .upwd_info").html("*长度6-20之间");
				  result++;
			  }else{
				  	$(".pwd .upwd_info").html("");
			  }
		}
		  
	    if(urpwd == ''){
			$(".pwd .urpwd_info").html("*不能为空");
			result++;
		  }else{
			  if(upwd != urpwd){
				  $(".pwd .urpwd_info").html("*与密码不相同");
				  result++;
			  }else{
				  	$(".pwd .urpwd_info").html("");
			  }
		}
  		  
	    if(result == 0){
		    $.ajax({
				type:"post",
				url:"user/changeUpwd.do",
				async:false,
				data:{upwd:upwd},
				success:function(data){
					alert("系统提示", "修改成功！", function () {
						location.reload();
		            }, {type: 'success', confirmButtonText: '确定'});
				}
			});
	    }else 
		  return false;
  	  }
    </script>
</head>
<body>
<div class="person">
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
                        <p>>><span class="nav">个人主页</span></p>
                        <div class="img"><img src="${user.uportrait }"></div>
                        <div class="info">
                            <p>用户名:<span>${user.uname }</span></p>
                            <p>邮箱:<span>${user.uemail }</span></p>
                            <p>格言:<span>${user.umotto }</span></p>
                        </div>
                        <p class="edit" align="right"><a href="#" id="cbase">编辑资料</a>&nbsp;&nbsp;<a href="#" id="cpwd">修改密码</a></p>
                        <hr>
                        <div class="update">
                            <div class="base">
                                <form action="">
                                    <table>
                                        <tr>
                                            <td align="right">头像：</td>
                                            <td><input type="file" name="uportrait" id="uportrait" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">用户名：</td>
                                            <td><input type="text" name="uname" class="uname" value="${user.uname }"/></td>
                                        </tr>
                                       <tr>
                                        	<td colspan="2" class="uname_info error" align="center"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">格言：</td>
                                            <td><textarea name="umotto" class="umotto" cols="25" rows="4" placeholder="三十个字以内" maxlength="50"></textarea></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><input type="button" value="提交" onclick="return updatebase()"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="pwd">
                                <form action="">
                                    <table>
                                        <tr>
                                            <td align="right">原密码：</td>
                                            <td><input type="password" name="oupwd" class="oupwd"/></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" class="oupwd_info error" align="center"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">新密码：</td>
                                            <td><input type="password" name="upwd" class="upwd"/></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" class="upwd_info error" align="center"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">确认密码：</td>
                                            <td><input type="password" name="urpwd" class="urpwd"/></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" class="urpwd_info error" align="center"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><input type="button" value="提交" onclick="return changeupwd()"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="footer">
           	<jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
$(function(){
	//菜单栏滑动
    $(".pwd").hide();
    $(".base").hide();
    $("#cpwd").click(function(){
        $(".pwd").slideToggle(500);
    });
    $("#cbase").click(function(){
        $(".base").slideToggle(500);
    });
})
</script>
</body>
</html>