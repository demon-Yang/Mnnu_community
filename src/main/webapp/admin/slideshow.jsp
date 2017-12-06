<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>轮播切换</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
    <script type="text/javascript">
        $(function(){
            $(".show").hide();
            $(".preview1").click(function(){
            	 $.ajaxFileUpload({
            		id:"slide1",
 				 	url:"/Mnnu_community/admin/slide1Preview.do",
 				  	secureuri : false,
 				  	type:"post",
 				  	fileElementId : ["slide1"],
 				  	enctype:'multipart/form-data',
 				  	data:{name:"silde1"},
 				  	dataType:"JSON",
 					success:function(data){
 						$(".show img").attr("src",data);
 						$(".show").slideDown(1000);
 					}
 				});
            });
            $(".preview2").click(function(){
           	 $.ajaxFileUpload({
           			id:"slide2",
				 	url:"/Mnnu_community/admin/slide2Preview.do",
				  	secureuri : false,
				  	type:"post",
				  	fileElementId : ["slide2"],
				  	enctype:'multipart/form-data',
				  	data:{name:"silde2"},
				  	dataType:"JSON",
					success:function(data){
						$(".show img").attr("src",data);
						$(".show").slideDown(1000);
					}
				});
           });
            $(".preview3").click(function(){
           	 $.ajaxFileUpload({
           			id:"slide3",
				 	url:"/Mnnu_community/admin/slide3Preview.do",
				  	secureuri : false,
				  	type:"post",
				  	fileElementId : ["slide3"],
				  	enctype:'multipart/form-data',
				  	data:{name:"silde3"},
				  	dataType:"JSON",
					success:function(data){
						$(".show img").attr("src",data);
						$(".show").slideDown(1000);
					}
				});
           });
        })
    </script>
</head>
<body>
<div class="slideshow">
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
                    <p>>><span class="nav">首页轮播图切换</span></p>
                    <div class="upload">
                        <form action="/Mnnu_community/admin/slide.do" enctype="multipart/form-data" method="post">
                            <table>
                                <tr>
                                    <td>图片1：</td>
                                    <td><input type="file" name="slide1" id="slide1"/></td>
                                    <td><input type="button" value="预览" class="preview1"/></td>
                                </tr>
                                <tr>
                                    <td>图片2：</td>
                                    <td><input type="file" name="slide2" id="slide2"/></td>
                                    <td><input type="button" value="预览" class="preview2"/></td>
                                </tr>
                                <tr>
                                    <td>图片3：</td>
                                    <td><input type="file" name="slide3" id="slide3"/></td>
                                    <td><input type="button" value="预览" class="preview3"/></td>
                                </tr>
                            </table>
                            <input type="submit" value="提交"/>
                        </form>
                    </div>
                    <hr/>
                    <div class="show">
                        <img src="" />
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