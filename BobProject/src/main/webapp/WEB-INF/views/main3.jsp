<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=PT+Sans|Ubuntu:400,500" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

		<meta charset="UTF-8">
		<title>Login to Celyes</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript">
	// 헤더 부분 메뉴 바뀌는 것 시작
		$( () => {
			
			//On Scroll Functionality
			$(window).scroll( () => {
				var windowTop = $(window).scrollTop();
				windowTop > 100 ? $('nav').addClass('navShadow') : $('nav').removeClass('navShadow');
				windowTop > 100 ? $('ul').css('top','100px') : $('ul').css('top','160px');
			});
			
			//Click Logo To Scroll To Top
			$('#logo').on('click', () => {
				$('html,body').animate({
					scrollTop: 0
				},500);
			});
			
			//Smooth Scrolling Using Navigation Menu
			$('a[href*="#"]').on('click', function(e){
				$('html,body').animate({
					scrollTop: $($(this).attr('href')).offset().top - 100
				},500);
				e.preventDefault();
			});
			
			//Toggle Menu
			$('#menu-toggle').on('click', () => {
				$('#menu-toggle').toggleClass('closeMenu');
				$('ul').toggleClass('showMenu');
				
				$('li').on('click', () => {
					$('ul').removeClass('showMenu');
					$('#menu-toggle').removeClass('closeMenu');
				});
			});
			
		});
		// 헤더 부분 메뉴 바뀌는 것 끝
		
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
header {
  width: 100vw;
  height: 100vh;
  background: #5661f2;
  display: flex;
}

/*** Navigation Styles ***/
nav {
  width: 100vw;
  height: 160px;
  background: #46b2f0;
  display: grid;
  grid-template-columns: 1fr 1fr;
  position: fixed;
  z-index: 10;
  transition: all 0.3s;
}
nav.navShadow {
  box-shadow: 0 4px 30px -5px rgba(0, 0, 0, 0.2);
  height: 100px;
}
nav.navShadow #word-mark {
  opacity: 0;
}

#brand,
#menu,
ul {
  display: flex;
  align-items: center;
    list-style:none;
}

#brand {
  padding-left: 40px;
}

#logo {
  width: 55px;
  height: 55px;
/*   border-radius: 50%; */
  cursor: pointer;
}

#logo-img{
	  width: 70px;
  height: 70px;
}


#word-mark {
  width: 120px;
  height: 20px;
/*   background: #fff; */
  border-radius: 90px;
  margin-left: 20px;
/*   opacity: 1; */
  transition: all 0.3s;
}

/*** Menu Styles ***/
#menu {
  justify-content: flex-end;
  padding-right: 40px;
}

li {
  margin-left: 20px;
}
nav li a {
  width: 80px;
  height: 20px;
/*   background: #fff; */
  text-decoration:none;
  display: block;
}

#menu-toggle {
  width: 55px;
  height: 55px;
  background: #2ea8ee;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
  cursor: pointer;
  display: none;
}
#menu-toggle:hover .bar {
  width: 25px;
}
#menu-toggle.closeMenu .bar {
  width: 25px;
}
#menu-toggle.closeMenu .bar:first-child {
  -webkit-transform: translateY(7px) rotate(45deg);
          transform: translateY(7px) rotate(45deg);
}
#menu-toggle.closeMenu .bar:nth-child(2) {
  -webkit-transform: scale(0);
          transform: scale(0);
}
#menu-toggle.closeMenu .bar:last-child {
  -webkit-transform: translateY(-7px) rotate(-45deg);
          transform: translateY(-7px) rotate(-45deg);
}

.bar {
  width: 25px;
  height: 2px;
  background: #fff;
  transition: 0.3s ease-in-out;
}
.bar:nth-child(2) {
  width: 20px;
  margin: 5px 0;
}
.bar:last-child {
  width: 15px;
}

/*** Hero Section Styles ***/
#hero-section {
  width: 100vw;
  height: calc(100vh - 160px);
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 160px;
  background-color: white;
}

#head-line {
  width: 520px;
  height: 30px;
  background: #fff;
  border-radius: 90px;
  position: relative;
}
#head-line:before, #head-line:after {
  content: "";
  height: 30px;
  border-radius: 90px;
}
#head-line:before {
  width: 360px;
  background: #fff;
  position: absolute;
  top: -60px;
  left: 50%;
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
}
#head-line:after {
  width: 200px;
  background: #fff;
  position: absolute;
  left: 50%;
  bottom: -60px;
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
}

