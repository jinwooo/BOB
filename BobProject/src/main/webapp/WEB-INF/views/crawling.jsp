<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
<body>

	<h1>메뉴검색</h1>
	<form action="search.do" method="post" id="menubar">
		<a>입력 : </a>
		<input type="text" id="foodname" name="name" size="20" value="${foodname }"/>
		<input type="submit" id="craw" value="검색" />
	</form>
	
	<br>
	
	
	<img id="menu1" alt="" src="${message1 }" height="200" width="200" onclick="location.href='tandanji.do?foodname=${foodname }&root=${message1 }&inp=c'" />
	<img id="menu2" alt="" src="${message2 }" height="200" width="200" onclick="location.href='tandanji.do?foodname=${foodname }&root=${message2 }&inp=c'" >
	<img id="menu3" alt="" src="${message3 }" height="200" width="200" onclick="location.href='tandanji.do?foodname=${foodname }&root=${message3 }&inp=c'" >
	<img id="menu4" alt="" src="${message4 }" height="200" width="200" onclick="location.href='tandanji.do?foodname=${foodname }&root=${message4 }&inp=c'" >
	<img id="menu5" alt="" src="${message5 }" height="200" width="200" onclick="location.href='tandanji.do?foodname=${foodname }&root=${message5 }&inp=c'" >

</body>
</html>