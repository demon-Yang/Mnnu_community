$(function(){
	//设置模态框宽度位于窗口中央
	 var lheight = $(window).width()/2-375;
      $(".mlogin").css({"left":lheight+"px"});
      
    //滑动验证
 	 $("#mslider").slider({
             width:250,
             callback: function(result) {
                  $(".mlogin .mslider").val(result); 
             }
      });
})
//管理员登录界面显示
function mloginshow(){
		//切换本身momal
		if($(".mloginmodal").css("visibility") == "visible")
			$(".mloginmodal").css("visibility","hidden");
		else
			$(".mloginmodal").css("visibility","visible");
	}

//登录提交
  function mlogin(){
	  var mname = $(".mlogin .mname").val();
	  var mpwd = $(".mlogin .mpwd").val();
	  var mslider = $(".mlogin .mslider").val();
	  var result = 0;
	  if(mname == ''){
			$(".mlogin .mname_info").html("*不能为空");
			result++;
	  }else{
			$(".mlogin .mname_info").html("");
	  }
	  
	  if(mpwd == ''){
			$(".mlogin .mpwd_info").html("*不能为空");
			result++;
	  }else{
		  if(mpwd.length<6||mpwd.length>20){
			  $(".mlogin .mpwd_info").html("*长度6-20之间");
			  result++;
		  }else{
			  	$(".mlogin .mpwd_info").html("");
		  }
	  }
	  
	  if(mslider != 'true'){
			$(".mlogin .mslider_info").html("*请拖动到最右边");
			result++;
	  }else{
		  $(".mlogin .mslider_info").html("");
	  }
	  
	  if(result == 0){
		  $.ajax({
				type:"post",
				url:"manager/login.do",
				async:false,
				data:{mname:$(".mlogin .mname").val(),mpwd:$(".mlogin .mpwd").val()},
				success:function(data){
					if(data == 0){
						$(".mlogin .mname_info").html("*ID或密码错误");
					}
					else{
						location.href="admin/index.jsp";
					}
				}
			});
	  }else 
		  return false;
  }
