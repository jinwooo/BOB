
$(function(){
	$("#bobmanager_button").on("click", function() {
		  $(this).html('선택 완료');
		  $(this).css('background-color', '#4CD698');
		  
		  
		  setTimeout(function() {
		    $("#bobmanager_button").html('선 택');
		    $("#bobmanager_button").css('background-color', '#40B4DE');
		    }, 1500)
		    
		    var year = $("#year").text();
		  	var month = $("#month").text();
		  	var day = $("#day").text();
		  	
		  	$("#bobmanager_main").show();
		  	
		  	$("#choice_date").attr("value",year+"-"+month+"-"+day);
		});
	
})
