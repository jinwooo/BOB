<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section {
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  z-index: 2;
  -webkit-transform: matrix(1, 0, 0, 1, 0, 0);
  -moz-transform: matrix(1, 0, 0, 1, 0, 0);
  transform: matrix(1, 0, 0, 1, 0, 0);
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

#intro {
  background-image: url('resources/image/음식사진1.jpg');
  
}


#portfolio {
  background-image: url('resources/image/채소.jpg');
}

#blog {
  background-image: url('resources/image/파스타.jpg');
}

html.active,
html.active body {
  overflow: hidden;
}

html.active section {
  -webkit-transform: matrix(1, 0, 0, 1, -320, 0);
  -moz-transform: matrix(1, 0, 0, 1, -320, 0);
  transform: matrix(1, 0, 0, 1, -320, 0);
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

section > h1 {
  color: #FFF;
  font-size: 2em;
  left: 0;
  margin: 0 10%;
  position: absolute;
  right: 0;
  text-align: center;
  text-transform: uppercase;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  transform: translateY(-50%);
}

section > h1 > span {
  display: block;
  font-family: 'Cabin', cursive;
  font-size: 16px;
  font-style: italic;
  font-weight: 400;
  text-transform: none;
}

@media only screen and (min-width: 520px) {
  section > h1 {
    font-size: 3em
  }
}
</style>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link href='//fonts.googleapis.com/css?family=Abel|Lato:100,300,400,700,900|Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">
$(function() {
	  var w = $(window).width(),
	    h = $(window).height();
	  //$('section').width(w);
	  $('section').height(h);
	  $('menu .container').height(h - 60);
	  $('body').prepend('<div id="overlay">');

	  $('#menu').click(function() {$('html').addClass('active');});
	  $('#close-menu').click(function() {$('html').removeClass('active');});
	  $('#overlay').click(function() {$('html').removeClass('active');});
	  $(window).resize(function() {
	    var w = $(window).width(),
	      h = $(window).height();
	    //$('section').width(w);
	    $('section').height(h);
	    $('menu .container').height(h - 60);
	  });

	});
</script>
<body>
<%@ include file="form/header.jsp" %>
<section id="intro">
  <h1>
  <br/>La comunicacion es algo natural <span>Y te puedo ayudar.</span></h1>
</section>
<section id="portfolio">
  <h1>Para mirar el futuro,  <span>Solo asi conoceras tu futuro.</span></h1>
</section>
<section id="blog">
  <h1>Hermosa como ninguna <span>Dulce como ninguna.</span></h1>
</section>
<section id="blog">
  <h1>Hermosa como ninguna <span>Dulce como ninguna.</span></h1>
</section>
</body>
</html>