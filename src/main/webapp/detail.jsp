<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>论坛评论</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="kindeditor/kindeditor-all-min.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            K.create('#editor', {
                width : '660px',
                uploadJson : '../jsp/upload_json.jsp',
                fileManagerJson : '../jsp/file_manager_json.jsp',
                allowFileManager : true
            });
        });
        $(function(){
            setInterval(function(){
                if( $(window).scrollTop() > 186){
                    var topvalue = $(window).scrollTop()-185;
                    $(".container .right").css({"position":"absolute","top":""+topvalue+"px","left":"700px"});
                }else{
                    $(".container .right").css({"position":"static"});
                }
            },500);

          $(".retract").click(function(){
              if($(this).text() == "回复")
                    $(this).text("收取回复");
              else
                    $(this).text("回复");
              $(this).parent().parent().next().slideToggle(1000);
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
</head>
<body>
<div class="detail">
    <div class="main">
        <div class="header">
            <jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left">
                <div class="landlord">
                    <div class="img"><img src="images/detail1.jpg"/></div>
                    <div class="info"><p class="name">杨先生</p><p class="motto"> 弹吉他 健身 唱歌 讲故事,弹吉他 健身 唱歌 讲故事</p></div>
                    <p align="right"><button class="gocomment">我要评论</button><span class="type">生活兴趣类</span>&nbsp;当前评论人数：<span class="reply">100</span></p>
                    <hr/>
                    <p class="title">从大明王朝看年轻人如何职场从大明王朝看年轻人</p>
                    <hr/>
                    <p class="content">钻孔是补碗的关键，在碗的裂缝两侧钻上对应的小孔。左手握牵钻，
                        右手捏拉杆，拉杆左右拉，牵钻正反转，左手腕悬空使劲，控制钻孔的
                        深度，小孔的深度要合适，两孔之间的距离要精确。这手艺活，很讲究精
                        巧，钻孔的架势极像拉二胡由于碗的质地又硬又滑，所以钻头常常需用唾液
                        来降温。再用小铜锤将蚂蝗攀的两个头，紧紧嵌入小孔内。蚂蝗攀的长度略
                        小于两个小孔，不然蚂蝗攀就钉不紧密，要漏水的。打蚂蝗攀全靠手感，重了
                        碗要碎，轻了易松动。</p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/detail2.jpg">
                 </div>
                <div class="comments">
                     <ul>
                        <li class="per">
                            <div class="inleft">
                                <img src="images/detail1.jpg"><p class="name" align="center">沈卓盈</p>
                            </div>
                            <div class="inright">
                                <div class="comment">
                                    <p>终于有人回应了，谢谢关照</p>
                                    <img src="images/symbol3.png">
                                    <div class="empty"></div>
                                    <div><p align="right">2017-09-30 16:59&nbsp;&nbsp;<span class="retract">&nbsp;收起回复&nbsp;&nbsp;</span></p></div>
                                    <div class="reply">
                                        <ul>
                                            <li>
                                                <img src="images/detail1.jpg" class="face">
                                                <span class="total"><span class="from">法拉诗韵:</span> 回复  <span class="to">魄岁月 </span>:华仔哈哈哈，你好你好</span>
                                                <p align="right">2014-9-27 09:34&nbsp;回复&nbsp;&nbsp;</p>
                                                <hr/>
                                            </li>
                                            <li>
                                                <img src="images/detail1.jpg" class="face">
                                                <span class="total"><span class="from">法拉诗韵:</span> 回复  <span class="to">魄岁月 </span>:华仔哈哈哈，你好你好</span>
                                                <p align="right">2014-9-27 09:34&nbsp;回复&nbsp;&nbsp;</p>
                                                <hr/>
                                            </li>
                                        </ul>
                                        <div class="answer">
                                            <div class="message" contentEditable='true'></div>
                                            <span><img src="images/qqface/1.gif" id="emo"></span>
                                            <div class="emotions">
                                                <ul>
                                                    <li><img src="images/qqface/1.gif" title="[可爱]"></li>
                                                    <li><img src="images/qqface/1.gif" title="[可爱]"></li>
                                                    <li><img src="images/qqface/1.gif" title="[可爱]"></li>
                                                    <li><img src="images/qqface/1.gif" title="[可爱]"></li>
                                                    <li><img src="images/qqface/2.gif" title="[可怜]"></li>
                                                    <li><img src="images/qqface/3.gif" title="[挖鼻屎]"></li>
                                                    <li><img src="images/qqface/4.gif" title="[吃惊]"></li>
                                                    <li><img src="images/qqface/5.gif" title="[害羞]"></li>
                                                    <li><img src="images/qqface/6.gif" title="[挤眼]"></li>
                                                    <li><img src="images/qqface/7.gif" title="[闭嘴]"></li>
                                                    <li><img src="images/qqface/7.gif" title="[闭嘴]"></li>
                                                </ul>
                                            </div>
                                            <button class="send">发表</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </li>
                     </ul>
                </div>
                <div class="edit">
                    <p>发表评论</p>
                    <div class="content">
                        <form action="">
                        <textarea name="" id="editor"></textarea>
                            <input type="submit" value="提交"/>
                        </form>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="hot">
                    <p>论坛·热搜</p>
                    <hr>
                    <ul>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
                        </li>
                        <li>
                            <img src="images/forum2.jpg"/>
                            <span><a>从大明王朝看年轻人如何职场从大明王朝看年轻人</a></span>
                            <div style="clear: both;"></div>
                            <p align="right"><span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span></p>
                            <hr/>
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