<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

<%
	String id="밥";
	/* String idchk = (String)session.getAttribute("idchk"); */
%>
/* //아이디 중복체크 팝업
function idchk() {
	window.open("idchk.jsp", "아이디 중복체크", "width=500,height=300");

}
 */	//아이디중복체크및 체크박스 동의를 안누르고 그 외 공간 누르면
 	$(function(){
		$("#warning").hide();
		$("#idError").hide();
		$("#idCan").hide();
	/* 	$("#join-submit").attr("disabled",true); */
		
	$("#ex_chk").click(function () {
			if($("input:checkbox[id='ex_chk']").is(":checked")==false){
				$("#join-submit").attr("disabled",true);
			}
	}) 
	
	//이메일 인증 팝업
	$(document).on('click','#sendMessageButton',function(){
		window.open('mailform.do','test','width=400,height=400');
	});
	

	
	//중복확인 및 아이디 입력확인
 	$("#idchk").click(function(){
 		var idvalue = $("#inputId").val();
 		
 		if(!idvalue){
 			alert("아이디를 입력해주세요");
 			return false;
 		}
 		
 		$.ajax({
 			url:"joinajax.do?command=idCheck&inId="+idvalue,
 			
 			success:function(msg){
 				if($.trim(msg)=="사용불가"){
 					$("#idError").show();
 					$("#idCan").hide();
 					$("#email").attr("value",msg);
 					
 				}else{
 					$("#idCan").show();
 					$("#idError").hide();
 					if($("input:checkbox[id='ex_chk']").is(":checked")){
 						$("#join-submit").attr("disabled",false);
 					}else{
 					}
 					
 				}
 			},
 			error:function(){
 				alert("통신실패");
 			}
 		})
 	   }) 
 	   
	})
 /* // 전화번호 숫자 */
	 function numkeyCheck(event) {
		  var code = event.keyCode; 1
		  if (code > 47 && code < 58) {
		    return;
		  } 
		  event.preventDefault();
		} 
 

	
  	// 비밀번호 확인
  	$(function(){
 		$("#alert-success").hide();
 		$("#alert-dangr").hide();
 		$("input").keyup(function(){
 			var pw1 = $("#inputPassword").val();
 	 		var pw2 = $("#inputPasswordCheck").val();
 	 		if (pw1 == pw2) {
 	 			$("#alert-success").show();
                $("#alert-danger").hide();
                $("#join-submit").removeAttr("disabled");
 	        }else{
 	        	$("#alert-success").hide();
                $("#alert-danger").show();
                $("#join-submit").attr("disabled", "disabled");
 	        }	
 			
 		});	
 		
 	});   
 	
function save(){
	var str3 = document.getElementById('');
	str3.submit();
	alert("가입 완료")
}
function countCheck(){
	if(count==1){
		count =0;
	}
		
}

  
  

</script>
</head>
<body>
	<article class="container">	
	 <div class="center">
	<h1>회원 정보를 입력해주세요</h1><br/>
	<form method="post" action="JoinController.do" id="join">
		<input type="hidden" name="command" value="join"/>
		
			<div class="form-group" align="center">
				<label for="inputName">이름</label>
				<input type="text" class="form-control" id="inputName" name="inName" placeholder="이름을 입력해주세요"required>
			</div>
			
			<div class="form-group" align="center">
				<label for="inputId">아이디</label>
			<div class="form-inline">
				<input type="text" class="form-control"id="inputId" name="inId" <%--placeholder= "아이디를 입력해주세요" style="width:80%;" value="<%=((String)session.getAttribute("idchk")==null)?"아이디":(String)session.getAttribute("idchk") %>"  --%>placeholder="아이디" id="id" name="userid" style="background-color:white" required="required" autofocus="autofocus" onclick="idchk();" required>
				<input class="btn btn-primary" type="button" id="idchk"value="중복확인"style="float:right;">
				<span id="idError"style="color:red">이미 존재하는 아이디 입니다.</span>
				<span id="idCan" style="color:blue">사용 가능한 아이디 입니다.</span>
			</div>
			</div>
			
		 	<div class="form-group" align="center" id="button">
				<label for="InputEmail">이메일</label>
				<input type="email" class="form-control" id="InputEmail" name="inEmail" placeholder="이메일을 입력하세요" required>
				<input type="hidden" class="form-control" placeholder="인증코드" id="mailcode" name="useremailcode" required="required" onclick="mailform();" readonly="readonly" style="background-color:white;" required data-validation-required-message="Please enter your email.">				
				<input type="button"  class="btn btn-primary" id="sendMessageButton" value="인증하기" onclick="mailform();"/>
                <p class="help-block text-danger"></p>
			
			</div>
			
			
			<div class="form-group" align="center">
				<label for="inputPassword">비밀번호</label>
				<input type="password" class="form-control"id="inputPassword" name="inPw" placeholder="비밀번호를입력하세요."required>
			
	
			
			
			<div class="form-group" align="center">
				<label for="inputPasswordCheck">비밀번호 확인</label>
				<input type="password" class="form=control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 한 번 더 입력 해 주세요"required>
		
			</div>
			<div class="alert alert-success" id="alert-success" style="color:blue">비말번호가 일치합니다</div>
			<div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
			</div>
			
			<div class="form-group" align="center">
				<label for="inputMobile">전화번호</label>
				<input type="tel" class="form-control"id="inputMobile"name="inPhone" onKeyPress="return numkeyCheck(event)" placeholder="휴대폰번호를 입력하세요."required>
			</div>
			
			
			<div class="form-group" align="center">
				<label for="inputtelNo">주소</label>
				<input type="text" class="form-control" id="inputAddr" name="inAddr" placeholder="주소 입력하세요."required>
			</div>
			
			
			
			
			<div class="form-group" align="center">
				 <button type="submit" id="join-submit" name="join-submit" class="btn btn-primary" onclick="save()">회원가입</button>
				<button type="button" class="btn btn-warning" onclick="location.href='main3.do?command=main3'">가입 취소<i class="fa fa-times spaceLeft"></i></button>
			</div>
			
			
			
			</form>
			</div>
		</article>
	
</body>
</html>