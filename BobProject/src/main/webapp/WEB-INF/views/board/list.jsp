<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
 <title>이광석게시판</title>
</head>
<body>
	

<div id="root">

	<header>
<%@include file="include/header.jsp" %>
	</header>
 
<hr /> 

 	<nav>
 		<%@include file="include/nav.jsp" %>
 	</nav>
 	
<hr />
 <section id="container">
  <h2>글 목록</h2>
  
  <table>
   <tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일자</th></tr>
   
   <!-- 목록 시작 -->
   <c:forEach items="${list}" var="list">
   <tr>
    <td>${list.bno}</td>
    <td>
    	<a href="read?bno=${list.bno }">${list.title }</a>
    </td>
    <td>${list.writer}</td>
    <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
   </tr>
   </c:forEach> 
   <!-- 목록 끝 -->
   
  </table>

 </section>

<hr />

<footer>
	<%@include file="include/footer.jsp" %>
</footer>

</div>

</body>
</html>