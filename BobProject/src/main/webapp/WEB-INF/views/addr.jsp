<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

 
</script>
</head>
<body>
    <form action="" method="">
        <input type="file" id="imgInp" />
        <img id="foo"src="#" />
    </form>
</body>


</html>