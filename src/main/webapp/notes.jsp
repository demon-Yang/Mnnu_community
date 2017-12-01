<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言表白</title>
   	<link type="text/css" rel="stylesheet" href="css/style.css"/>
    <style type="text/css">
        #wish{height:815px;margin-top:15px;position:relative;width:1000px;border-radius: 5px;}
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
        	<input type="date" id="serachText"/>
        	<input type="button" id="serach" value="搜索" onclick="seraches()"/>
            <ul id="wish">
            	<c:forEach items="${notes }" var="note">
	                <li><div class="text">${note.ncontent }</div></li>
                </c:forEach>
            </ul>
            <div class="edit">
                <div class="gowish">
                    <div class="message" contenteditable="true"></div>
                    <span><img src="images/qqface/1.gif" id="emo"></span>
                    <div class="emotions">
                       <jsp:include page="qqFace.jsp"></jsp:include>
                    </div>
                    <span id="error"></span>
                    <input type="button" value="我要上墙" id="submit" onclick="return insert()"/>
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
        //发表留言
         function insert(){
    	 var uid = '${user.uid}';
		 if(uid == 0){
			 loginshow();
			 return false;
		 } 

		 var length = ((String)($(".message").text())).trim().length;
		 var ncontent = (String)($(".message").html());
		 //判断是否有表情
		 var img = ncontent.match(/<img.*?(?:>|\/>)/gi);
		 //有表情长度增加
		 if(img != null)
		 	length = length + img.length;
		 if(length == 0){
			 $("#error").text("温馨提示：留言不能为空哟！！");
			 return false;
		 }
		 if(ncontent.length > 400){
			 $("#error").text("温馨提示：一个表情算30个字，输入的文字不能超过200个哟！！");
			 return false;
		 }
  	  	 $.ajax({
  	  	 	type:"get",
			 url:"notes/insert.do",
			 data:{ncontent:ncontent},
			 success:function(data){
				 alert("系统提示", "回复成功！", function () {
					 location.reload();
		            }, {type: 'success', confirmButtonText: '确定'});
			 }
  	  	 });
     	}
        //按日期查询
        function seraches(){
        	var ndate = $("#serachText").val();
        	$.ajax({
        		type:"get",
        		url:"notes/queryByDate.do",
        		data:{ndate:ndate},
        		success:function(data){
        			location.reload();
        		}
        	});
        }
</script>
</body>
</html>