<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/date.css">
<link rel="stylesheet" href="resources/css/menutype.css">
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<script src="resources/js/button.js"></script>
<script type="text/javascript">
	$(function(){
		$(".main_wrap").hide();
    	
	    $("#bobmanager_button").click(function(){
	    	$(".main_wrap").fadeIn("slow");
	    });
	})
	
	
</script>
<body>
	<div>
		<%@ include file="form/header.jsp" %>		
	</div>
	<div id="calendar_wrap" style="margin-top: 100px;">
		<div class='formInput dateSelector'>
			<i class='fa fa-calendar-o'></i>
			<input type='text' name='birthday' id='hbdsdf' placeholder='날짜를 선택해주세요' />
		</div>
		<script src="resources/js/date.js"></script>
		<div style="position: relative;">
			<button id="bobmanager_button">선 택</button>
		</div>			
	</div>
	<!-- 
		iframe 을 세개를 주고 각각 아침, 점심, 저녁으로 사용
		controller 에서는 하나로 사용하여 아침, 점심, 저녁일 때에 맞춰 다른 값을 보내어주 하나의 컨트롤러에서 관리할 수 있게 만들기
	 -->
	<div class="main_wrap">
		<div id="bobmanager_main">
			<div style="width: 100%; display: table;">
				<div class="menutype_wrap" style="width: 33%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="menutype_result_morning" 
					style="width: 100%; height:500px; border: none;" scrolling="no" src=""></iframe>
				</div>
				<div class="menutype_wrap" style="width: 33%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="menutype_result_lunch" 
					style="width: 100%; height:500px; border: none;" scrolling="no" src=""></iframe>
				</div>
				<div class="menutype_wrap" style="width: 33%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="menutype_result_dinner" 
					style="width: 100%; height:500px; border: none;" scrolling="no" src=""></iframe>
				</div>						
			</div>
			
			<!-- iframe src 에 공백을 넣어놓고, 날짜 선택했을 때 src 를 수정해주는 방법을 사용 -->
			<div style="width:100%; display: table;">
				<div id="chart_wrap" style="width:50%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="chart_donut" src=""></iframe>
				</div>
				<div id="chart_wrap" style="width:50%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="chart_bar" src=""></iframe>
				</div>			
			</div>
		</div>
	</div>
	<input id="choice_date" type="hidden" value="">
	<div style="margin-top: 40px;">
		<h1>FOOTER</h1>
	</div>
</body>
</html>