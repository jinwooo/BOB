$(function(){
    var button = $('.button');

    function switchToNext(){
        var _this = $(this);
        
        if(_this.hasClass('active'))
            return false;
        else {
            $('.button.active').removeClass('active');
            _this.addClass('active');
            
        }
    }
    
    button.on('click',switchToNext);
    
    var date_result = $("#choice_date").attr("value");
    
    $("#btn01").click(function(){
    	$("#chart_result").css("border","none").css("min-width", "500px").css("width","auto").css("height","400px").css("scrolling","no");
    	$("#chart_result").attr("src","chart03.do?user_id=test&date="+date_result);
    });

    $("#btn02").click(function(){
    	$("#chart_result").removeAttr("style");
    	$("#chart_result").css("border","none").css("width","800px").css("height","400px").css("scrolling","no");
    	$("#chart_result").attr("src","chart04.do?user_id=test");
    });
    
});