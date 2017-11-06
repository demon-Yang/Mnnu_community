<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑物品</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".preview").hide();
            $("#cpreview").click(function(){
                $(".preview").slideToggle(1000);
            });
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
                        <form action="">
                            <table>
                                <tr>
                                    <td>标题:</td>
                                    <td><input type="text" name=""/></td>
                                </tr>
                                <tr>
                                    <td>联系方式:</td>
                                    <td><input type="text" name=""/></td>
                                </tr>
                                <tr>
                                    <td>类型:</td>
                                    <td><input type="radio" name="type" value="共享图书" checked/>共享图书&nbsp;<input type="radio" name="type" value="生活物品"/>生活物品</td>
                                </tr>
                                <tr>
                                    <td>图片1:</td>
                                    <td><input type="file" name=""/></td>
                                </tr>
                                <tr>
                                    <td>图片2:</td>
                                    <td><input type="file" name=""/></td>
                                </tr>
                                <tr>
                                    <td>图片3:</td>
                                    <td><input type="file" name=""/></td>
                                </tr>
                                <tr>
                                    <td>图片4:</td>
                                    <td><input type="file" name=""/></td>
                                </tr>
                                <tr>
                                    <td>描述:</td>
                                    <td><textarea name="" cols="25" rows="4"></textarea></td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2"><input type="button" value="预览" id="cpreview"/><input type="submit" value="提交"/></td>
                                 </tr>

                            </table>
                        </form>
                    </div>
                    <div class="preview">
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
                                    <img src="images/market1.jpg" class="big img1" />
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
            </div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>