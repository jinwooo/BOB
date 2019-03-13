<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>공지사항 목록</h1>
	
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="300">
		<col width="200">
		<col width="50">
		
		<tr>
			<th>NOTICE_NUMBER</th>
			<th>ID</th>
			<th>TITLE</th>
			<th>DATE</th>
			<th>VIEW</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty noticelist }">
				<tr>
					<td colspan="4">--작성된 글이 없습니다--</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${noticelist }" var="dto">
					<tr>
						<td>${dto.n_no }</td>
						<td>${dto.user_id }</td>
						<td><a href="selectone.do?id=${dto.user_id }">${dto.n_title }</a></td>
						<td>${dto.n_date }</td>
						<td>조회수</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<td colspan="4">
				<input type="button" value="처음으로" onclick="location.href='index.jsp'">
				<input type="button" value="글쓰기" onclick="location.href='insertform.do'">
			</td>
		</tr>
		
	</table>

</body>
</html>