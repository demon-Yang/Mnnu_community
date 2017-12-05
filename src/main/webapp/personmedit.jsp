<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑物品</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
    <style type="text/css">
    	 /* 隐藏大图片 */
    	.private .right .big:not(:first-child){display: none;}
    </style>
    <script type="text/javascript">
        $(function(){
            $(".preview").hide();
            //大小图片的联动切换
           // $(".private").not(':first-child').hide();
            $(".private").on("click",".left .small",function(){
                var current = ("." + this.alt);
                if($(current).is(":hidden")){
                    $(this).parent().next().children().not(""+current+"").slideUp();
                    $(this).parent().next().children(""+current+"").slideDown();
                }
            });
            //预览图片
            $("#cpreview").on("click",function(){
            	var mtitle = $("#mtitle").val();
            	var mcontact = $("#mcontact").val();
            	var mcontent = $("#mcontent").val();
            	var mimage1 = $("#mimage1").val();
            	var mimage2 = $("#mimage2").val();
            	var mimage3 = $("#mimage3").val();
            	var mimage4 = $("#mimage4").val();
            	var result = 0;
           	    if(mtitle == ''){
         			$(".mtitle_info").html("*不能为空");
    	     			result++;
    	     	}else{
    	     		if(mtitle.length>20){
    	     			$(".mtitle_info").html("*长度不能大于20个字");
    	     			result++;
    	     		}else{
    	     			 $(".mtitle_info").html("");
    	     		}
    	     	}
           	    
	           	if(mcontact == ''){
	      			$(".mcontact_info").html("*不能为空");
	 	     			result++;
	 	     	}else{
	 	     		if(mcontact.length>20){
	 	     			$(".mcontact_info").html("*长度不能大于20个字");
	 	     			result++;
	 	     		}else{
	 	     			 $(".mcontact_info").html("");
	 	     		}
	 	     	}
	           	
	           	if(mcontent == ''){
		      		$(".mcontent_info").html("*不能为空");
		 	     		result++;
		 	    }else{
		 	     	if(mcontent.length>60){
		 	     		$(".mcontent_info").html("*长度不能大于60个字");
		 	     		result++;
		 	     	}else{
		 	     		$(".mcontent_info").html("");
		 	     	}
		 	    }
	           	
	           	if(mimage1 == ''||mimage2 == ''||mimage3 == ''||mimage4 == ''){
	           		$(".mimage_info").html("*不能为空");
	           		result++;
	           	}else{
	           		$(".mimage_info").html("");
	           	}
	           	if(result != 0)
	           		return false;
	           	var files = ['mimage1','mimage2','mimage3','mimage4'];
           	 	$.ajaxFileUpload({
           	 		id:"market",
	           	 	url:"market/preview.do",
				  	secureuri : false,
				  	type:"post",
				  	fileElementId : files,
				  	enctype:'multipart/form-data',
				  	dataType:"JSON",
				  	data:{mtitle:mtitle,mcontact:mcontact,mcontent:mcontent},
					success:function(data){
						data = $.parseJSON(data);
						$(".preview").html("<ul>"+
						                        "<li>"+
						                        "<p align='center' class='title'>"+data.mtitle+"</p>"+
						                        "<hr/>"+
						                        "<div class='left'>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage1+"' class='small' alt='img1'>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage2+"' class='small' alt='img2'>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage3+"' class='small' alt='img3'>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage4+"' class='small' alt='img4'>"+
						                        "</div>"+
						                        "<div class='right'>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage1+"' class='big img1' />"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage2+"' class='big img2'/>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage3+"' class='big img3'/>"+
						                            "<img src='"+$.parseJSON(data.mimage).mimage4+"' class='big img4'/>"+
						                        "</div>"+
						                        "<p class='contact'>联系方式：<span>"+data.mcontact+"</span></p>"+
						                        "<p class='content'>说明："+
						                        "<span>"+data.mcontent+"</span>"+
						                        "</p>"+
						                        "<p class='time' align='right'>"+data.mdate+"</p>"+
						                    "</li>"+
						                "</ul>");
						$(".preview").slideDown(1000);
					}
				});
            });
        })
        function justify(){
        	var mtitle = $("#mtitle").val();
        	var mcontact = $("#mcontact").val();
        	var mcontent = $("#mcontent").val();
        	var mimage1 = $("#mimage1").val();
        	var mimage2 = $("#mimage2").val();
        	var mimage3 = $("#mimage3").val();
        	var mimage4 = $("#mimage4").val();
        	var result = 0;
       	    if(mtitle == ''){
     			$(".mtitle_info").html("*不能为空");
	     			result++;
	     	}else{
	     		if(mtitle.length>20){
	     			$(".mtitle_info").html("*长度不能大于20个字");
	     			result++;
	     		}else{
	     			 $(".mtitle_info").html("");
	     		}
	     	}
       	    
           	if(mcontact == ''){
      			$(".mcontact_info").html("*不能为空");
 	     			result++;
 	     	}else{
 	     		if(mcontact.length>20){
 	     			$(".mcontact_info").html("*长度不能大于20个字");
 	     			result++;
 	     		}else{
 	     			 $(".mcontact_info").html("");
 	     		}
 	     	}
           	
           	if(mcontent == ''){
	      		$(".mcontent_info").html("*不能为空");
	 	     		result++;
	 	    }else{
	 	     	if(mcontent.length>60){
	 	     		$(".mcontent_info").html("*长度不能大于60个字");
	 	     		result++;
	 	     	}else{
	 	     		$(".mcontent_info").html("");
	 	     	}
	 	    }
           	
           	if(mimage1 == ''||mimage2 == ''||mimage3 == ''||mimage4 == ''){
           		$(".mimage_info").html("*不能为空");
           		result++;
           	}else{
           		$(".mimage_info").html("");
           	}
           	if(result != 0)
           		return false;
           	else
           		return true;
        }
    </script>
