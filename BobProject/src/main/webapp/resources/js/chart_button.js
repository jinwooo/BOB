$(function(){
	
	$(".fill-morning").click(function(){
		var date = $("#choice_date").attr("value");
		$("#chart_donut").attr("src","chart03.do?user_id=1234&bm_date="+date+"&type=morning");
	})
	
	$(".fill-lunch").click(function(){
		var date = $("#choice_date").attr("value");
		$("#chart_donut").attr("src","chart03.do?user_id=1234&bm_date="+date+"&type=lunch");	
	})
	
	$(".fill-dinner").click(function(){
		var date = $("#choice_date").attr("value");
		$("#chart_donut").attr("src","chart03.do?user_id=1234&bm_date="+date+"&type=dinner");		
	})	
})