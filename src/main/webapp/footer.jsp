<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>尾部</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/admin-login.js"></script>
</head>
<body>
 <!-- 管理员登陆框 -->
<div class="mloginmodal">
    <div class="mlogin">
        <div class="left">
            <img src="images/loginbg.jpg"/>
        </div>
        <div class="right">
            <form id="mlogin_form">
                <table>
                    <tr>
                        <td colspan="2" align="left"><span class="title">管理员登录</span></td>
                        <td><span class="close" ><a href="#" onclick="mloginshow()"> X </a></span></td>
                    </tr>
                    <tr>
                        <td colspan="3"><hr/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" name="mname" class="mname" placeholder="请输入ID"/></td>
                        <td class="mname_info error"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="password" name="mpwd" class="mpwd" placeholder="请输入密码"/></td>
                        <td class="mpwd_info error"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div id="mslider" class="slider"></div><input type="hidden" class="mslider" value=""/></td>
                        <td class="mslider_info error"></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left"><input type="button" value="管 理 员 登 录" onclick="return mlogin()"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
    <div class="main">
        <div class="footer">
            <p><span>版权所有：闽南师范社区</span>&nbsp;<span>地址：福建省漳州市县前直街36号</span><span>邮编：363000</span></p>
            <p><span><a href="#" onclick="mloginshow()">Administrator：Demon-Yang</a></span>&nbsp;&nbsp;<span>闽ICP备15009579号</span><br></p>
        </div>
	</div>
<script src="js/canvas-nest.min.js" color="47,135,193" opacity="0.5" zindex="-2" count="250"></script>
</body>
</html>