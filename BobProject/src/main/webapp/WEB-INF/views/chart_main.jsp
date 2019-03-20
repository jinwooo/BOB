<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/date.css">
<link rel="stylesheet" href="resources/css/chart_choice.css">
<link rel="stylesheet" href="resources/css/button.css">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<script src="resources/js/date.js"></script>
<script src="resources/js/chart_choice.js"></script>
<script src="resources/js/button.js"></script>
<script type="text/javascript">
	$(function(){
		$("#bobmanager_main").hide();
	})
	
	
</script>
<body>
	<div>
		<h1>HEADER</h1>
	</div>

	<div class="body" style="width: 100%; height: 180px; position: relative;">
		<div id="datetime">
			<span id="year" class="active field">YYYY</span>
			<span id="month" class="field">MMM</span>
			<span id="day" class="field">DD</span>
		</div>	
		<div id="virtual_knob">
			<div id="knob"></div>
			<div id="dial"></div>
		</div>
	</div>
	
	<div style="position: relative;">
		<button id="bobmanager_button">선 택</button>		
	</div>
	
	<div id="bobmanager_main">	
		<div>
			<c:forEach items="${kal }" var="kal" begin="0" end="2">
				<div style="margin-left: 72px; margin-right: 75px; z-index: 4; width:25%; height: 300px; margin-top: 30px; float: left; border-radius: 100px; border: 3px solid rgba(0,0,0,0.5);">
					<h1 style="font-size: 30pt;  text-align: center; padding-top: 35px;">${kal } kal</h1>
				</div>
			</c:forEach>
				
		</div>
		<script type="text/javascript">
			
		</script>
		<div style="width:100%; text-align: center;">
			<div id="chart_wrap" style="width:50%; margin: auto;">
				<iframe id="chart_result" style="border:none; min-width: 500px; width: auto; height: 400px;" scrolling="no" src="chart03.do?user_id=test&"></iframe>
				<input id="choice_date" type="hidden" value="">
			</div>
		</div>
		
		<div id="app_body">
			<div id="app">
				<div id="btn01" class="button active"></div>
				<div id="btn02" class="button"></div>
			</div>	
		</div>
	</div>
	
	<div>
		<h1>FOOTER</h1>
	</div>
</body>
</html>