<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17de00b740d6c8d67a526eff93f9bafb&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<h3>선택된 종류 : ${foodselect }</h3>

	<input type="hidden" id="foodselect" value="${foodselect }">
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script src="resources/js/map_search2.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>