function renderpager(pagenumber, pagecount,cid) {
    //创建分页列表
    var $pager = $('<ul class="pages"></ul>');
    //首页
    if(pagenumber > 1)
    	$pager.append('<li class="pgNext"><a href="javascript:void(0)" onclick="queryReply(this,'+cid+',1)">首页 </a></li>');
    else
    	$pager.append('<li class="pgNext pgEmpty"><a href="javascript:void(0)">首页 </a></li>');
    //上一页
    if(pagenumber > 1)
    	$pager.append('<li class="pgNext"><a href="javascript:void(0)" onclick="queryReply(this,'+cid+','+(pagenumber-1)+')">上一页 </a></li>');
    else
    	$pager.append('<li class="pgNext pgEmpty"><a href="javascript:void(0)">上一页</a></li>');
    //数字页
    var startPoint = 1;
    var endPoint = 5;
    if (pagenumber >= 5) {
        startPoint = pagenumber - 2;
        endPoint = pagenumber + 2;
    }
    if (endPoint > pagecount) {
        startPoint = pagecount - 4;
        endPoint = pagecount;
    }
    if (startPoint < 1) {
        startPoint = 1;
    }
    for (var page = startPoint; page <= endPoint; page++) {
        var currentButton = $('<li class="page-number"><a href="javascript:void(0)" onclick="queryReply(this,'+cid+','+(page)+')">' + (page) + '</a></li>');
        if(page == pagenumber){
        	currentButton = $('<li class="page-number pgCurrent"><a href="javascript:void(0)">' + (page) + '</a></li>');
        } 
        currentButton.appendTo($pager);
    }
    //下一页
    if(pagenumber < pagecount)
    	$pager.append('<li class="pgNext"><a href="javascript:void(0)"  onclick="queryReply(this,'+cid+','+(pagenumber+1)+')">下一页 </a></li>');
    else
    	$pager.append('<li class="pgNext pgEmpty"><a href="javascript:void(0)">下一页 </a></li>');
    //末页
    if(pagenumber < pagecount)
    	$pager.append('<li class="pgNext"><a href="javascript:void(0)"  onclick="queryReply(this,'+cid+','+pagecount+')">末页 </a></li>');
    else
    	$pager.append('<li class="pgNext pgEmpty"><a href="javascript:void(0)">末页 </a></li>');
    
    return $pager;
}
function queryReply(reply,cid,pagenumber){
	$.ajax({
   		type:"get",
   		url:"reply/queryReply.do",
   		dataType:"json",
   		async:"false",
   		data:{cid:cid,pageNum:pagenumber},
   		success:function(data){
   			$(reply).parents(".answer").prev('.lists').empty();
   				$.each(data.list,function(index,list){
   					$(reply).parents(".answer").prev('.lists').append(
       						"<li class='list'>"+
                            "<img src='"+list.from.uportrait+"' class='face'>"+
                            "<span class='total'>"+
                            	"<span class='from'>"+list.from.uname+"</span> :回复  <span class='to'>"+list.to.uname+"</span>:&nbsp;"+
                            	"<span class='content'>"+list.reply.rcontent+"</span>"+
                            "</span>"+
                            "<p align='right'>"+list.reply.rdate+"&nbsp;<span class='replyOne' onclick='rshow(this,\""+list.from.uname+"\","+list.from.uid+")'>回复</span>&nbsp;&nbsp;</p>"+
                            "<hr/>"+
                            "</li>");
   				});
   				$(reply).parents(".answer").find(".pager").html(renderpager(data.pageNum,data.pages,cid));
   		}
   	}); 
}