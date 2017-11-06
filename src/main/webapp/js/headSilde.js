$(function(){
    /*导航栏旋转效果*/
    $(".header .menu > ul > li").hover(function(){
        $(".header .menu li:hover .submenu li").css({"opacity":"1","transform":"rotateY(0deg)","-moz-transform":"rotateY(0deg)",
            "-ms-transform":"rotateY(0deg)","-o-transform":"rotateY(0deg)","-webkit-transform":"rotateY(0deg)"});
    },function(){
        $(".header .submenu li").css({"opacity":"0","transform":"rotateY(90deg)","-moz-transform":"rotateY(90deg)",
            "-ms-transform":"rotateY(90deg)","-o-transform":"rotateY(90deg)","-webkit-transform":"rotateY(90deg)"});
    });
})


