<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/menutype.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300" rel="stylesheet" type="text/css">
<style type="text/css">
#menu_image_wrap {
	width: 100%;
}

.menu_image {
	margin-top: 10px;
	max-width: 100px;
	max-height: 100px;
	min-width: 100px;
	min-height: 100px;
	
	border-radius: 100%;
	border: 2px solid rgba(0,0,0,0.5);
}

.image_button {
	width: 50%;
	opacity: 0.5	
}

.image_button:hover {
	opacity: 0.2;
}

.menu_image:hover{
	opacity: 0.5;
}

</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var menu_array = new Array();
	var kal_array = new Array();
	
	var menu = "${menu_res}";
	var kal = "${menu_kal}";
	
	var menu_array = menu.split(" ");
	var kal_array = kal.split(" ");
	
	var result = "";
	
	if(menu != ""){
		for(var i=0; i<menu_array.length-1; i++){
			if(menu_array[i] != null && menu_array[i] != ""){
				result = "<p>메뉴 - "+menu_array[i]+" ("+kal_array[i]+" kal)</p>";
				$("#tab-content-menu").append(result);
			} else {
				result = "<p>데이터가 없습니다</p>";
				$("#tab-content-menu").append(result);
			}
		 }
	} else {
		result = "<p>데이터가 없습니다</p>";
		$("#tab-content-menu").append(result);
	}
	
	var image_array = new Array();
	var image = "${menu_image}";
	var image_array = image.split(" ");
	
	
	if(image_array[0] == ""){
		$(".menu_image").attr("src","resources/image/no_image.png");
		$(".menu_image").attr("title","no");
	} else {
		$(".menu_image").attr("src",image_array[0]);	
	}

	$("#image_button_prev").click(function(){
		var cnt = $(".menu_image").attr("title");

		if(cnt != "-1"){
			if(cnt=="0"){
				cnt = image_array.length-2;
			} else {
				cnt--;
			}
			
			$(".menu_image").attr("src",image_array[cnt]);
			$(".menu_image").attr("title", cnt);
			
		} else {
			
		}
	});
	
	$("#image_button_next").click(function(){
		var cnt = $(".menu_image").attr("title");
		if(cnt != "no"){
			if(cnt == image_array.length-2){
				cnt = 0;
			} else {
				cnt++;
			}
			
			$(".menu_image").attr("src",image_array[cnt]);
			$(".menu_image").attr("title", cnt);
			
		} else {
			
		}
	});
})

</script>
<body>
	<div>
		<div class="perspective">
			<label class="tab" for="tab-top">칼로리</label>
			<label class="tab" for="tab-front">타입</label>
			<label class="tab" for="tab-bottom">메뉴</label>
			<input style="display: none;" type="radio" name="tabs" id="tab-top">
			<input style="display: none;" type="radio" name="tabs" id="tab-front">
			<input style="display: none;" type="radio" name="tabs" id="tab-bottom">
			
			<div class="cube">
				<div class="tab-content" id="tab-content-kal">
					<h1>총 칼로리</h1>
					<c:choose>
						<c:when test="${kal_res ne 0}">
							<p>${kal_res }</p>
						</c:when>
						<c:otherwise>
							<p>데이터가 없습니다</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-content" id="tab-content-menutype">
					<c:choose>
						<c:when test="${type eq 'morning'}">
							<h1>아침</h1>
						</c:when>
						<c:when test="${type eq 'lunch'}">
							<h1>점심</h1>
						</c:when>
						<c:otherwise>
							<h1>저녁</h1>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="tab-content" id="tab-content-menu">
					<div id="menu_image_wrap" style="display: table;">
						<div style="display: table-cell; text-align: center; vertical-align: middle;">
							<img class="image_button" id="image_button_prev" style="cursor: pointer;" src="resources/image/left.png"/>
						</div>
						<div id="img_wrap"style="display: table-cell; text-align: center; vertical-align: middle;">
							<input type="image" class="menu_image" src="" title="0"> 
						</div>
						<div style="display: table-cell; text-align: center; vertical-align: middle;">
							<img class="image_button" id="image_button_next" style="cursor: pointer;" src="resources/image/right.png"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>