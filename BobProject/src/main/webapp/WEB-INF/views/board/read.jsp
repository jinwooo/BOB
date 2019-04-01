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

<div id="root" class="container">
<header>
 <%@include file="../form/header.jsp" %>
</header>


<nav>
 	<%@include file="include/nav.jsp" %>
 </nav>

<br><br>

 <section id="container">
 
  <form role="form" method="post" autocomplete="off">
  	
  	<!-- scri값을 보관할 태그들 -->
 	<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
			
   <div class="form-group">
		<label for="bno" class="col-sm-2 control-label">글 번호</label>
		<div class="col-sm-10">
			<input type="text" id="bno" name="bno" class="form-control" value="${read.bno}" readonly="readonly" />
		</div>
	</div>
   
  </form> 
  
   <div class="form-group"> 
		<label for="title" class="col-sm-2 control-label">글 제목</label>
		<div class="col-sm-10">
			<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly"  />
		</div>
	</div>
	<div class="form-group">
		<label for="content" class="col-sm-2 control-label">글 내용</label>
		<div class="col-sm-10">
			<textarea id="content" name="content" class="form-control" readonly="readonly"style="height: 350px; resize: none;">${read.content}</textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="writer"class="col-sm-2 control-label">작성자</label>
		<div class="col-sm-10">
			<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}" readonly="readonly" />
		</div>
	</div>
				
	<div class="form-group">
		<label class="col-sm-2 control-label">작성 날짜</label>
		<div class="col-sm-10">
			<span><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd" /></span>
		</div>
	</div>
   
   
   <div class="form-group">
   	<button type="button" id="list_btn" class="btn btn-primary">목록</button>
	<button type="button" id="modity_btn" class="btn btn-warning">수정</button>
	<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
    
    <script>
    
    	$(function() {
    		// 폼을 변수에 저장
   		 var formObj = $("form[role='form']");
   		 
   		 // 수정 버튼 클릭
   		 $("#modity_btn").click(function(){
   		  
   		  formObj.attr("action", "update");
   		  formObj.attr("method", "get");  
   		  formObj.submit();     
   		  
   		 });
   		 
   		 
   		 // 삭제 버튼 클릭
   		 $("#delete_btn").click(function(){
   		  
   		  alert("정말로 삭제하시겠습니까?") 
   			 
   		  formObj.attr("action", "delete");
   		  formObj.attr("method", "get");  
   		  formObj.submit();
   		  
   		 });
   		 
   		 //목록버튼클릭
   		 $("#list_btn").click(function(){
   			self.location = "listSearch?"
   					+"page=${scri.page}&perPageNum=${scri.perPageNum}"
   					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
   		 });
		})
		 
 	</script>
    
   </div>  
   	

   	<br><br>
   	
   	<!-- 댓글목록 -->
    <div id="reply">
	 <ol class="replyList">
	 <c:forEach items="${repList}" var="repList">
	 <li>
	  <p>
	  <span class="glyphicon glyphicon-user"></span>
	   작성자 : ${repList.writer}<br />
	   작성 날짜 :  <fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />
	  </p>
	  
	  <p class="bg-info">${repList.content}</p>
	  
	  <div class="form-group">             
		 <button type="button" class="replyUpdate btn btn-warning btn-xs" data-rno="${repList.rno}">수정</button>
		 <button type="button" class="replyDelete btn btn-danger btn-xs" data-rno="${repList.rno}">삭제</button>
		 
		 <script>
		  $(".replyUpdate").click(function(){
		   self.location = "replyUpdate?bno=${read.bno}"
		    + "&page=${scri.page}"
		    + "&perPageNum=${scri.perPageNum}"
		    + "&searchType=${scri.searchType}"
		    + "&keyword=${scri.keyword}"
		    + "&rno=" + $(this).attr("data-rno");        
		  });
		  
		  $(".replyDelete").click(function(){
		   self.location = "replyDelete?bno=${read.bno}"
		    + "&page=${scri.page}"
		    + "&perPageNum=${scri.perPageNum}"
		    + "&searchType=${scri.searchType}"
		    + "&keyword=${scri.keyword}"
		    + "&rno=" + $(this).attr("data-rno"); 
		  });       
		 </script>
	 </div>
	 
	 </li>
	 </c:forEach>   
	 </ol>
	 

	 
	 <!-- 댓글작성폼 -->
	 <section class="replyForm">
		<form role="form" method="post" autocomplete="off" class="form-horizontal">
		
		 <input type="hidden" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
		 <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
		 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
		 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
		
		 <div class="form-group">
			<label for="writer" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<input type="text" id="writer" name="writer" value="${user.user_id }" readonly="readonly" class="form-control" />
			</div>
		</div>			
			
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">댓글 내용</label>
			<div class="col-sm-10">
				<textarea id="content" name="content" class="form-control" ></textarea>
			</div>
		</div>
		
		 <div class="form-group">
			<div class="col-sm-offset-2 col-sm-10"> 
				<button type="button" class="repSubmit btn btn-success">작성</button> 
			</div>				
			<script>
			var formObj = $(".replyForm form[role='form']");
										
			$(".repSubmit").click(function(){
				formObj.attr("action", "replyWrite");
				formObj.submit();
			});				
			</script>				
		</div>
		</form>
	</section>
	 
	</div>

 </section>
 </div>
 

<hr />
<footer>
	<%@include file="../form/footer.jsp" %>
</footer>

</body>
</html>