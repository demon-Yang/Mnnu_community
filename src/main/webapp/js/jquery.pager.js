    function renderpager(pagenumber, pagecount) {
        //创建分页列表
        var $pager = $('<ul class="pages"></ul>');
        //首页
        $pager.append('<li class="pgNext"><a href="javascript:void(0)">首页 </a></li>');
        //上一页
        if(pagenumber > 1)
        	$pager.append('<li class="pgNext"><a href="#">上一页 </a></li>');
        else
        	$pager.append('<li class="pgNext pgEmpty"><a href="#">上一页</a></li>');
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
            var currentButton = $('<li class="page-number"><a href="#">' + (page) + '</a></li>');
            if(page == pagenumber){
            	currentButton = $('<li class="page-number pgCurrent"><a href="#">' + (page) + '</a></li>');
            } 
            currentButton.appendTo($pager);
        }
        //下一页
        if(pagenumber < pagecount)
        	$pager.append('<li class="pgNext"><a href="#">下一页 </a></li>');
        else
        	$pager.append('<li class="pgNext pgEmpty"><a href="#">下一页 </a></li>');
        //末页
        $pager.append('<li class="pgNext"><a href="#">末页 </a></li>');
        
        return $pager;
    }