<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#loginchk").hide();
	});
	function login(){
		var idVal = $("#id").val();
		var pwVal = $("#pw").val();
		if(idVal==null||idVal==""){
			alert("id를 확인해 주세요");
		}else if(pwVal==null||pwVal==""){
			alert("pw를 확인해 주세요");
		}else{
			$.ajax({
				type:"post",
				url:"loginajax.do",
				data:"id="+idVal+"&pw="+pwVal,
				success:function(message){
					if(message.loginchk==true){
						location.href="main.do";
					}else{
						$("#loginchk").show();
					}
				},
				error:function(){
					alert("로그인 실패");
				}
			});
		}
	}
</script>
<body>
	<h3>로그인 페이지</h3>
 	<form method="post">
 		<table>
 			<tr>
			<th>ID</th>
			<td><input type="text" id="id"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" id="pw"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="로그인" onclick="login()"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginchk">다시 확인해주세요</td>
		</tr>
 		</table>
 	</form>
	

</body>
</html>