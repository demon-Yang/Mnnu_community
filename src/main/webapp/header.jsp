<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>头部</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
  	<link type="text/css" rel="stylesheet" href="css/jquery.slider.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.slider.min.js"></script>
   	<script type="text/javascript" src="js/header.js"></script>

</head>
<body>
    <!-- 登陆框 -->
<div class="loginmodal">
    <div class="login">
        <div class="left">
            <img src="images/loginbg.jpg"/>
        </div>
        <div class="right">
            <form action="">
                <table>
                    <tr>
                        <td colspan="2" align="left"><span class="title">登录</span></td>
                        <td><span class="close" ><a href="#" onclick="loginshow()"> X </a></span></td>
                    </tr>
                    <tr>
                        <td colspan="3"><hr/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" name="" placeholder="请输入邮箱账号"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="password" name="" placeholder="请输入密码"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><span class="nocount">没账号？</span><a href="#" class="registernow"  onclick="registershow()">立即注册</a></td>
                        <td><a href="#" class="forget" onclick="forgetpwdshow()">忘记密码？</a></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div id="slider" class="slider"></div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left"><input type="submit" value="登录"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
    <!-- 注册框 -->
<div class="registermodal">
	<div class="register">
	    <div class="left">
	        <img src="images/loginbg.jpg"/>
	    </div>
	    <div class="right">
	        <form action="">
	            <table>
	                <tr>
	                    <td align="left"><span class="title">注册</span></td>
	                    <td><span class="close"><a href="#" onclick="registershow()"> X </a></span></td>
	                </tr>
	                <tr>
	                    <td colspan="2"><hr/></td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="" placeholder="请输入用户ID"/></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><input type="email" name="" placeholder="请输入邮箱账号"/></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="" placeholder="请输入密码"/></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="" placeholder="请确认密码"/></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>
	                        <input type="button" class="rsend" value="发送验证码" onclick="rcountdown()" /><input type="text" name="" id="vcode" placeholder="请输入验证码"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td colspan="1"><input type="button" value="返回" id="rreturn" onclick="loginshow()"/></td>
	                    <td align="left"><input type="submit" value="提交"/></td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>
</div>
	<!-- 忘记密码框 -->
<div class="forgetpwdmodal">
	<div class="forgetpwd">
	    <div class="left">
	        <img src="images/loginbg.jpg"/>
	    </div>
	    <div class="right">
	        <form action="">
	            <table>
	                <tr>
	                    <td align="left"><span class="title">找回密码</span></td>
	                    <td><span class="close"><a href="#" onclick="forgetpwdshow()"> X </a></span> </td>
	                </tr>
	                <tr>
	                    <td colspan="2"><hr/></td>
	                </tr>
	                <tr>
	                    <td><input type="email" name="" placeholder="请输入邮箱账号"/></td>
	
	                </tr>
	                <tr>
	                    <td align="left">
	                        <input type="button" class="fsend" value="发送验证码" onclick="fcountdown()" />
	                    </td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="" placeholder="请输入验证码"/></td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td colspan="1"><input type="button" value="返回" id="freturn" onclick="loginshow()"/></td>
	                    <td colspan="2" align="left"><input type="submit" value="提交"/></td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>
</div>
	<!--   头部 -->
<div class="main">
    <div class="header">
        <div class="img"></div>
        <div class="menu">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="#">魅力·闽师</a>
                    <ul class="submenu">
                        <li><a href="#">闽师简介</a></li>
                        <li><a href="#">闽师风景</a></li>
                        <li><a href="#">闽师校徽</a></li>
                    </ul>
                </li>
                <li><a href="#">新闻·热点</a>
                    <ul class="submenu">
                        <li><a href="#">闽师热点</a></li>
                        <li><a href="#">学术报告</a></li>
                        <li><a href="#">重要通知</a></li>
                    </ul>
                </li>
                <li><a href="#">技术·论坛</a>
                    <ul class="submenu">
                        <li><a href="#">学习论坛</a></li>
                        <li><a href="#">生活贴吧</a></li>
                    </ul>
                </li>
                <li><a href="#">物品·市场</a>
                    <ul class="submenu">
                        <li><a href="#">共享图书</a></li>
                        <li><a href="#">二手市场</a></li>
                    </ul>
                </li>
                <li><a href="#">留言·表白</a></li>
                <li><a href="#" onclick="registershow()">注册</a></li>
                <li><a href="#" onclick="loginshow()">登陆</a></li>
            </ul>
        </div>
    </div>
</div> 
</body>
</html>