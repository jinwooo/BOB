
$(function(){
	$("#bobmanager_button").on("click", function() {
		  $(this).html('선택 완료');
		  $(this).css('background-color', '#4CD698');
		  
		  
		  setTimeout(function() {
		    $("#bobmanager_button").html('선 택');
		    $("#bobmanager_button").css('background-color', '#40B4DE');
		    }, 1500)
	  
		  	var date = $("#choice_date").attr("value");
		  	$("#menutype_result_morning").attr("src","menutype.do?user_id=test&type=morning&bm_date="+date);
		  	$("#menutype_result_lunch").attr("src","menutype.do?user_id=test&type=lunch&bm_date="+date);
		  	$("#menutype_result_dinner").attr("src","menutype.do?user_id=test&type=dinner&bm_date="+date);
		  	
	    	$("#chart_donut").css("border","none").css("min-width", "500px").css("width","auto").css("height","400px").css("scrolling","no");
	    	$("#chart_donut").attr("src","chart03.do?user_id=test&bm_date="+date);
	    	
	        $("#chart_bar").css("border","none").css("width","800px").css("height","400px").css("scrolling","no");
	        $("#chart_bar").attr("src","chart04.do?user_id=test&bm_date="+date);
		});
		
})
