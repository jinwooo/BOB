<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="gel" uri="/WEB-INF/tlds/tansfunc.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	
	<c:forEach items="${vision }" var="dto">
	
	<input type="button" name="보내기" onclick="location.href='tandanji.do?foodname=${gel:ts(dto.imgname) }&root=${root }'"><b>${gel:ts(dto.imgname) }</b><br/>	
	
	</c:forEach>
	

</body>
</html>