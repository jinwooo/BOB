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
<link rel="stylesheet" href="resources/css/chart_button.css">
<link rel="stylesheet" href="resources/css/date.css">
<link rel="stylesheet" href="resources/css/menutype.css">
<link rel="stylesheet" href="resources/css/add.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<script src="resources/js/button.js" ></script>
<script src="resources/js/chart_button.js"></script>
<script src="resources/js/add.js"></script>
<script type="text/javascript">
	$(function(){
		$(".main_wrap").hide();
    	
	    $("#bobmanager_button").click(function(){
	    	$(".main_wrap").fadeIn("slow");
	    });
	    
	    $(document).on('click','#crawling',function(){
			
			window.open('craw.do','test','width=400,height=400');
		}); 
 		$(document).on('click','#vision',function(){
			
			window.open('addr.do','test','width=400,height=400');
		}); 
	    
	});
</script>
<body>
	<div>
		<%@ include file="form/header.jsp" %>		
	</div>
	<div class="add_button">
		<input type="checkbox" name="toggle" id="toggle" />
		<label for="toggle"></label>
		<div class="message">
		<form action="bm_insert" method="post">
		<h1>사진추가해서 찾기</h1>
			<input type="hidden" id="user_id" name="user_id" value="${user.user_id }">
			<label>넣을 날짜</label><br/>
			<input type="text" name="bm_date" placeholder="예)20190327"> <br/>
			<label>식사시간</label><br/>
			<input type="text" name="bm_type" placeholder="예)아침, 점심, 저녁"> <br/>
			<input type="button" id="vision" value="사진으로 메뉴찾기"><br/>
			<input type="hidden" id="bm_menu" name="bm_menu" >
			<input type="hidden" id="bm_kal" name="bm_kal" >
			<input type="hidden" id="bm_img" name="bm_img">
			<input type="submit" name="올리기">
		
		</form>	
		<br/>
		<hr/>
			<form action="bm_insert" method="post">
			<h1>검색해서 찾기</h1>
			<input type="hidden" id="user_id" name="user_id" value="${user.user_id }">
			<label>넣을 날짜</label><br/>
			<input type="text" name="bm_date" placeholder="예)20190327"> <br/>
			<label>식사시간</label><br/>
			<input type="text" name="bm_type" placeholder="예)아침, 점심, 저녁"> <br/>
			<input type="button" id="crawling" value="검색으로 메뉴찾기"><br/>
			<input type="hidden" id="bm_menu2" name="bm_menu" >
			<input type="hidden" id="bm_kal2" name="bm_kal" >
			<input type="hidden" id="bm_img2" name="bm_img">
			<input type="submit" name="올리기">
		
		</form>			
		</div>	
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
				<div style="width: 100%; text-align: center; vertical-align: middle;">
					<button id="chart_button" class="fill-morning" style="border: 2px rgba(242,129,105,0.5) solid">아침</button>
					<button id="chart_button" class="fill-lunch" style="border: 2px rgba(222,223,4,0.5) solid">점심</button>
					<button id="chart_button" class="fill-dinner" style="border: 2px rgba(138,196,227,0.5) solid">저녁</button>					
				</div>						
				<div id="chart_wrap" style="width:50%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="chart_donut" src=""></iframe>
				</div>
				<div id="chart_wrap" style="width:50%; text-align: center; display: table-cell; vertical-align: middle;">
					<iframe id="chart_bar" src=""></iframe>
				</div>			
			</div>
		</div>
	</div>
	<div class="no_data_wrap" style="width: 80%; height: auto; margin-left: 10%; margin-right: 10%; margin-bottom: 150px;">
		<input type="image" src="resources/image/loadingL.gif" style="width: 80%; height: 80%; z-index: 10; margin-left: 10%; margin-right: 10%;">
	</div>
	<input id="choice_date" type="hidden" value="">
	<%@ include file="form/footer.jsp" %>		

</body>
</html>