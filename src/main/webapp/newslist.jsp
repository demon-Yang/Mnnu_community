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
<div class="newslist">
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
                <p class="loca"><a href="#">首页</a>» 学术报告 </p>
                <div class="serach" align="right">
                	<form>
                		<span>文章标题：</span><input type="text" />&nbsp;&nbsp;
                		<span>日期：</span><input type="date"/>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="submit" value="搜索"/>
                	</form>
                </div>
                <hr/>
                <div class="cont">
                	<ul>
                		<li>
                			<span class="title"><span>7</span>我校召开“服务国家特殊需求博士人才培养项目”验收评估工作会</span>&nbsp;&nbsp;
                			<span class="time">2017-10-11</span>
                		</li>
                		<li>
                			<span class="title"><span>13</span>我校召开“服务国家特殊需求博士人才培养项目”验收评估工作会</span>&nbsp;&nbsp;
                			<span class="time">2017-10-11</span>
                		</li>
                		<li>
                			<span class="title"><span>12</span>我校召开“服务国家特殊需求博士人才培养项目”验收评估工作会</span>&nbsp;&nbsp;
                			<span class="time">2017-10-11</span>
                		</li>
                		<li>
                			<span class="title"><span>1</span>不忘初心  牢记使命——中大师大师...</span>&nbsp;&nbsp;
                			<span class="time">2017-10-11</span>
                		</li>
                		<li>
                			<span class="title"><span>1</span>不忘初心  牢记使命——中大师大师...</span>&nbsp;&nbsp;
                			<span class="time">2017-10-11</span>
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