<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学校风景</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .left{
            float: left;
            background-color: #ADADAD;
        }
        .right{
            background-color: #d3d3d3;
        }
        .right ul li{
            display: flex;
        }
        .right ul li img{
            width: 172px;
            height: 101px;
        }
        .right ul li .flex-item{
            margin-top: 30px;
            text-align: center;
            flex: 1;
        }
    </style>
</head>
<body>
<div class="view">
    <div class="main">
        <div class="header">
         	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left"><img border="0" src="images/menu.jpg"><div style="height: 443px;"></div></div>
            <div class="right">
                <ul>
                    <li>
                        <div class="flex-item"><img src="images/view1.gif" alt="综合教学楼"/><p>综合教学楼</p></div>
                        <div class="flex-item"><img src="images/view2.gif" alt="达理楼"/><p>达理楼</p></div>
                        <div class="flex-item"><img src="images/view3.gif" alt="东校门"/><p>东校门</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view4.gif" alt="龙柱"/><p>龙柱</p></div>
                        <div class="flex-item"><img src="images/view5.gif" alt="绿荫校道"/><p>绿荫校道</p></div>
                        <div class="flex-item"><img src="images/view6.gif" alt="创业楼"/><p>创业楼</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view7.gif" alt="学院操场"/><p>学院操场</p></div>
                        <div class="flex-item"><img src="images/view8.gif" alt="达理楼与钻石广场"/><p>达理楼与钻石广场</p></div>
                        <div class="flex-item"><img src="images/view9.gif" alt="学校夜景"/><p>学校夜景</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view10.jpg" alt="综合体育馆"/><p>综合体育馆</p></div>
                        <div class="flex-item"><img src="images/view11.jpg" alt="博文楼" /><p>博文楼</p></div>
                        <div class="flex-item"><img src="images/view12.jpg" alt="创业楼" /><p>创业楼</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view13.jpg" alt="达理楼"/><p>达理楼</p></div>
                        <div class="flex-item"><img src="images/view14.jpg" alt="达理学生公寓"/><p>达理学生公寓</p></div>
                        <div class="flex-item"><img src="images/view15.jpg" alt="石雕标志"/><p>石雕标志</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view16.jpg" alt="读书处"/><p>读书处</p></div>
                        <div class="flex-item"><img src="images/view17.jpg" alt="笃行楼"/><p>笃行楼</p></div>
                        <div class="flex-item"><img src="images/view18.jpg" alt="公寓小河"/><p>公寓小河</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view19.jpg" alt="旧图书馆"/><p>旧图书馆</p></div>
                        <div class="flex-item"><img src="images/view20.jpg" alt="励志楼"/><p>励志楼</p></div>
                        <div class="flex-item"><img src="images/view21.jpg" alt="瑞京学生公寓"/><p>瑞京学生公寓</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view22.jpg" alt="创业楼"/><p>创业楼</p></div>
                        <div class="flex-item"><img src="images/view23.jpg" alt="石桥"/><p>石桥</p></div>
                        <div class="flex-item"><img src="images/view24.jpg" alt="西区校道"/><p>西区校道</p></div>
                    </li>
                    <li>
                        <div class="flex-item"><img src="images/view25.jpg" alt="逸夫楼"/><p>逸夫楼</p></div>
                        <div class="flex-item"><img src="images/view26.jpg" alt="逸夫图书馆"/><p>逸夫图书馆</p></div>
                        <div class="flex-item"><img src="images/view27.jpg" alt="综合楼"/><p>综合楼</p></div>
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