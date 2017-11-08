$(function(){
	var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	//注册发送验证码
	$(".forgetpwd .fsend").click(function(){
		var uemail = $(".forgetpwd .uemail").val();
		if(uemail == ''){
			$(".forgetpwd .uemail_info").html("*不能为空");
			return;
		}else if(!email.test(uemail)){
			$(".forgetpwd .uemail_info").html("*邮箱格式错误");
			return;
		}else{
			$.ajax({
				type:"get",
				url:"user/fsendVcode.do",
				data:{uemail:uemail},
				success:function(data){
					if(data == 0){
						$(".forgetpwd .uemail_info").html("*该邮箱未注册");
					}
					else{
						$(".forgetpwd .uemail_info").html("");
						fcountdown();
					}
				}
			});
		}
	});	
})
	
//注册倒计时
  function fcountdown(){
      $('.fsend').val('60秒后重发');
      var second = 60;
      var timer = null;
      timer = setInterval(function(){
          second -= 1;
          if(second >0 ){
              $('.fsend').attr("disabled",true);
              $('.fsend').val(second+"秒后重发");
          }else{
              clearInterval(timer);
              $('.fsend').attr("disabled",false);
              $('.fsend').val("发送验证码");
          }
      },1000);
  }
//注册提交
  function forgetpwd(){
	  var uemail = $(".forgetpwd .uemail").val();
	  var uvcode = $(".forgetpwd .uvcode").val();
	  var email=/^[\w]+(\.[\w]+)*@[\w]+(\.[\w]+)+$/;
	  var result = 0;
	  if(uemail == ''){
			$(".forgetpwd .uemail_info").html("*不能为空");
			result++;
	  }else{
		  if(!email.test(uemail)){
				$(".forgetpwd .uemail_info").html("*邮箱格式错误");
				result++;
		  }else{
			  	$(".forgetpwd .uemail_info").html("");
		  }
	  }
	
	  var rvcode = getRvcode();
	 
	  if(uvcode == ''){
		  $(".forgetpwd .uvcode_info").html("*不能为空");
		  result++;
  	  }else{
  		 if(uvcode != rvcode){
			  $(".forgetpwd .uvcode_info").html("*验证码错误");
			  result++;
  		 }else{
			  	$(".forgetpwd .uvcode_info").html("");
		  }
  	  }
	 
	  if(result == 0){
		  $.ajax({
				type:"post",
				url:"user/forgetpwd.do",
				async:false,
				data:{uemail:$(".forgetpwd .uemail").val()},
				success:function(data){
					if(data == 0)
						$(".forgetpwd .uemail_info").html("*该邮箱未注册");
					else{
						alert("系统提示", "密码已发送至您的邮箱！", function (){
							location.reload();
			            }, {type: 'success', confirmButtonText: '确定'});
					}
				}
			});
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