</head>
<body>
<div class="personmedit">
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
                    <p>>><span class="nav">编辑物品</span></p>
                    <div class="edit">
                        <form action="market/add.do" enctype="multipart/form-data" method="post">
                            <table>
                                <tr>
                                    <td>标题:</td>
                                    <td><input type="text" name="mtitle" id="mtitle"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span class="error mtitle_info"></span></td>
                                </tr>
                                <tr>
                                    <td>联系方式:</td>
                                    <td><input type="text" name="mcontact" id="mcontact"/></td>
                                </tr>
                               <tr>
                                    <td></td>
                                    <td><span class="error mcontact_info"></span></td>
                                </tr>
                                <tr>
                                    <td>类型:</td>
                                    <td><input type="radio" name="mtype" value="共享图书" checked/>共享图书&nbsp;<input type="radio" name="mtype" value="生活物品"/>生活物品</td>
                                </tr>
                                <tr>
                                    <td>图片1:</td>
                                    <td><input type="file" name="mimage1" id="mimage1" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                                </tr>
                                <tr>
                                    <td>图片2:</td>
                                    <td><input type="file" name="mimage2" id="mimage2" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                                </tr>
                                <tr>
                                    <td>图片3:</td>
                                    <td><input type="file" name="mimage3" id="mimage3" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                                </tr>
                                <tr>
                                    <td>图片4:</td>
                                    <td><input type="file" name="mimage4" id="mimage4" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span class="error mimage_info"></span></td>
                                </tr>
                                <tr>
                                    <td>描述:</td>
                                    <td><textarea name="mcontent" cols="25" rows="4" id="mcontent"></textarea></td>
                                </tr>
                               <tr>
                                    <td></td>
                                    <td><span class="error mcontent_info"></span></td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2"><input type="button" value="预览" id="cpreview"/><input type="submit" value="提交" onclick="return justify()"/></td>
                                 </tr>

                            </table>
                        </form>
                    </div>
                    <div class="preview">
                        <!-- <ul>
                            <li>
                                <p align="center" class="title">例如自行车出售</p>
                                <hr/>
                                <div class="left">
                                    <img src="images/market1.jpg" class="small" alt="img1">
                                    <img src="images/market2.jpg" class="small" alt="img2">
                                    <img src="images/market3.jpg" class="small" alt="img3">
                                    <img src="images/market4.jpg" class="small" alt="img4">
                                </div>
                                <div class="right">
                                    <img src="images/market1.jpg" class="big img1" />
                                    <img src="images/market2.jpg" class="big img2"/>
                                    <img src="images/market3.jpg" class="big img3"/>
                                    <img src="images/market4.jpg" class="big img4"/>

                                </div>
                                <p class="contact">联系方式：<span>QQ45789999</span></p>
                                <p class="content">说明：
                                <span>性用于指定当前文档与被链接文档的关系文档与被链接文档的关系性
                                	    用于指定当前文档与被链接文档的关系文档与被链接文档的关系。</span>
                                </p>
                                <p class="time" align="right">2017-10-10 10:12</p>
                            </li>
                        </ul> -->
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
</body>
</html>