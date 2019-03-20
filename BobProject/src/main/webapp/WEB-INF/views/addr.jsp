<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	
	 $(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
  			  });
		});
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
             
                $('#imgname').attr('value',$('#foo').attr('src'));
            }
            reader.readAsDataURL(input.files[0]);
        }
    } 

    
 
</script>
</head>
<body>
	
 
    <form:form action="imgvision.do" method="post" enctype="multipart/form-data">
        <input type="file" id="imgInp" name="filevi" />
        <p style="color:red;font-weight: bold;">
			<form:errors path="file" />		
		</p>
        <img id="foo"src="#" />
        <input type="hidden" id="imgname" name="imgname" value="">
        <input type="submit" value="전송">
    </form:form>



</body>

</html>