
$(function(){
	$("#bobmanager_button").on("click", function() {
		  $(this).html('선택 완료');
		  $(this).css('background-color', '#8AC4E3');
		  
		  
		  setTimeout(function() {
		    $("#bobmanager_button").html('선 택');
		    $("#bobmanager_button").css('background-color', '#F28169');
		    }, 1500)
		    var user = $("#user_id").attr("value");
		  
		  	var date = $("#choice_date").attr("value");

	        
		  	$("#menutype_result_morning").attr("src","menutype.do?user_id=1234&type=morning&bm_date="+date);
		  	$("#menutype_result_lunch").attr("src","menutype.do?user_id=1234&type=lunch&bm_date="+date);
		  	$("#menutype_result_dinner").attr("src","menutype.do?user_id=1234&type=dinner&bm_date="+date);
		  	
	    	$("#chart_donut").css("border","none").css("min-width", "500px").css("width","auto").css("height","400px").css("scrolling","no");
	    	$("#chart_donut").attr("src","chart03.do?user_id=1234&bm_date="+date+"&type=morning");
	    	
	        $("#chart_bar").css("border","none").css("width","800px").css("height","400px").css("scrolling","no");
	        $("#chart_bar").attr("src","chart04.do?user_id=1234&bm_date="+date);
		});
})
