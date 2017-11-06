<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人主页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".pwd").hide();
            $(".base").hide();
            $("#cpwd").click(function(){
                $(".pwd").slideToggle(1000);
            });
            $("#cbase").click(function(){
                $(".base").slideToggle(1000);
            });
        })
    </script>
</head>
<body>
<div class="person">
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
                        <p>>><span class="nav">个人主页</span></p>
                        <div class="img"><img src="images/person1.jpg"></div>
                        <div class="info">
                            <p>用户名:<span>魄岁月</span></p>
                            <p>邮箱:<span>2546903456@qq.com</span></p>
                            <p>格言:<span>弹吉他 健身 唱歌 讲故事</span></p>
                        </div>
                        <p class="edit" align="right"><span id="cbase">编辑资料</span>&nbsp;&nbsp;<span id="cpwd">修改密码</span></p>
                        <hr>
                        <div class="update">
                            <div class="base">
                                <form action="">
                                    <table>
                                        <tr>
                                            <td align="right">头像：</td>
                                            <td><input type="file" name="" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">用户名：</td>
                                            <td><input type="text" name=""/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">邮箱：</td>
                                            <td><input type="email" name=""/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">格言：</td>
                                            <td><textarea name="" id="" cols="25" rows="4" placeholder="三十个字以内"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><input type="submit" name="提交" /></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="pwd">
                                <form action="">
                                    <table>
                                        <tr>
                                            <td align="right">原密码：</td>
                                            <td><input type="password" name="" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">新密码：</td>
                                            <td><input type="password" name=""/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">确认密码：</td>
                                            <td><input type="password" name=""/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><input type="submit" name="提交" /></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
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