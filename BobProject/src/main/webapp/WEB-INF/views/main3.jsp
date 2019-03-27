<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=PT+Sans|Ubuntu:400,500" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('3f8aa77b19d70157207d3f3996591846');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
 Kakao.Auth.loginForm({
	 success: function(authObj) {
      //alert(JSON.stringify(authObj));
	
      Kakao.API.request({
     url: '/v1/user/me',
     success: function(res) {
       /*  kout(); */
             location.href="kakao.do?snsLogin&id="+res.id+"&user_name="+res.properties.nickname 
             url:"kakao.do?kakaologin&kakaoid="+res.user_id+"&kakaoemail="+res.user_email+"&kakaoname="+res.user_name
            
             		 	
		   var id = res.id;
        $("#kako_id").val(id);  
         var email = res.kaccount_email;
        $("#kako_email").val(email); 
      var nickname = res.properties['nickname'];
        $("#kako_nickname").val(nickname); 	    
        alert(nickname); 
         alert(id);  
       
     	}
       })

    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};


//]]>
function kout(){
    
    Kakao.Auth.logout(function(data){
             alert(data)
         });
 }
</script>
		<title>Login to Celyes</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript">

		// top 버튼 시작
		$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('#MoveTop').fadeIn();
        } else {
            $('#MoveTop').fadeOut();
        }
    });
    
    $("#MoveTop").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});
		// top 버튼 끝

		// 로그인 시작
		$(document).ready(function(){
	  var signUp = $('.signup-but');
	  var logIn = $('.login-but');
	  
	  signUp.on('click', function(){
	    $('.login').fadeOut('slow').css('display', 'none');
	    $('.sign-up').fadeIn('slow');
	    
	    $('.form-container').animate({left: '10px'}, 'slow');
	  });
	  
	  logIn.on('click', function(){
	    $('.login').fadeIn('slow');
	    $('.sign-up').fadeOut('slow').css('display', 'none');
	    
	    $('.form-container').animate({left: '400px'}, 'slow');
	  });
	});
		// 로그인 끝
		
		</script>
		<style type="text/css">
		
/*** Mixins & Default Styles ***/
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  overflow-x: hidden;
  overflow-y: scroll;
}

/*** Color Variables ***/
/*** Centering Hack ***/
/*** Header Styles ***/
/*** Navigation Styles ***/
/*** Menu Styles ***/

/*** Hero Section Styles ***/
#hero-section {
  width: 100%;
  padding-left: 1px;   
  display: flex;
  align-items: center;
  background-color: white;
}

#head-line {
  width: 520px;
  height: 30px;
  background: #fff;
  border-radius: 90px;
  position: relative;
}



/*** top 버튼 ***/

  a#MoveTop {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
	}
	#topButton{
    width:50px;
    height: 50px;
	}
	
/*** first ***/

  #video-background{
  position: relative;
  right: 0; 
  bottom: 0;
  width: 100%;
  max-width:100%;
  height: 80%;
  
/* min-height: 100%; */
/*    height: 100%;  */
  z-index: 1;
}
h1{ margin: 0px;}

 #onvideo{
	position: absolute;
 	top: 0%;
	z-index: 5;
	width: 100%;
	height: 100%; 
	background: rgba(0,0,0,0.5);
}



button:hover{
  cursor: pointer;
}
.hide{
  display: none;
}
.wrapper{
  background: rgba(0,0,0,0.6);
  position: relative;
  width: 800px;
  height: 368px;
  margin: 0 auto;
  top: 43%;
/*   margin-top: 150px; */
}
.left,
.right{
  width: 50%;
}
.left{
  float: left;
}
.right{
  float: right
}
.back-header,
.back-p{
  margin: 20px;
  color: #fafafa;
  letter-spacing: 1px;
  
}
.back-header{
  font-family:'Ubuntu';
  font-size: 30px;
  font-weight: 500;
}
.back-p{
  font-family: 'PT Sans';
  letter-spacing: 1px;
  font-size: 20px;
  line-height: 30px;
  margin-right: 60px;
}
.background button{
  position: absolute;
  left: 0;
  bottom: 60px;
}
.background .left button{
  left: 20px;
}
.background .right button{
  left: 420px;
}
.form-container{
  position: absolute;
  width: 375px;
  height: 430px;

  background-color: white;
  top: -25px;
  left: 10px;
  box-shadow: 9px 13px 16px 0px rgba(0,0,0,0.75);
}
.sign-up,
.login{
  margin: 20px;
}
.back-btn{
  width: 100px;
  height: 30px;
  font-size: 15px;
  border: 0;
  border-radius: 3px;
  background: transparent;
  border: 1px solid white;
  color: #fafafa;
  transition: .3s all;
}
.back-btn:hover{
  background-color: #145977;
  border: 1px solid #145977;
}
.form-btn{
  display: block;
  margin-top: 30px;
  width: 150px;
  height: 35px;
  font-size: 18px;
  border: 0;
  border-radius: 3px;
  background-color: #FC7D5F;
  color: #fafafa;
  transition: .4s all;
}
.sign-up button:hover,
.login button:hover{
  background-color: #C53716;
}
.form-header{
  font-size: 32px;
  color: #FC7D5F;
}
.form-container input{
  margin-top: 15px;
  width: 80%;
  height: 30px;
  border: 0;
  border-bottom: 1px solid #888;
}
input[type="text"],
input[type="email"]{
  color: #555;
}
.form-container i{
  margin-left: 10px;
  margin-bottom: -5px;
  color: #888;
}
.login button,
.forgot
{
  display: inline-block;
}
.forgot{
  margin-left: 15px;
  text-decoration: none;
  color: black;
}
.forgot:hover{
  color: #FC7D5F;
  text-decoration: underline;
}

