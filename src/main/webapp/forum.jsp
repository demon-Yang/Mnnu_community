<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>闽师论坛</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            setInterval(function(){
                if( $(window).scrollTop() > 186){
                    var topvalue = $(window).scrollTop()-185;
                    $(".container .right").css({"position":"absolute","top":""+topvalue+"px","left":"700px"});
                }else{
                    $(".container .right").css({"position":"static"});
                }
            },500);
          })
    </script>
</head>
<body>
<div class="forum">
    <div class="main">
        <div class="header">
          	<jsp:include page="header.jsp"></jsp:include>
        </div>
        <div class="container">
            <div class="left">
                <div class="itab">
                    <ul>
                        <li><a href="#" >技术论坛</a></li>
                        <li><a href="#" class="selected">生活贴吧</a></li>
                    </ul>
                </div>
                <a href="#" class="post">发帖</a>
                <div class="seraches">
                    <form>
                        <select>
                            <option>按用户名查找</option>
                            <option>按关键字查找</option>
                        </select>
                        <input type="text" name=""  placeholder="关键字"/>&nbsp;&nbsp;<input type="submit" value="搜索"/>
                    </form>
                </div>
                <hr>
                <div class="list">
                    <ul>
                        <li>
                            <h2><a>生活中有哪些容易被忽略，但其实很有趣的小事？</a></h2>
                            <span class="reply">100</span>&nbsp;
                            <span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span>
                            <div class="notes">
                                <img src="images/forum1.jpg">
                                <span>
                                    大学刚毕业那会去昆明工作，寄住在我一叔叔家（我爸的朋友），
                                    他家有两个小孩子，小的那个才刚学会走路，说话咿咿呀呀。
                                    萌萌的， 刚来那天晚上我洗完澡想找吹风机没找到，叔叔他
                                    们都回房间了，也不好意思问，所以我拿着毛巾一边擦头发一边来到大厅，小屁孩…
                                </span>
                            </div>
                            <div style="clear: both;"></div>
                            <p align="right">2017-10-28</p>
                            <hr>
                        </li>
                        <li>
                            <h2><a>生活中有哪些容易被忽略，但其实很有趣的小事？</a></h2>
                            <span class="reply">100</span>&nbsp;
                            <span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span>
                            <div class="notes">

                                <span>
                                    大学刚毕业那会去昆明工作，寄住在我一叔叔家（我爸的朋友），
                                    他家有两个小孩子，小的那个才刚学会走路，说话咿咿呀呀。
                                    萌萌的， 刚来那天晚上我洗完澡想找吹风机没找到，叔叔他
                                    们都回房间了，也不好意思问，所以我拿着毛巾一边擦头发一边来到大厅，小屁孩…
                                </span>
                            </div>
                            <div style="clear: both;"></div>
                            <p align="right">2017-10-28</p>
                            <hr>
                        </li>
                        <li>
                            <h2><a>生活中有哪些容易被忽略，但其实很有趣的小事？</a></h2>
                            <span class="reply">100</span>&nbsp;
                            <span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span>
                            <div class="notes">
                                <img src="images/forum1.jpg">
                                <span>
                                    大学刚毕业那会去昆明工作，寄住在我一叔叔家（我爸的朋友），
                                    他家有两个小孩子，小的那个才刚学会走路，说话咿咿呀呀。
                                    萌萌的， 刚来那天晚上我洗完澡想找吹风机没找到，叔叔他
                                    们都回房间了，也不好意思问，所以我拿着毛巾一边擦头发一边来到大厅，小屁孩…
                                </span>
                            </div>
                            <div style="clear: both;"></div>
                            <p align="right">2017-10-28</p>
                            <hr>
                        </li>
                        <li>
                            <h2><a>生活中有哪些容易被忽略，但其实很有趣的小事？</a></h2>
                            <span class="reply">100</span>&nbsp;
                            <span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span>
                            <div class="notes">
                                <img src="images/forum1.jpg">
                                <span style="font-size: 14px;">
                                    大学刚毕业那会去昆明工作，寄住在我一叔叔家（我爸的朋友），
                                    他家有两个小孩子，小的那个才刚学会走路，说话咿咿呀呀。
                                    萌萌的， 刚来那天晚上我洗完澡想找吹风机没找到，叔叔他
                                    们都回房间了，也不好意思问，所以我拿着毛巾一边擦头发一边来到大厅，小屁孩…
                                </span>
                            </div>
                            <div style="clear: both;"></div>
                            <p align="right">2017-10-28</p>
                            <hr>
                        </li>
                        <li>
                            <h2><a>生活中有哪些容易被忽略，但其实很有趣的小事？</a></h2>
                            <span class="reply">100</span>&nbsp;
                            <span class="name">杨先生：</span> <span class="motto"> 弹吉他 健身 唱歌 讲故事</span>
                            <div class="notes">
                                <img src="images/forum1.jpg">
                                <span style="font-size: 14px;">
                                    大学刚毕业那会去昆明工作，寄住在我一叔叔家（我爸的朋友），
                                    他家有两个小孩子，小的那个才刚学会走路，说话咿咿呀呀。
                                    萌萌的， 刚来那天晚上我洗完澡想找吹风机没找到，叔叔他
                                    们都回房间了，也不好意思问，所以我拿着毛巾一边擦头发一边来到大厅，小屁孩…
                                </span>
                            </div>
                            <div style="clear: both;"></div>
                            <p align="right">2017-10-28</p>
                            <hr>
                        </li>
                    </ul>
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