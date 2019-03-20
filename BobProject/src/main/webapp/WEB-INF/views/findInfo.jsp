<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디 / 비밀번호 찾기</h2>
	<div class="container">
		<div class="row">
			<div id="width1">
			 <fieldset class="infoFiele">
			 	<legend class="infoLegend">아이디 찾기</legend>
			 	<form role="form" action="login.do" method="post" class="Info-form" id="inf">
			 	<input type="hidden" name="command" value="findId"/>
			 		<div class="form-group">
			 		<label for="form-password">이메일 주소</label>
			 		 <input type="text" name="user_email" placeholder="Email을 입력해주세요."class="form-email form-control" id="form-email">
			 		</div>
			 		<button type="submit" class="btnma" spellcheck="false">확인</button>
			 	</form>
			 </fieldset>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
		 <div id="width1">
		 	<fieldset class="infoFeild">
		 		<legend class="infoLegend">비밀번호 찾기</legend>
		 		<form role="form" action="login.do" method="post"class="Info-form" id="inf">
		 		<input type="hidden" name="command" value="findPw"/>
		 			<div class="form-group">
		 			<label for="userId">아이디</label>
		 			  <input type="text" name="user_id" placeholder="ID를 입력해주세요." class="form-username" id="userId">		 			
		 			</div>
		 			<div class="form-group">
		 			<label for="form-password">이메일 주소</label>
		 			 <input type="text" name="email" placeholder="Email을 입력해주세요."id="form-email">
		 			</div>
		 			<button type="submit" class="btnma" spellcheck="false">확인</button>
		 		</form>
		 	</fieldset>
		 </div>
		</div>
	</div>
</body>
</html>