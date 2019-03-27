<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	
	 $(function() {
   
        $("#foodtable tr").click(function(){
        	
        	var tr = $(this);
            var td = tr.children();        	
        	
        	 var foodname = td.eq(0).text();
        	 var kal = td.eq(1).text();
        	 var root = td.eq(5).text();
        	 window.opener.document.getElementById("bm_menu").value = foodname;
			window.opener.document.getElementById("bm_kal").value = kal;
			window.opener.document.getElementById("bm_img").value = root;
			self.close();
        });  
    
	});   
 
</script>


<body>

<table border="1" id="foodtable">
	
<c:forEach items="${list }" var="dto">
	<tr>
		<td>${dto.foodname }</td>
		<td>${dto.kal }</td>
		<td>${dto.tan }</td>
		<td>${dto.dan }</td>
		<td>${dto.ji }</td>
		<td style="display: none;">${root }</td>
	</tr>


</c:forEach>

</table>

</body>
</html>