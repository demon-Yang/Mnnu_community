  $(function(){
	/*头部*/
    //导航栏旋转效果
    $(".header .menu > ul > li").hover(function(){
        $(".header .menu li:hover .submenu li").css({"opacity":"1","transform":"rotateY(0deg)","-moz-transform":"rotateY(0deg)",
            "-ms-transform":"rotateY(0deg)","-o-transform":"rotateY(0deg)","-webkit-transform":"rotateY(0deg)"});
    },function(){
        $(".header .submenu li").css({"opacity":"0","transform":"rotateY(90deg)","-moz-transform":"rotateY(90deg)",
            "-ms-transform":"rotateY(90deg)","-o-transform":"rotateY(90deg)","-webkit-transform":"rotateY(90deg)"});
    });
	
	/*登陆*/
	 //设置模态框宽度位于窗口中央
	 var lheight = $(window).width()/2-375;
       $(".login").css({"left":lheight+"px"});
	/*注册*/
      var rheight = $(window).width()/2-350;
      $(".register").css({"left":rheight+"px"});
    /*忘记密码*/
     var fheight = $(window).width()/2-350;
        $(".forgetpwd").css({"left":fheight+"px"});
        
    //滑动验证
	 $("#slider").slider({
            width:250,
            callback: function(result) {
               /*  $("#result1").text(result); */
            }
     });
})
  //倒计时
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
  function loginshow(){
		/*关闭其他momal*/
		if($(".registermodal").is(":visible"))
			$(".registermodal").css("visibility","hidden");
		if($(".forgetpwdmodal").is(":visible"))
			$(".forgetpwdmodal").css("visibility","hidden");
		//切换本身momal
		if($(".loginmodal").css("visibility") == "visible")
			$(".loginmodal").css("visibility","hidden");
		else
			$(".loginmodal").css("visibility","visible");
	}
  function registershow(){
		/*关闭其他momal*/
		if($(".loginmodal").is(":visible"))
			$(".loginmodal").css("visibility","hidden");
		//切换本身momal
		if($(".registermodal").css("visibility") == "visible")
			$(".registermodal").css("visibility","hidden");
		else
			$(".registermodal").css("visibility","visible");
	}
  function forgetpwdshow(){
		/*关闭其他momal*/
		if($(".loginmodal").is(":visible"))
			$(".loginmodal").css("visibility","hidden");
		//切换本身momal
		if($(".forgetpwdmodal").css("visibility") == "visible")
			$(".forgetpwdmodal").css("visibility","hidden");
		else
			$(".forgetpwdmodal").css("visibility","visible");
  }