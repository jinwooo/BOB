<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="padding-top: 100px;">
<ul class="nav nav-pills">
	<li><a href="listSearch">목록</a></li>
	
	<c:choose>
		<c:when test="${user.user_grade  eq 'admin' }">
		<li><a href="write">글쓰기</a></li>
		</c:when>	
	</c:choose>	
	
	<li><a href="#">로그인</a></li>
</ul>
</div>