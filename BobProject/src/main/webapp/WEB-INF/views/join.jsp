<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
<%
	String id="밥";
%>
	//아이디중복체크및 체크박스 동의를 안누르고 그 외 공간 누르면
	$(function(){
		$("#warning").hide();
		$("#idError").hide();
		$("#idCan").hide();
		//$("#join-submit").attr("disabled",true);
		
	$("#ex_chk").click(function () {
			if($("input:checkbox[id='ex_chk']").is(":checked")==false){
				$("#join-submit").attr("disabled",true);
			}
	})
	//중복확인 및 아이디 입력확인
 	$("#idchk").click(function(){
 		var idvalue = $("#inputId").val();
 		
 		if(!idvalue){
 			alert("아이디를 입력해주세요");
 			return false;
 		}
 		
 		$.ajax({
 			url:"bob.do?command=idCheck&inId="+idvalue,
 			
 			success:function(msg){
 				if($.trim(msg)=="사용불가"){
 					$("#idError").show();
 					$("#idCan").hide();
 					$("#join-submit").attr("disabled",true);
 					
 				}else{
 					$("#idCan").show();
 					$("#idError").hide();
 					if($("input:checkbox[id='ex_chk']").is(":checked")){
 						$("#join-submit").attr("disabled",false);
 					}
 				}
 			},
 			error:function(){
 				alert("통신실패");
 			}
 		})
 	   }) 
	})
	// 비밀번호 확인
 	function pwok(){
 		var pw1 = $("#inputPassword").val();
 		var pw2 = $("#inputPasswordCheck").val();
 		if (pw1 != pw2) {
 			$("#warning").show();
        }else{
        	$("#warning").hide();
        }
 	};
</script>
</head>
<body>
	<article class="container">
	
	<h1>회원가입</h1><br/>
	
	
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="join"/>
			<div class="form-group">
				<label for="inputName">이름</label>
				<input type="text" class="form-control" id="inputName" name="inName" placeholder="이름을 입력해주세요"required>
			</div>
			<div class="form-group">
				<label for="inputId">아이디</label>
			<div class="form-inline">
				<input type="text" class="form-control"id="inputId" name="inId" placeholder="아이디를 입력해주세요" style="width:80%;"required>
				<input class="btn btn-primary" type="button" id="idchk"value="중복확인"style="float:right;">
				<span id="idError"style="color:red">이미 존재하는 아이디 입니다.</span>
				<span id="idCan" style="color:blue">사용 가능한 아이디 입니다.</span>
			</div>
			<div class="form-group">
				<label for="InputEmail">이메일 주소</label>
				<input type="email" class="form-control" id="InputEmail" name="inEmail" placeholder="이메일 주소를 입력하세요" required>
			</div>
			</div>
			<div class="form-group">
				<label for="inputPassword">비밀번호</label>
				<input type="password" class="form-control"id="inputPassword" name="inPw" placeholder="비밀번호를입력하세요."required>
			</div>
			<div class="form-group">
				<label for="inputPasswordCheck">비밀번호 확인</label>
				<input type="password" class="form=control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 한 번 더 입력 해 주세요" onkeyup="pwok()"required>
			</div>
			<div class="form-group">
				<label for="inputMobile">휴대폰 번호</label>
				<input type="tel" class="form-control"id="inputMobile"name="inPhone"placeholder="휴대폰번호를 입력하세요."required>
			</div>
			<div class="form-group">
				<label for="inputtelNo">주소</label>
				<input type="text" class="form-control" id="inputAddr" name="inAddr" placeholder="주소 입력하세요."required>
			</div>
			<div class="form-group">
				<label for="inputgender">성별</label>
				<input type="checkbox" class="form-control" id="inputGender01" name="inGender" required>
				<label for="inputGender01">남자</label>
				<input type="checkbox" class="form-control" id="inputGender02" name="inGender" required>
				<label for="inputGender02">여자</label>
			</div>
			
			<div class="form-group">
				<label for="inputbirth">생일</label>
				<input type="date" id="inputYears">년
			</div>
			
			<div class="form-group">
				<label for="picture">프로필 사진</label>
				<input type="file" name="file">
			</div>
			
			<div class="form-group">
				<button type="submit" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></button>
				<button type="button" class="btn btn-warning" onclick="location.href='home.do?command=main'">가입 취소<i class="fa fa-times spaceLeft"></i></button>
			</div>
			
			
			
			</form>
		</article>
</body>
</html>