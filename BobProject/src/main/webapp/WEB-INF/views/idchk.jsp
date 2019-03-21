<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn01").click(function(){
			
			var user_id = $("#user_id").val();
			
			$.ajax({				
				type:"POST",
				url:"idChkres.do",
				data : {"user_id" : user_id},
				dataType : "json",
				success:function(data){
					if(data < 1 ){
					alert("사용가능한 아이디 입니다.")
					window.opener.document.getElementById("idChk").value = document.getElementById("user_id").value;
					self.close();
				}else{
					alert("중복된 아이디입니다.")	
				}
				}				
			});					
	});
	});
</script>
</head>
<body>
<div class="container">
		<input type="text" id="user_id" name="user_id" value="${user_id }" /> 
		<input type="hidden" id="emailauth" value="${emailauth }" />
		<input type="button" id="btn01" value="중복체크" />
	</div>
</body>
</html>