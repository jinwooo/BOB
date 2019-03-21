<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email form</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#btn01").click(function(){
		var emailval = $("#usermail").val();
		var contentval = $("#content").val();
		var emailauth = $("#emailauth").val();
		
		$.ajax({
			type:"POST",
			url:"mailformajax.do",
			data :{"emailval" : emailval,"contentval":contentval,"emailauth" : emailauth},
			dataType : "json",
			success:function(data){
				if(data < 1){
					alert("인증되었습니다");
					window.opener.document.getElementById("sendMessageButton").value = document.getElementById("usermail").value;
					window.opener.document.getElementById("user_confirm").value = "Y";
					self.close();
				}else{
					alert("인증번호를 다시 확인해주세요.");
				}
			}
		});
	})
});

	</script>
<body>

	<div id="callback">

		<form method="post" id="mail" name="email">
		
			<table class="table">
				<tr>
					<th colspan="2">이메일로 본인 인증하기</th>
				</tr>
				<tr>
					<td>이메일을 입력하세요</td>
					<td><input type="text" id="usermail" name="email" value="${email }"
						placeholder="메일을 입력해주세요"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" id="submitbtn" value="메일 전송" /></td>
				</tr>
			</table>
		</form>
	</div>



	<div class="container">
		<input type="text" id="content" name="authnum1"/> 
		<input type="hidden" id="emailauth" value="${emailauth }" />
		<input type="button" onclick="/mailformajax.do" id="btn01" name="authnum2" value="인증하기"/>
	</div>

</body>
</html>