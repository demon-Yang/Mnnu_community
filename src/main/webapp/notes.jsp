<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言表白</title>
   	<link type="text/css" rel="stylesheet" href="css/style.css"/>
    <style type="text/css">
        #wish{height:850px;margin-top:15px;position:relative;width:1000px;background-color: #f4f4f4;border-radius: 5px;background: url("images/notesbg.png") no-repeat;}
        .wish{background:url(images/wishbg.png) no-repeat 0 0;color:#000;height:166px;padding:10px 20px 30px 20px;width:185px;}
        .wish-close{background:url(images/wishclose.png) no-repeat 0 0;display:none;position:absolute;right:5px;top:-5px;width:17px;height:17px;}
        textarea{margin-left: 20px;width: 160px;height: 160px;background-color: #EDEDED; border:0;font-size: 16px;font-family: cursive;}
    </style>
   
</head>
<body>
<div class="notes">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <ul id="wish">
                <li><div class="text">发顺丰的萨福克</div></li>
                <li><div class="text">法撒旦法师法萨芬</div></li>
                <li><div class="text">法师打发斯蒂芬</div></li>
                <li><div class="text">发生日访问</div></li>
                <li><div class="text">VR额污染而温柔</div></li>
            </ul>
            <div class="edit">
                <div class="gowish">
                    <div class="message" contenteditable="true"></div>
                    <span><img src="images/qqface/1.gif" id="emo"></span>
                    <div class="emotions">
                        <ul>
                            <li><img src="images/qqface/1.gif" ></li>
                            <li><img src="images/qqface/2.gif" ></li>
                            <li><img src="images/qqface/3.gif" ></li>
                            <li><img src="images/qqface/4.gif" ></li>
                            <li><img src="images/qqface/5.gif" ></li>
                            <li><img src="images/qqface/6.gif" ></li>
                            <li><img src="images/qqface/7.gif" ></li>
                            <li><img src="images/qqface/8.gif" ></li>
                            <li><img src="images/qqface/9.gif" ></li>
                            <li><img src="images/qqface/10.gif" ></li>
                            <li><img src="images/qqface/11.gif" ></li>
                            <li><img src="images/qqface/12.gif" ></li>
                            <li><img src="images/qqface/13.gif" ></li>
                            <li><img src="images/qqface/14.gif" ></li>
                            <li><img src="images/qqface/15.gif" ></li>
                            <li><img src="images/qqface/16.gif" ></li>
                            <li><img src="images/qqface/17.gif" ></li>
                            <li><img src="images/qqface/18.gif" ></li>
                            <li><img src="images/qqface/19.gif" ></li>
                            <li><img src="images/qqface/20.gif" ></li>
                            <li><img src="images/qqface/21.gif" ></li>
                            <li><img src="images/qqface/22.gif" ></li>
                            <li><img src="images/qqface/23.gif" ></li>
                            <li><img src="images/qqface/24.gif" ></li>
                            <li><img src="images/qqface/25.gif" ></li>
                            <li><img src="images/qqface/26.gif" ></li>
                            <li><img src="images/qqface/27.gif" ></li>
                            <li><img src="images/qqface/28.gif" ></li>
                            <li><img src="images/qqface/29.gif" ></li>
                            <li><img src="images/qqface/30.gif" ></li>
                            <li><img src="images/qqface/31.gif" ></li>
                            <li><img src="images/qqface/32.gif" ></li>
                            <li><img src="images/qqface/33.gif" ></li>
                            <li><img src="images/qqface/34.gif" ></li>
                            <li><img src="images/qqface/35.gif" ></li>
                            <li><img src="images/qqface/36.gif" ></li>
                            <li><img src="images/qqface/37.gif" ></li>
                            <li><img src="images/qqface/38.gif" ></li>
                            <li><img src="images/qqface/39.gif" ></li>
                            <li><img src="images/qqface/40.gif" ></li>
                            <li><img src="images/qqface/41.gif" ></li>
                            <li><img src="images/qqface/42.gif" ></li>
                            <li><img src="images/qqface/43.gif" ></li>
                            <li><img src="images/qqface/44.gif" ></li>
                            <li><img src="images/qqface/45.gif" ></li>
                            <li><img src="images/qqface/46.gif" ></li>
                            <li><img src="images/qqface/47.gif" ></li>
                            <li><img src="images/qqface/48.gif" ></li>
                            <li><img src="images/qqface/49.gif" ></li>
                            <li><img src="images/qqface/50.gif" ></li>
                            <li><img src="images/qqface/51.gif" ></li>
                        </ul>
                    </div>
                    <input type="button" value="我要上墙" id="submit"/>
                </div>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/wish.js"></script>
 <script type="text/javascript">
        $(function(){
            /*留言板*/
            $('#wish').wish();
            $('.wish').draggable({containment:'#wish',scroll:false});


            $("#submit").click(function(){
                var str = $(".message").html();
                $("#wish").append("<li><div class='text'>"+str+"</div></li>");

            });
            //点击小图片，显示表情
            $("#emo").click(function(e){
                $(".emotions").slideDown(500);//慢慢向下展开
                e.stopPropagation();   //阻止冒泡事件
            });

            //在桌面任意地方点击，他是关闭
            $(document).click(function(){
                $(".emotions").slideUp(500);//慢慢向上收
            });

            //点击小图标时，添加功能
            $(".emotions ul li").click(function(){
                var simg=$(this).find("img").clone();
                $(".message").append(simg);
            });
        })
</script>
</body>
</html>