$(function(){
	var rCode;
	var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	//注册发送验证码
	$(".register .rsend").click(function(){
		var uemail = $(".register .uemail").val();
		if(uemail == ''){
			$(".register .email_info").html("不能为空");
			return;
		}else if(!email.test(uemail)){
			$(".register .email_info").html("邮箱格式错误");
			return;
		}else{
			rCode = parseInt(Math.random()*9000+1000);
			$.ajax({
				type:"get",
				url:"user/sendVcode.do",
				data:{uemail:uemail,vcode:rCode},
				success:function(data){
					if(data == 1){
						$(".register .email_info").html("该邮箱已注册");
					}
					else{
						rcountdown();
					}
				}
			});
		}
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
	  var uemail = $(".register .uemail");
	  var uname = $(".register .uname");
	  var upwd = $(".register .upwd");
	  var urpwd = $(".register .urpwd");
	  if(uemail == ''){
			$(".register .email_info").html("不能为空");
	  }
	  if(uname == ''){
			$(".register .name_info").html("不能为空");
	  }
	  if(upwd == ''){
			$(".register .upwd_info").html("不能为空");
	  }
	  if(urpwd == ''){
			$(".register .email_info").html("不能为空");
	  }
	  
	  if(!email.test(uemail))
			$(".register .email_info").html("邮箱格式错误");
	  if(uname.length<3||uname.length>15)
		  	$(".register .uname_info").html("长度3-15之间");
	  
	  
	  
  }