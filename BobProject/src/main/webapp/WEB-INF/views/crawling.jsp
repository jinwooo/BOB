<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>crawling!!!!!!!!!!</h1>
	<form action="search.do" method="post">
		<a>입력 : </a>
		<input type="text" name="name" size="20"/>
		<input type="submit" value="크롤링해보자!!"/>
	</form>
	
	<br>
	
<%-- 	<div>${message }</div> --%>
	
	<img alt="" src="${message1 }" height="200" width="200">
	<img alt="" src="${message2 }" height="200" width="200">
	<img alt="" src="${message3 }" height="200" width="200">
	<img alt="" src="${message4 }" height="200" width="200">
	<img alt="" src="${message5 }" height="200" width="200">

</body>
</html>