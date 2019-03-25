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
</head>
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
				<div class="tab-content">
					<h1>칼로리</h1>
					<p>${kal_res }</p>
				</div>
				<div class="tab-content">
					<h1>${menu_type }</h1>
				</div>
				<div class="tab-content">
					<h1>메뉴</h1>
					<p>${menu_res }</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>