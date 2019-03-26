<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 <title>이광석 게시판</title>
 
 <!-- 제이쿼리 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head>


<body>

<div class="container">
<header>
 	<%@include file="../form/header.jsp" %>
</header>

 
<nav>
 	<%@include file="include/nav.jsp" %>
</nav>


 <section id="container">
 
  <form role="form" method="post" autocomplete="off" id="test">
  
   <div class="form-group has-warning">
		<label for="bno" class="col-sm-2 control-label">글 번호</label>
		<div class="col-sm-10">
			<input type="text" id="bno" name="bno" class="form-control" value="${modify.bno}" readonly="readonly" />
		</div>
   </div>
   
   <div class="form-group has-warning">
		<label for="title" class="col-sm-2 control-label">글 제목 수정</label>
		<div class="col-sm-10">
			<input type="text" id="title" name=title class="form-control" value="${modify.title}"/>
		</div>
   </div>
   
   <div class="form-group has-warning">
		<label for="content" class="col-sm-2 control-label">글 내용 수정</label>
		<div class="col-sm-10">
			<textarea id="content" name=content class="form-control" style="height: 350px; resize: none;">${modify.content}</textarea>
		</div>
   </div>

	<div class="form-group has-warning">
		<label for="writer" class="col-sm-2 control-label">작성자 수정</label>
		<div class="col-sm-10">
			<input type="text" id="writer" name=writer class="form-control" value="${modify.writer}" readonly="readonly"/>
		</div>
   </div>
   
   <div class="form-group">
		<label class="col-sm-2 control-label">작성 날짜</label>
		<div class="col-sm-10">
			<span><fmt:formatDate value="${modify.regDate}" pattern="yyyy-MM-dd" /></span>
		</div>
	</div>
	
	<div class="form-group"> 
		<button type="submit" class="btn btn-warning">수정</button>
		<button id="cancel_btn" class="btn btn-danger">취소</button>
		<script>
	    // 폼을 변수에 저장
	    var formObj = $("form[role='form']"); 
	    
	    // 취소 버튼 클릭
	    $("#cancel_btn").click(function(){   
	    	self.location = "read?bno=${modify.bno}"
	    		   + "&page=${scri.page}"
	    		   + "&perPageNum=${scri.perPageNum}"
	    		   + "&searchType=${scri.searchType}"
	    		   + "&keyword=${scri.keyword}";
	    });
	    </script>
	</div>
   
  </form>

 </section>

<hr />

<footer>
	<%@include file="include/footer.jsp" %>
</footer>

</div>

</body>
</html>