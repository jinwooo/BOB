<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 <title>이광석 게시판</title>
 
 <!-- 제이쿼리 -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 
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
 
  <form role="form" method="post" autocomplete="off">
  	
  	<!-- scri값을 보관할 태그들 -->
 	<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
			
   <p>
    <label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
   </p>
  </form> 
  
   <p>
    <label for="title">글 제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly"/>
   </p>
   <p>
    <label for="content">글 내용</label><textarea id="content" name="content" readonly="readonly" >${read.content}</textarea>
   </p>
   <p>
    <label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly" /><br />
    <label>작성 날짜</label> <span><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd" /></span>
   </p>
   
   
   <p>
   	<button id="list_btn">목록</button>
    <button id="modity_btn">수정</button>
    <button id="delete_btn">삭제</button>
    
    <script>
    
    	$(function() {
    		// 폼을 변수에 저장
   		 var formObj = $("form[role='form']");
   		 
   		 // 수정 버튼 클릭
   		 $("#modity_btn").click(function(){
   		  
   		  formObj.attr("action", "modify");
   		  formObj.attr("method", "get");  
   		  formObj.submit();     
   		  
   		 });
   		 
   		 
   		 // 삭제 버튼 클릭
   		 $("#delete_btn").click(function(){
   		  
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
    
   </p>  
   	
   	<hr/>
   	
   	<!-- 댓글목록 -->
    <div id="reply">
	 <ol class="replyList">
	 <c:forEach items="${repList}" var="repList">
	 <li>
	  <p>
	   작성자 : ${repList.writer}<br />
	   작성 날짜 :  <fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />
	  </p>
	  
	  <p>${repList.content}</p>
	  
	  <p>              
		 <button type="button" class="replyUpdate" data-rno="${repList.rno}">수정</button>
		 <button type="button" class="replyDelete" data-rno="${repList.rno}">삭제</button>
		 
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
	 </p>
	 
	 </li>
	 </c:forEach>   
	 </ol>
	 
	 <hr/>
	 
	 <!-- 댓글작성폼 -->
	 <section class="replyForm">
		<form role="form" method="post" autocomplete="off">
		
		 <input type="hidden" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
		 <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
		 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
		 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
		
		 <p><label for="writer">작성자</label><input type="text" id="writer" name="writer" /></p>
		 <p><label for="content">댓글 내용</label><textarea id="content" name="content"></textarea></p>
		 <p>
		  <button type="button" class="repSubmit">작성</button>
		  <script>
		  var formObj = $(".replyForm form[role='form']");
		        
		  $(".repSubmit").click(function(){
		   formObj.attr("action", "replyWrite");
		   formObj.submit();
		  });
		  </script>
		 </p>
		</form>
	</section>
	 
	</div>

 </section>

<hr />
<footer>
	<%@include file="include/footer.jsp" %>
</footer>
</div>

</body>
</html>