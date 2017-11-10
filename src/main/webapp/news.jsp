<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻热点</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="news">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div style="padding: 5px 20px; height: 15px;"></div>
            <div class="left">
                <span>闽师新闻</span>
                <ul>
                    <li><a href="#">我校召开座谈会 深入学习习近平深入...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                </ul>
                <img src="images/newsline1.gif">
                <span>热点聚焦</span>
                <ul>
                    <li><a href="#">我校召开座谈会 深入学习习近平深入...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                </ul>
                <img src="images/newsline2.gif">
                <span>学术报告</span>
                <ul>
                    <li><a href="#">我校召开座谈会 深入学习习近平深入...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                </ul>
                <img src="images/newsline1.gif">
                <span>重要通知</span>
                <ul>
                    <li><a href="#">我校召开座谈会 深入学习习近平深入...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                    <li><a href="#">不忘初心  牢记使命——中大师大师...</a></li>
                </ul>
                <img src="images/newsline3.gif">
            </div>
            <div class="right">
                <p class="loca"><a href="http://news2.sysu.edu.cn/index.htm">首页</a>» ${news.ntype } </p>
                <div class="cont">
                    <h1 align="center">${news.ntitle }</h1>
                    <hr size="1" noshade="noshade">
                    <p align="center" style="font-size:12px;color:#666666">稿件来源：闽南师大社区 | 发布日期：${news.ndate } </p>
                    <div class="article">
           				${news.ncontent }
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