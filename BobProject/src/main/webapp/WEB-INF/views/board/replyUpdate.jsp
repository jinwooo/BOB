<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 <title>이광석 게시판</title>
 
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 
</head>
<body>

<div id="root">
 <header>
  <%@include file="include/header.jsp" %>
 </header>
 <nav>
  <%@include file="include/nav.jsp" %>
 </nav>
 <section id="container">
  <form role="form" method="post" autocomplete="off">
    
   <input type="hidden" id="bno" name="bno" value="${readReply.bno}" readonly="readonly" />
   <input type="hidden" id="rno" name="rno" value="${readReply.rno}" readonly="readonly" /> 
   <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
   <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
   <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
   <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
   
   <p>
    <label for="content">글 내용</label>
    <textarea id="content" name="content" >${readReply.content}</textarea>
   </p>
   
   <p>
    <button type="submit">수정</button>
    <button type="button" id="cancel_btn">취소</button>
    
    <script>
    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){   
     self.location = "/board/read?bno=${readReply.bno}"
     + "&page=${scri.page}"
     + "&perPageNum=${scri.perPageNum}"
     + "&searchType=${scri.searchType}"
     + "&keyword=${scri.keyword}";
    });
    </script>
   </p> 
  </form>
 </section>
 <footer>
  <%@include file="include/footer.jsp" %>  
 </footer>
</div>
</body>
</html>