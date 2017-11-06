<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人商品详情</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".private .right .big").not(":first-child").hide();
            $(".private .left .small").click(function(){
                var current = ("." + this.alt);
                if($(current).is(":hidden")){
                    $(this).parent().next().children().not(""+current+"").slideUp();
                    $(this).parent().next().children(""+current+"").slideDown();
                }
            });
        })
    </script>
</head>
<body>
<div class="personmcheck">
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
                    <p>>><span class="nav">发表帖子</span></p><br/><br/>
                    <p>商品类型:<span class="type"> 生活用品</span></p>
                    <p>发布时间:<span class="time"> 2017-10-10 09:45</span></p>
                    <hr/>
                    <ul>
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
                                <img src="images/market1.jpg" class="big img1"/>
                                <img src="images/market2.jpg" class="big img2"/>
                                <img src="images/market3.jpg" class="big img3"/>
                                <img src="images/market4.jpg" class="big img4"/>

                            </div>
                            <p class="contact">联系方式：<span>qq：45789999</span></p>
                            <p class="content">说明：
                                <span>性用于指定当前文档与被链接文档的关系文档与被链接文档的关系性
                                用于指定当前文档与被链接文档的关系文档与被链接文档的关系。</span>
                            </p>
                        </li>
                    </ul>
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