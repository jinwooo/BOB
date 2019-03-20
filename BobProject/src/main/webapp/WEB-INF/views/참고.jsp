<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  		<link href="https://fonts.googleapis.com/css?family=PT+Sans|Ubuntu:400,500" rel="stylesheet"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
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

</script>
<style type="text/css">
body {

	margin: 0;
	padding: 0;
	background: #333;
	background-attachment: fixed;
	background-size: cover;
    font-family: 'PT Sans';
}
#first{
  position: relative;
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 100%;
/*   min-height: 100%; */
  background: rgba(0,0,0,0.5);
  width: 100%; 
  z-index: 0;
}
#video-background{
  position: relative;
  right: 0; 
  bottom: 0;
  width: 100%;
  max-width:100%;
/* min-height: 100%; */
/*    height: 100%;  */
  z-index: -1;
}

#backcolor{
position: relative;
  right: 0; 
  bottom: 0;
  min-width: 100%; 
/*    min-height: 100%;  */
  width: 100%; 
  height: 100%;
  background: rgba(0,0,0,0.5);
  z-index: 1;
}

#second{
/* position: fixed; */
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 950px;
/*   min-height: 100%; */
  width: auto; 
  background: rgb(24,65,62);
  z-index: 0;
}
#third{
/* position: fixed; */
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 950px;
/*   min-height: 100%; */
  width: auto; 
  background: rgb(172,12,72);
  z-index: 0;
}
#fourth{
/* position: fixed; */
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 950px;
/*   min-height: 100%; */
  width: auto; 
  background: rgb(52,62,52);
  z-index: 0;
}
#fifth{
/* position: fixed; */
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 950px;
/*   min-height: 100%; */
  width: auto; 
  background: rgb(0,93,112); 
  z-index: 0;
}
#sixth{
/* position: fixed; */
  right: 0; 
  bottom: 0;
  min-width: 100%; 
  height: 950px;
/*   min-height: 100%; */
  width: auto; 
  background: rgb(102,72,12);
  z-index: 0;
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

#one{
	display:inline; 
	float: left; 
	width: 50%; 
	height: 100%; 
}
#two{
	 style="display:inline-block; 
	 width: 50%; 
	 height: 100%;"
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
  width: 50%;
  height: 35%;
  margin: 0 auto;
  top: 25%
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
  height: 460px;
  background-color: white;
  top: -25px;
  left: 10px;
  box-shadow: 9px 13px 16px 0px rgba(0,0,0,0.75);
}
.sign-up,
.login{
  margin: 40px;
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
#sec-back1{
	background-image:url("resources/image/cooking.jpg");
	background-size: 1455px 475px;
	background-color: rgba(0,0,0,0.5);
	width: 100%;
	height: 50%;
	z-index: 10;
}
#sec-back2{
	background:rgb(220,200,200);
	width: 100%;
	height: 50%;
	z-index: 10;
}
#th-back{
	background-image:url("resources/image/salad.jpg");
	width: 100%;
	height: 100%;
	z-index: 10;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div id="container">
		<div id="first">
			<!-- <div id="backcolor"></div> -->
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
      <div class="sign-up">
        <h2 class="form-header">SIGN UP</h2>
        <input type="text" id="user" placeholder="ID"><i class="fa fa-user"></i></input>
        <input type="password" id="pass" placeholder="Password"><i class="fa fa-lock"></i></input>
        <input type="password" id="passchk" placeholder="Password Check"><i class="fa fa-lock"></i></input>
        <input type="text" id="email" placeholder="Email"><i class="fa fa-envelope-o"></i></input>
        <input type="text" id="adress" placeholder="Adress"><i class="fa fa-home"></i></input>
        
        <button class="form-btn">SIGN UP</button>
      </div>
      <div class="login hide">
        <h2 class="form-header">LOGIN</h2>
        <input type="text" id="email" placeholder="Email"><i class="fa fa-envelope-o"></i></input>
        <input type="password" id="pass" placeholder="Password"><i class="fa fa-lock"></i></input>
        <button class="form-btn">LOGIN</button>
        <a class="forgot" href="#">Forgot password</a>
        
      </div>
    </div>
  </div>

			</div>	<!-- onvideo -->
		</div><!-- first -->
		<div id="second">
			<div id="sec-back1">
				<h1  style="padding-left:180px; padding-top:300px;  color: white; font-size: 52px;">먹고 싶은 음식</h1>
				<h1  style="padding-left:180px; padding-top:0px;  color: white; font-size: 52px;">마음대로 먹자!</h1>
			</div>
			<div id="sec-back2">
			<span style="padding-left: 160px; padding-top: 40px; color: white; font-size: 28px;">매번 정해진 음식만 먹었다구요?</span>
			<span style="padding-left: 160px; color: white; font-size: 28px;">먹고 싶은 음식을 투표하고 맘껏 먹자! </span>
			<!-- <h1 style="color: white;">두번째!</h1> --> 
			</div>
			
		</div><!-- second -->
		<div id="third">
			<div id="th-back">
				<h1  style="padding-left:180px; padding-top:300px;  color: white; font-size: 52px;">오늘의 식단은?</h1>
			</div>

		</div><!-- third -->
		<div id="fourth">
			<div id="four-back">
				<img alt="채팅" src="resources/image/채팅.png" style="width: 200px; height: 400px;">
			</div>
		</div><!-- fourth -->
		<div id="fifth">
			<h1 style="color: white;">다섯번째!</h1>
		</div><!-- fifth -->
		<div id="sixth">
			<h1 style="color: white;">여섯번째!</h1>
		</div><!-- sixth -->
		
	</div><!-- container -->
	
	<a id="MoveTop" href="#"><img id="topButton" alt="top" src="resources/image/top.png"></a>
</body>
</html>