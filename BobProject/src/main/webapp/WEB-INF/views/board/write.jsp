<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head lang="ko">
 <title>이광석게시판</title>
 
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<!-- <div id="root"> -->
<div class="container">
<header>
<%@include file="../form/header.jsp" %></header>

<!-- <hr /> -->
 
 <nav>
 	<%@include file="include/nav.jsp" %>
 </nav>

<!-- <hr /> -->

 <section id="container">
 
  <form role="form" method="post" autocomplete="off">
  
  <div class="form-group">
	<label for="title" class="col-sm-2 control-label">글 제목</label>
	<div class="col-sm-10">
		<input type="text" id="title" name="title" class="form-control" />
	</div>
  </div>
<!--    <p> -->
<!--     <label for="title">글 제목</label><input type="text" id="title" name="title" /> -->
<!--    </p> -->

   <div class="form-group">
	<label for="content" class="col-sm-2 control-label">글 내용</label>
	<div class="col-sm-10">
		<textarea id="content" name="content" class="form-control" style="height: 350px; resize: none;"/></textarea>
	</div>
   </div>
<!--    <p> -->
<!--     <label for="content">글 내용</label><textarea id="content" name="content"></textarea> -->
<!--    </p> -->

   <div class="form-group">
	<label for="writer" class="col-sm-2 control-label">작성자</label>
	<div class="col-sm-10">
		<input type="text" id="writer" name="writer" value="${user.user_id }"  readonly="readonly" class="form-control" />
	</div>
   </div>
<!--    <p> -->
<!--     <label for="writer">작성자</label><input type="text" id="writer" name="writer" /> -->
<!--    </p> -->

	<div class="form-group">
		<button type="submit" class="btn btn-primary">작성</button>
	</div>
<!--    <p> -->
<!--     <button type="submit">작성</button> -->
<!--    </p>   -->
  </form>

 </section>

<hr />

	<footer>
<%@include file="../form/footer.jsp" %>	</footer>

</div>

</body>
</html>