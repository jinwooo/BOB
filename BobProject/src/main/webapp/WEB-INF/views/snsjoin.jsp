<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).on('focus','#sendMessageButton',function(){		
	setTimeout(function(){
		$("#user_birth").focus();
	},0);
	window.open('mailform.do','test','width=400,height=400');
	
});
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div class="background" style="height: 80%;">
  <div class="form-container" >
    <form method="post" action="joinsns.do" >
      <div class="sign-up">
        <h2 class="form-header">SIGN UP</h2>
        <input type="text" id="idChk" name="user_id" value="${user_id }"  placeholder="ID" readonly="readonly" />       
        <input type="password" id="pass" name="user_pw" value="${user_pw }"  readonly="readonly" placeholder="Password" />
        <input type="text" id="name" name="user_name" placeholder="Name" />
        <input type="text" id="sendMessageButton" name="user_email" placeholder="Email" readonly="readonly" />
        <input type="hidden" id="user_confirm" name="user_confirm" value="">
        <input type="date" id="user_birth" name="user_birth" placeholder="Birth" />
        
        <button type="submit" class="form-btn">SIGN UP</button>
      </div>
      </form>
      </div>
      </div>
</body>
</html>