<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".find").hide();
		
	$("#btn02").click(function(){
	var emailval = $("#usermail").val();
	var contentval = $("#content").val();
	var emailauth = $("#emailauth").val();
	
	$.ajax({
		type:"POST",
		url:"transjax.do",
		data :{"emailval" : emailval,"contentval":contentval,"emailauth" : emailauth},
		dataType : "json",
		success:function(data){
			if(data < 1){
				alert("인증되었습니다");
				$(".find").show();
				
			}else{
				alert("인증번호를 다시 확인해주세요.");
			}
		}
			});
		})
	$("#btn03").click(function(){
		var userid = $("#user_id").val();
		var userpw = $("#user_pw").val();
		
		$.ajax({
			type:"POST",
			url:"transrespw.do",
			data : {"user_id" : userid, "user_pw" : userpw},
			dataType : "json",
			success:function(data){
				if(data.num < 1){
					alert("비밀번호 변경!");
					self.close();
				}else{
					alert("아이디를 확인하여 주세요");
				}
			}
			
			
		})
		
	});
	
	
	
		
	});
</script>
<body>

		<div id="callback">

		<form method="post" id="mail" name="email">
		
			<table class="table">
				<tr>
					<th colspan="2">비밀번호 변경</th>
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
		<input type="button"  id="btn02" name="authnum2" value="인증하기"/>
	</div>
	<hr/>
	<div class="find">
	<form >
		<table >
			<tr>
				<td>아이디를 입력하세요</td>
				<td><input type="text" id="user_id" name="id"
						placeholder="아이디를 입력하세요"/></td>
				</tr>
		<tr>
				<td>새로운 비밀번호를 입력하세요</td>
				<td><input type="password" id="user_pw" name="pw"
						placeholder="새로운 비밀번호를 입력해주세요"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" id="btn03" value="비밀번호 변경" /></td>
				</tr>
		</table>
	</form>
	</div>

</body>
</html>