/*** Section Styles ***/
section {
  width: 100vw;
  height: calc(100vh - 100px);
  display: flex;
  justify-content: center;
}
section:nth-child(odd) {
  background: white;
}
section:nth-child(even) {
  background: white;
}

#heading {
  width: 120px;
  height: 20px;
  background: #fff;
  border-radius: 90px;
  margin-top: 40px;
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

/*** footer ***/

.footer {
  position: relative;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: #efefef;
  text-align: center;
}

/*** Responsive Menu For Smaller Device ***/
@media screen and (max-width: 767px) {
  #menu-toggle {
    display: flex;
  }

  nav ul {
    display: inline-block;
    width: 100vw;
    height: 0;
    background: #79edfc;
    position: absolute;
    top: 160px;
    -webkit-transform: translate(, );
            transform: translate(, );
    box-shadow: 0 5px 30px -4px rgba(0, 0, 0, 0.2);
    transition: all 0.3s;
  }
  ul.showMenu {
    height: 250px;
  }
  ul.showMenu li {
    height: 80px;
    opacity: 1;
    visibility: visible;
  }

  nav li {
    width: 50%;
    height: 80px;
    float: left;
    padding-left: 40px;
    opacity: 0;
    visibility: hidden;
    margin-left: 0;
    transition: all 0.3s 0.1s;
  }
  nav li:hover > ul{
  	display:block
  }
  li:first-child, li:nth-child(2) {
    margin-top: 80px;
  }

  #head-line {
    -webkit-transform: scale(0.8);
            transform: scale(0.8);
  }

}
/* #youtube {
  position: fixed;
  right: 2vw;
  bottom: 2vh;
  font-size: 30px;
  color: #fff;
} */




		</style>
	</head>

	<body>

<header>
  <nav>
    <div id="brand" style="background-color: rgb(220,200,200); 	z-index: 10;">
      <div id="logo">
      	<img id="logo-img" alt="로고" src="resources/image/로고.png">
      </div>
      <div id="word-mark" >
       	<h2 class="back-header" style="margin: 0; z-index: 999;">BOBTONG</h2>
      </div>
    </div>
    <div id="menu" style="background-color: rgb(220,200,200); z-index: 10;">
      <div id="menu-toggle">
        <div id="menu-icon">
          <div class="bar"></div>
          <div class="bar"></div>
          <div class="bar"></div>
        </div>
      </div>
      <ul>
        <li><a  href="#section00"><span style="margin: 0; font-size: 20px;" class="back-header" >Vote Menu</span></a></li>
        <li><a  href="#section01"><span style="margin: 0; font-size: 20px" class="back-header" >BOB Talk</span></a></li>
        <li><a  href="#section02"><span style="margin: 0; font-size: 20px" class="back-header" >Diet</span> </a></li>
        <li><a  href="#section03"><span style="margin: 0; font-size: 20px" class="back-header">Menu Table</span></a></li>
        <li><a  href="#section04"><span style="margin: 0; font-size: 20px" class="back-header">Find Bistro</span></a></li>
        <li><a  href="#section05"><span style="margin: 0; font-size: 20px" class="back-header">Notice Board</span></a></li>
      </ul>
    </div>
  </nav>
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
  </div>
</header>
<section id="section00">
<div id="sec-back1">
				<h1  style="padding-left:180px; padding-top:300px;  color: white; font-size: 52px;">먹고 싶은 음식</h1>
				<h1  style="padding-left:180px; padding-top:0px;  color: white; font-size: 52px;">마음대로 먹자!</h1>
			</div> 

			
</section>
<section >
  <!-- <img id="sect" alt="채팅" src="" style="width: 30%; height: 70%; margin-top: 7%; margin-right: 40%;"> -->
</section>
<section id="section02">
	<!-- <img alt="운동" src="resources/image/운동.jpg" style="width: 100%; height: 100%; "> -->
</section>
<section id="section03">
  			<div id="th-back">
				<h1  style="padding-left:180px; padding-top:300px;  color: black; font-size: 52px;">오늘의 식단은?</h1>
			</div>
</section>
<section id="section04">
  			<!-- <img alt="지도" src="resources/image/지도(re).jpg" style="width: 100%; height: 100%; "> -->
</section>
<section id="section05">
  			
</section>

	<a id="MoveTop" href="#"><img id="topButton" alt="top" src="resources/image/top.png"></a>
	
<div class="footer">밥으로 소통하는 공간 <strong>BOBTONG</strong></div>
</body>
</html>