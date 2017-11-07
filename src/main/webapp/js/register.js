$(function(){
	var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	//注册发送验证码
	$(".register .rsend").click(function(){
		var uemail = $(".register .uemail").val();
		if(uemail == ''){
			$(".register .uemail_info").html("不能为空");
			return;
		}else if(!email.test(uemail)){
			$(".register .uemail_info").html("邮箱格式错误");
			return;
		}else{
			$.ajax({
				type:"get",
				url:"user/sendVcode.do",
				data:{uemail:uemail},
				success:function(data){
					if(data == 1){
						$(".register .uemail_info").html("该邮箱已注册");
					}
					else{
						$(".register .uemail_info").html("");
						rcountdown();
					}
				}
			});
		}
	});	
	//表单提交
	$("#regsiter_form").submit(function(){
		$.ajax({
			type:"post",
			url:"user/register.do",
			data:{uemail:$(".register .uemail").val(),uname:$(".register .uname").val(),upwd:$(".register .upwd").val()},
			success:function(data){
					alert("注册成功");
			}
		});
	});
})
	
//注册倒计时
  function rcountdown(){
      $('.rsend').val('60秒后重发');
      var second = 60;
      var timer = null;
      timer = setInterval(function(){
          second -= 1;
          if(second >0 ){
              $('.rsend').attr("disabled",true);
              $('.rsend').val(second+"秒后重发");
          }else{
              clearInterval(timer);
              $('.rsend').attr("disabled",false);
              $('.rsend').val("发送验证码");
          }
      },1000);
  }
//注册提交
  function register(){
	  var uemail = $(".register .uemail").val();
	  var uname = $(".register .uname").val();
	  var upwd = $(".register .upwd").val();
	  var urpwd = $(".register .urpwd").val();
	  var uvcode = $(".register .uvcode").val();
	  var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	  var result = 0;
	  if(uemail == ''){
			$(".register .uemail_info").html("不能为空");
			result++;
	  }else{
		  if(!email.test(uemail)){
				$(".register .uemail_info").html("邮箱格式错误");
				result++;
		  }else{
			  	$(".register .uemail_info").html("");
		  }
	  }
	  
	  if(uname == ''){
			$(".register .uname_info").html("不能为空");
			result++;
	  }else{
		  if(uname.length<3||uname.length>15){
			  	$(".register .uname_info").html("长度3-15之间");
			  	result++;
		  }else{
			  	$(".register .uname_info").html("");
		  }
	  }
	  
	  if(upwd == ''){
			$(".register .upwd_info").html("不能为空");
			result++;
	  }else{
		  if(upwd.length<6||upwd.length>20){
			  $(".register .upwd_info").html("长度6-20之间");
			  result++;
		  }else{
			  	$(".register .upwd_info").html("");
		  }
	  }
	  
	  if(urpwd == ''){
			$(".register .urpwd_info").html("不能为空");
			result++;
	  }else{
		  if(upwd != urpwd){
			  $(".register .urpwd_info").html("与密码不相同");
			  result++;
		  }else{
			  	$(".register .urpwd_info").html("");
		  }
	  }
	
	  var rvcode = getRvcode();
	 
	  if(uvcode == ''){
		  $(".register .uvcode_info").html("不能为空");
		  result++;
  	  }else{
  		 if(uvcode != rvcode){
			  $(".register .uvcode_info").html("验证码错误");
			  result++;
  		 }else{
			  	$(".register .uvcode_info").html("");
		  }
  	  }
	 
	  if(result == 0){
		  return true;
	  }else 
		  return false;
  }
  //获取验证码
  function getRvcode(){
	  var rvcode;
	  $.ajax({
		  type:"get",
		  url:"user/getVcode.do",
		  async:false,
		  success:function(data){
			 rvcode = data;
		  }
	  });
	  return rvcode;
  }