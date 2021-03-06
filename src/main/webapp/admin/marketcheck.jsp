<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
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
<div class="marketcheck">
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
                    <p>>><span class="nav">商品详情</span></p><br/><br/>
                    <p>商品类型:<span class="type"> ${market.mtype }</span></p>
                    <p>发布时间:<span class="time"> ${market.mdate }</span></p>
                    <hr/>
                    <ul>
                        <li>
                            <p align="center" class="title">${market.mtitle }</p>
                            <hr/>
                            <div class="left">
                                <img src="${mimage1 }" class="small" alt="img1">
                                <img src="${mimage2 }" class="small" alt="img2">
                                <img src="${mimage3 }" class="small" alt="img3">
                                <img src="${mimage4 }" class="small" alt="img4">
                            </div>
                            <div class="right">
                                <img src="${mimage1 }" class="big img1"/>
                                <img src="${mimage2 }" class="big img2"/>
                                <img src="${mimage3 }" class="big img3"/>
                                <img src="${mimage4 }" class="big img4"/>

                            </div>
                            <p class="contact">联系方式：<span>${market.mcontact }</span></p>
                            <p class="content">说明：
                                <span>${market.mcontent }</span>
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