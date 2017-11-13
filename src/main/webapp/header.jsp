<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>头部</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
  	<link type="text/css" rel="stylesheet" href="css/jquery.slider.css" />
  	<link type="text/css" rel="stylesheet" href="BeAlert/BeAlert.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.slider.min.js"></script>
   	<script type="text/javascript" src="js/header.js"></script>
   	<script type="text/javascript" src="js/login.js"></script>
   	<script type="text/javascript" src="js/register.js"></script>
   	<script type="text/javascript" src="js/forgetpwd.js"></script>
   	<script type="text/javascript" src="BeAlert/BeAlert.js"></script>
</head>
<body>
    <!-- 登陆框 -->
<div class="loginmodal">
    <div class="login">
        <div class="left">
            <img src="images/loginbg.jpg"/>
        </div>
        <div class="right">
            <form id="login_form">
                <table>
                    <tr>
                        <td colspan="2" align="left"><span class="title">登录</span></td>
                        <td><span class="close" ><a href="#" onclick="loginshow()"> X </a></span></td>
                    </tr>
                    <tr>
                        <td colspan="3"><hr/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" name="uemail" class="uemail" placeholder="请输入邮箱账号"/></td>
                        <td class="uemail_info error"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="password" name="upwd" class="upwd" placeholder="请输入密码"/></td>
                        <td class="upwd_info error"></td>
                    </tr>
                    <tr>
                        <td><span class="nocount">没账号？</span><a href="#" class="registernow"  onclick="registershow()">立即注册</a></td>
                        <td><a href="#" class="forget" onclick="forgetpwdshow()">忘记密码？</a></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div id="slider" class="slider"></div><input type="hidden" class="uslider" value=""/></td>
                        <td class="uslider_info error"></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left"><input type="button" value="登录" onclick="return login()"/></td>
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
	        <form id="regsiter_form">
	            <table>
	                <tr>
	                    <td align="left"><span class="title">注册</span></td>
	                    <td><span class="close"><a href="#" onclick="registershow()"> X </a></span></td>
	                </tr>
	                <tr>
	                    <td colspan="2"><hr/></td>
	                </tr>
	                 <tr>
	                    <td><input type="text" name="uemail" class="uemail" placeholder="  请输入邮箱账号"/></td>
	                    <td class="uemail_info error"></td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="uname" class="uname" placeholder="  请输入用户名"/></td>
	                    <td class="uname_info error"></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="upwd" class="upwd" placeholder="请输入密码"/></td>
	                    <td class="upwd_info error"></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="urpwd" class="urpwd" placeholder="请确认密码"/></td>
	                    <td class="urpwd_info error"></td>
	                </tr>
	                <tr>
	                    <td>
	                        <input type="button" class="rsend" value="发送验证码"/><input type="text" id="rvcode" class="uvcode" placeholder="请输入验证码"/>
	                    </td>
	                    <td class="uvcode_info error"></td>
	                </tr>
	                <tr>
	                    <td><input type="button" value="返回" id="rreturn" onclick="loginshow()"/></td>
	                    <td align="left"><input type="button" id="rsubmit" value="提交" onclick="return register()"/></td>
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
	        <form id="forgetpwd_form">
	            <table>
	                <tr>
	                    <td align="left"><span class="title">找回密码</span></td>
	                    <td><span class="close"><a href="#" onclick="forgetpwdshow()"> X </a></span> </td>
	                </tr>
	                <tr>
	                    <td colspan="2"><hr/></td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="uemail" class="uemail" placeholder="请输入邮箱账号"/></td>
						<td class="uemail_info error"></td>
	                </tr>
	                <tr>
	                    <td align="left">
	                        <input type="button" class="fsend" value="发送验证码"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td><input type="text" name="uvcode" class="uvcode" placeholder="请输入验证码"/></td>
	                    <td class="uvcode_info error"></td>
	                </tr>
	                <tr>
	                    <td colspan="1"><input type="button" value="返回" id="freturn" onclick="loginshow()"/></td>
	                    <td colspan="2" align="left"><input type="button" id="fsubmit" value="提交" onclick="return forgetpwd()"/></td>
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
                <li><a href="index.jsp">首页</a></li>
                <li><a href="#">魅力·闽师</a>
                    <ul class="submenu">
                        <li><a href="introduce.jsp">闽师简介</a></li>
                        <li><a href="view.jsp">闽师风景</a></li>
                        <li><a href="symbol.jsp">闽师校徽</a></li>
                    </ul>
                </li>
                <li><a href="#">新闻·热点</a>
                    <ul class="submenu">
                        <li><a href="newslist.jsp">闽师新闻</a></li>
                        <li><a href="newslist.jsp">学术报告</a></li>
                        <li><a href="newslist.jsp">热点聚焦</a></li>
                        <li><a href="newslist.jsp">通知公告</a></li>
                    </ul>
                </li>
                <li><a href="#">技术·论坛</a>
                    <ul class="submenu">
                        <li><a href="forum.jsp">学习论坛</a></li>
                        <li><a href="forum.jsp">生活贴吧</a></li>
                    </ul>
                </li>
                <li><a href="#">物品·市场</a>
                    <ul class="submenu">
                        <li><a href="market.jsp">共享图书</a></li>
                        <li><a href="market.jsp">二手市场</a></li>
                    </ul>
                </li>
                <li><a href="notes.jsp">留言·表白</a></li>
                <c:if test="${user == null}">
	                <li><a href="#" onclick="registershow()">注册</a></li>
	                <li><a href="#" onclick="loginshow()">登陆</a></li>
	            </c:if>
	            <c:if test="${user != null}">
	                <li><a href="#" onclick="loginout()">退出登录</a></li>
	                <li style="width:34px;"><a href="person.jsp" ><img src="${user.uportrait }"></a></li>
	            </c:if>
            </ul>
        </div>
    </div>
</div> 
</body>
</html>