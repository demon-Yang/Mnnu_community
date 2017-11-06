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
            $(".container .private .show").hide();
            $(".preview").click(function(){
                $(".container .private .show").slideDown(1000);
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
                        <form action="">
                            <table>
                                <tr>
                                    <td>图片1：</td>
                                    <td><input type="file" name=""/></td>
                                    <td><input type="button" value="预览" class="preview"/></td>
                                </tr>
                                <tr>
                                    <td>图片2：</td>
                                    <td><input type="file" name=""/></td>
                                    <td><input type="button" value="预览"/></td>
                                </tr>
                                <tr>
                                    <td>图片3：</td>
                                    <td><input type="file" name=""/></td>
                                    <td><input type="button" value="预览" /></td>
                                </tr>
                            </table>
                            <input type="submit" value="提交"/>
                        </form>
                    </div>
                    <hr/>
                    <div class="show">
                        <img src="images/slide1.jpg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>