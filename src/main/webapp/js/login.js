$(function(){
	//表单提交
	$("#login_form").submit(function(){
		$.ajax({
			type:"post",
			url:"user/login.do",
			async:false,
			data:{uemail:$(".login .uemail").val(),upwd:$(".login .upwd").val()},
			success:function(data){
				if(data == 0){
					$(".login .uemail_info").html("邮箱或密码错误");
				}
				else{
					alert("登录成功");
				}
			}
		});
	});
})
	
//登录提交
  function login(){
	  var uemail = $(".login .uemail").val();
	  var upwd = $(".login .upwd").val();
	  var uslider = $(".login .uslider").val();
	  var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	  var result = 0;
	  if(uemail == ''){
			$(".login .uemail_info").html("不能为空");
			result++;
	  }else{
		  if(!email.test(uemail)){
				$(".login .uemail_info").html("邮箱格式错误");
				result++;
		  }else{
			  	$(".login .uemail_info").html("");
		  }
	  }
	  
	  if(upwd == ''){
			$(".login .upwd_info").html("不能为空");
			result++;
	  }else{
		  if(upwd.length<6||upwd.length>20){
			  $(".login .upwd_info").html("长度6-20之间");
			  result++;
		  }else{
			  	$(".login .upwd_info").html("");
		  }
	  }
	  
	  if(uslider != 'true'){
			$(".login .uslider_info").html("请拖动到最右边");
			result++;
	  }else{
		  $(".login .uslider_info").html("");
	  }
	  
	  if(result == 0){
		  return true;
	  }else 
		  return false;
  }