/*** second ***/

#sec-back1{
 	/* background-image:url("resources/image/cooking.jpg");  */

/* 	background-color: rgba(0,0,0,0.5); */
	width: 100%;
	height: 100%;
	z-index: 2;
}

#th-back{
	/* background-image:url("resources/image/salad.jpg"); */
	width: 100%;
	height: 100%;
	z-index: 2;
}



/*** Responsive Menu For Smaller Device ***/
@media screen and (max-width: 767px) {
  #menu-toggle {
    display: flex;
  }


  #head-line {
    -webkit-transform: scale(0.8);
            transform: scale(0.8);
  }

}

</style>
	<script type="text/javascript">
 	$(function(){
		$("#alert-success").hide();
 		$("#alert-dangr").hide();
		$("#pwch").hide();
	//이메일 인증 팝업
	$(document).on('focus','#sendMessageButton',function(){		
		setTimeout(function(){
			$("#user_birth").focus();
		},0);
		window.open('mailform.do','test','width=400,height=400');
		
	});
	// 아이디 인증 팝업
	$(document).on('focus','#idChk',function(){
		setTimeout(function(){
			$("#pass").focus();
		},0);
		window.open('idChk.do','test','width=400,height=400');
	});
	$(document).on('click','#findinfo',function(){
		
		window.open('findform.do','test','width=400,height=400');
	});
	
  	// 비밀번호 확인
	 $(document).on('keyup','#passchk',function(){
		 	$("#pwch").show()
	 		var pw1 = $("#pass").val();
	 	 	var pw2 = $("#passchk").val();
	 if (pw1 == pw2) {
 	 		$("#alert-success").show();
            $("#alert-danger").hide();
 	       }else{
 	       	$("#alert-success").hide();
            $("#alert-danger").show();
 	       }	
		});  
  	// Login
	 $("#login_bu").click(function(){
			var user_idVal = $("#user_id_login").val();
			var user_pwVal = $("#user_pw_login").val();
			
			if(user_idVal == null || user_idVal == ""){
				alert("id를 확인해주세요");
			} else if(user_pwVal == null || user_pwVal == ""){
				alert("pw를 확인해주세요");
			} else {
				
				$.ajax({
					type:"POST",
					url:"loginajax.do",
					data:"user_id="+user_idVal+"&user_pw="+user_pwVal,
					success:function(msg){
						if(msg.sendMessageButton==true){
							location.href="login.do"
						} else {
							alert("아이디와 비밀번호를 확인하여주세요");
						}
					},
					error:function(){
						alert("로그인 실패");
					}
				});
			}
	 });
  	
  	
 	
 	});

</script>
	</head>

	<body>

<header>



  <div id="hero-section">
   <!--  <div id="head-line"></div> -->
     <!-- <div id="heading"></div> -->
   <video id="video-background" src="resources/video/잡채.mp4" autoplay="autoplay" muted="muted" loop="loop" > 당신의 브라우저에서는 실행되지 않습니다.</video>
			<div id="onvideo">
				 	 <div class="wrapper">
    <div class="background" style="height: 80%;">
      <div class="left">
        <h2 class="back-header">Dont have an account yet?</h2>
        <p class="back-p">Well doggonit you should sign up today!</p>
        <button class="back-btn signup-but">SIGN UP</button>
      </div>
      <div class="right">
        <h2 class="back-header">Do you already have an account?</h2>
        <p class="back-p">Well doggonit let's get you logged in!</p>
        <button class="back-btn login-but">LOGIN</button>
      </div>
    </div>
    <div class="form-container">
    <form method="post" action="joinuser.do" >
      <div class="sign-up">
        <h2 class="form-header">SIGN UP</h2>
        <input type="text" id="idChk" name="user_id"  placeholder="ID" readonly="readonly" />       
        <input type="password" id="pass" name="user_pw" placeholder="Password" />
        <input type="password" id="passchk" placeholder="Password Check" />
    	<div id="pwch">
        <div class="alert alert-success" id="alert-success" style="color:blue">비밀번호가 일치합니다</div>
		<div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지 않습니다.</div>
    	</div>
        <input type="text" id="name" name="user_name" placeholder="Name" />
        <input type="text" id="sendMessageButton" name="user_email" placeholder="Email" readonly="readonly" />
        <input type="hidden" id="user_confirm" name="user_confirm" value="">
        <input type="date" id="user_birth" name="user_birth" placeholder="Birth" />
        
        <button type="submit" class="form-btn">SIGN UP</button>
      </div>
      </form>
      <div class="login hide">
        <h2 class="form-header">LOGIN</h2>
        <input type="text" id="user_id_login" name="user_id" placeholder="Id"><i class="fa fa-envelope-o"></i></input>
        <input type="password" id="user_pw_login" name="user_pw" placeholder="Password"><i class="fa fa-lock"></i></input>
        <button class="form-btn" id="login_bu"  >LOGIN</button>
        <a class="forgot" id="findinfo">Forgot password</a><br/>
        	<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
		width="254" height="55"  style="display: block; margin: auto;"/>
	</a>
      </div>
    </div>
  </div>

			</div>	<!-- onvideo -->
  </div>
</header>
</body>
</html>