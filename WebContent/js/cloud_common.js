document.write(" <script language=\"javascript\" src=\"js/jquery.rotate.min.js \" > <\/script>"); 
 
    $(document).ready(
        function () {
            
        //setMoveLine("cloud1",640,15,10);
        //setBiggerSmaller("cloud2",1,0.1,2000,3000);
        //setFadeTo("cloud2",0,1,2000,3000);
        //setRotate("img",200);
        //setRotateLeftRight("img",-20,20,1100,1100);
        }
    );

/**
*隐藏ID，并且清楚掉interval
*/
var stopDisplayAnimate = function(id,intervalObj){
//	$("#" + id).hide();
	clearInterval(intervalObj);
};


/**
*id:定义移动的是哪个id
*totalWidth:定义该元素移动的最大距离
*height:定义该元素的的位置高度
*widthPreSecond:定义每秒钟移动的宽度(整数值表示从左到右，负数值表示从右到左)
*例子：setMoveLine("cloud1",640,15,10);
*/
var setMoveLine = function(id,totalWidth,speed,interval){
		$("#" + id).css({"position": "absolute","overflow": "hidden","left":("-" + $("#" + id).css("width"))});
		$("#" + id).animate({"left" : totalWidth + "px"},speed);
    return setInterval(function flutter() {
        $("#" + id).css({"left":("-" + $("#" + id).css("width")),"position": "absolute"});
        $("#" + id).animate({"left" : totalWidth + "px"},speed);
    }, interval + speed);
};
/**
* 图片缩放
* id:定义放大缩小的id
* minScope:定义图片的变化的初始比例大小
* maxScope: 定义图片最大的比例
* spend:定义变化的速度，单位是毫秒
* interval:定义两次变化的时间间隔，单位是毫秒
**/
var setBiggerSmaller = function(id,minScope,maxScope,speed,interval){
		var img_w = $("#" + id).width();//图片宽度 
    var img_h = $("#" + id).height();//图片高度 
    var minWidth = img_w * minScope; 
    var minHeight = img_h * minScope;
    var maxWidth = img_w * maxScope; 
    var maxHeight = img_h * maxScope; 
    $("#" + id).css({"width":minWidth,"height":minHeight});
    $("#" + id).animate({"width":maxWidth,"height":maxHeight},speed);   
    setInterval(function flutter() {
       $("#" + id).css({"width":minWidth,"height":minHeight});
       $("#" + id).animate({"width":maxWidth,"height":maxHeight},speed);
    }, interval + speed);
};
/**
*
*	id:定义放大缩小的id
* minFade:初始渐变率(0-1)
* maxFade:最大渐变率
**/
var setFadeTo = function(id,minFade,maxFade,speed,interval){
		var fade = minFade;
    $("#" + id).fadeTo(speed,fade);   
    setInterval(function flutter() {
    	if(fade == minFade){
    		fade = maxFade;
    	}else{
    		fade = minFade;
    	}
       $("#" + id).fadeTo(speed,fade);
    }, interval + speed);
};

/**
* 旋转
*/
var setRotate = function(id,speed){
	var angle = 0; 
	setInterval(function() { 
	    angle += 3; 
	    $("#" + id).rotate(angle); 
	}, 
	speed);
};
/**
* 左右摆动
* minAngle:定义最小摆动值(-360到360)
*/
var setRotateLeftRight = function(id,minAngle,maxAngle,speed,interval){
	var isToggle = 0;
	var startAngle = minAngle;
	var endAngle = maxAngle;  
	$("#" + id).rotate({
		 			angle: 0,
	    		duration:speed,
	        animateTo: maxAngle
	 });
	
    setInterval(function flutter() {
    	if(isToggle == 0){
    		startAngle = maxAngle;
    		endAngle = minAngle;
    		isToggle = 1;
    	}else{
    		startAngle = minAngle;
    		endAngle = maxAngle;
    		isToggle = 0;
    	}
	    $("#" + id).rotate({ 
	    		//duration:speed,
	        angle: startAngle, 
	        animateTo: endAngle
	    });
    }, interval + speed);
};