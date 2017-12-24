<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>闽师社区</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="css/jquery.slider.css" />
 	<link type="text/css" rel="stylesheet" href="css/swiper-3.4.2.min.css"/>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.slider.min.js"></script>
    <script type="text/javascript" src="js/swiper-3.4.2.min.js"></script>
    <script type="text/javascript">
        $(function(){
        	/*请求数据*/
        	$.ajax({
        		type:"get",
        		url:"admin/news/index.do",
        		async:false,
        		success:function(data){}
        	});
            /*头部轮播图*/
            var mySwiper = new Swiper(".swiper-container",{
                autoplay:5000,/*每隔3秒自动播放*/
                loop:true,/*形成环路（即：可以从最后一张图跳转到第一张图*/
                pagination:".swiper-pagination",/*分页器*/
                autoplayDisableOnInteraction:false,
                paginationClickable:true,
                effect : 'fade',
                fade: {
                    crossFade: true,
                },
                speed:2000,
            });
            $('.swiper-container').mouseover(function(){
                mySwiper.stopAutoplay();
            });
            $('.swiper-container').mouseout(function(){
                mySwiper.startAutoplay();
            });

            /*专题轮播图*/
             var t1;
            $(".container .mnnu .prev").click(function(){
                if($(".container .mnnu .slides ul").css("left") == "0px")
                    $(".container .mnnu .slides ul").animate({left: "-245px"}, 700);
                else
                    $(".container .mnnu .slides ul").animate({left: "0"}, 700);
            });
            $(".container .mnnu .next").click(function(){
                if($(".container .mnnu .slides ul").css("left") == "0px")
                    $(".container .mnnu .slides ul").animate({left:"-245px"},700);
                else
                    $(".container .mnnu .slides ul").animate({left:"0"},700);
            });
            t1 = setInterval("showPic()", 5000);
            $(".container .mnnu .slides").hover(function(){clearInterval(t1)}, function(){t1 = setInterval("showPic()", 5000);});
        });

        /*专题自动切换图片*/
        function showPic(){
            $(".container .mnnu .prev").trigger('click');
        }
    </script>
</head>
<body>
<div class="index">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="images/slide1.jpg" style="width: 1000px;height:350px;"></div>
                    <div class="swiper-slide"><img src="images/slide2.jpg" style="width: 1000px;height:350px;"></div>
                    <div class="swiper-slide"><img src="images/slide3.jpg" style="width: 1000px;height:350px;"></div>
                </div>
                <div class="swiper-pagination"></div><!--分页器-->
            </div>
            <div class="article">
                    <div class="academic">
                        <h3><span class="more"><a href="admin/news/queryList.do?ntype=学术报告">进入&gt;&gt;</a></span>学术报告</h3>
                        <ul>
                        	<c:forEach items="${indexAcadList }" var="acadList">
                            	<li><span class="time">${acadList.ndate }</span><a href="admin/news/findOne.do?nid=${acadList.nid }" target="_blank">${acadList.ntitle }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="mnew">
                        <h3><span class="more"><a href="admin/news/queryList.do?ntype=闽师新闻">进入&gt;&gt;</a></span>闽师新闻</h3>
                        <ul>
                           <c:forEach items="${indexHnewList }" var="hnewList">
                            	<li><span class="time">${hnewList.ndate }</span><a href="admin/news/findOne.do?nid=${hnewList.nid }" target="_blank">${hnewList.ntitle }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="hnew">
                        <h3><span class="more"><a href="admin/news/queryList.do?ntype=热点聚焦">进入&gt;&gt;</a></span>热点聚焦</h3>
                        <ul>
                            <c:forEach items="${indexMnewList }" var="mnewList">
                            	<li><span class="time">${mnewList.ndate }</span><a href="admin/news/findOne.do?nid=${mnewList.nid }" target="_blank">${mnewList.ntitle }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="notice">
                        <h3><span class="more"><a href="admin/news/queryList.do?ntype=通知公告">进入&gt;&gt;</a></span>通知公告</h3>
                        <ul>
                            <c:forEach items="${indexNoticeList }" var="noticeList">
                            	<li><span class="time">${noticeList.ndate }</span><a href="admin/news/findOne.do?nid=${noticeList.nid }" target="_blank">${noticeList.ntitle }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
            </div>
            <div class="mnnu">
                <div class="slides">
                    <ul>
                        <li>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/xlwb.png" ><br>新浪官方微博</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/xywx.jpg" ><br>校友总会微信</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/gzwx.jpg" ><br>公众官方微信</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/twwx.png" ><br>闽师团委微信</a></div>
                        </li>

                        <li>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/msxb.jpg" ><br>闽师校报</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/xsxb.png" ><br>学生信报</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/xytx.jpg" ><br>校友通讯</a></div>
                            <div class="campuses"><a href="javascript:void(0);" ><img src="images/ljqn.jpg" ><br>龙江青年</a></div>
                        </li>
                    </ul>
                    <p class="prev">«</p><p class="next">»</p>
                </div>
                <div class="fastnav">
                    <h3>快速导航</h3>
                    <ul>
                        <li><a href="http://www.mnnu.edu.cn/" target="_blank"> 闽师官网 </a>&nbsp;&nbsp;&nbsp;<a href="http://teach.mnnu.edu.cn" target="_blank"> 教务系统 </a></li>
                        <li><a href="http://211.80.176.69/xgxt/" target="_blank"> 信息系统 </a>&nbsp;&nbsp;&nbsp;<a href="http://xyh.mnnu.edu.cn/" target="_blank"> 校友工作 </a></li>
                        <li><a href="http://lib.mnnu.edu.cn/" target="_blank"> 图书资源 </a>&nbsp;&nbsp;&nbsp;<a href="http://net.mnnu.edu.cn/" target="_blank"> 网络服务 </a></li>
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