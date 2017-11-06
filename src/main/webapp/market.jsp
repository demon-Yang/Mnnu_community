<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>物品市场</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".goods .right .big").not(":first-child").hide();
            $(".goods .left .small").click(function(){
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
<div class="market">
    <div class="main">
        <div class="header">
          	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="itab">
                <ul>
                    <li><a href="#" >共享图书</a></li>
                    <li><a href="#" class="selected">二手物品</a></li>
                </ul>
            </div>
            <a href="#" class="edit">发布</a>
            <div class="seraches">
                <input type="text" name=""  placeholder="关键字"/>&nbsp;&nbsp;<input type="submit" value="搜索"/>
            </div>
            <hr/>
            <div class="goods">
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
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
                        <p class="time" align="right">2017-10-10 10:12</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>