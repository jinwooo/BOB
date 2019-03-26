<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
  background: #FFF;
  color: #444;
  font-family: 'Lato', sans-serif;
  margin: 0 auto;
  overflow-X: hidden;
  overflow-Y: auto;
  padding: 0;
}

.header_menu {
  color: inherit;
  text-decoration: none;
}

a:hover {
  color: #FF5959;
}

ul,
li {
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
}

ul li {
  display: inline-block;
}

header,
section,
.container,
.box {
  margin: 0;
  overflow: hidden;
  padding: 0;
  position: relative;
}

header {
  background: #FFF;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.35);
  height: 60px;
  left: 0;
  position: fixed;
  right: 0;
  top: 0;
  width: initial;
  z-index: 9;
  -webkit-transform: matrix(1, 0, 0, 1, 0, 0);
  -moz-transform: matrix(1, 0, 0, 1, 0, 0);
  transform: matrix(1, 0, 0, 1, 0, 0);
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

html.active header {
  -webkit-transform: matrix(1, 0, 0, 1, -320, 0);
  -moz-transform: matrix(1, 0, 0, 1, -320, 0);
  transform: matrix(1, 0, 0, 1, -320, 0);
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

header .box {
  display: none;
  height: 40px;
  line-height: 40px;
  margin: 0 80px;
  padding: 10px;
}

header .box > ul {
  display: flex;
}

header .box > ul li {
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
}

#overlay {
  background: #000;
  bottom: 0;
  height: 100%;
  left: 0;
  opacity: 0;
  overflow: hidden;
  position: fixed;
  right: 0;
  top: 0;
  visibility: hidden;
  width: 100%;
  z-index: 99;
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

html.active #overlay {
  opacity: .65;
  visibility: visible;
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

#home,
.logo > a {
  border-radius: 8px;
  box-shadow: inset 0 0 0 2px #FFF, inset 0 0 0 3px #FF5959;
  color: #FF5959;
  display: block;
  font-size: 32px;
  height: 36px;
  left: 0;
  line-height: 36px;
  margin: 10px 20px 10px 30px;
  overflow: hidden;
  padding: 2px;
  position: fixed;
  text-align: center;
  top: 0;
  width: 36px;
}

.logo {
  font-size: 32px;
  height: 40px;
  line-height: 40px;
  margin: 0 auto;
  overflow: hidden;
  padding: 10px;
  position: relative;
  width: initial;
}

.logo > a {
  display: inline-block;
  margin: 0 auto 0 10px;
  position: relative;
}


html.active,
html.active body {
  overflow: hidden;
}




html.active menu .container {
  -webkit-transform-origin: 0% 50% 0px;
  -moz-transform-origin: 0% 50% 0px;
  transform-origin: 0% 50% 0px;
  -webkit-transform: matrix(1, 0, 0, 1, 0, 0);
  -moz-transform: matrix(1, 0, 0, 1, 0, 0);
  transform: matrix(1, 0, 0, 1, 0, 0);
  -webkit-transition: all .5s ease-in-out;
  -moz-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
}

@media only screen and (min-width: 520px) {
  header .container {
    max-width: 640px
  }
  header .box {
    display: block;
  }
  section > h1 {
    font-size: 3em
  }
}

</style>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link href='//fonts.googleapis.com/css?family=Abel|Lato:100,300,400,700,900|Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' rel='stylesheet' type='text/css'>
</head>
<body>
<header>
  <div class="container">
    <span id="home" onclick="location.href='/proj/tomain.do'" ><!-- <span class="ion-camera"></span> -->
    	<img src="resources/image/로고.png" style="width: 50px; height: 50px;">
    
    </span>
    <div class="box">
      <ul>
        <li><a class="header_menu" href="/proj/board/listSearch">Notice</a></li>
        <li><a class="header_menu" href="#">Food Manager</a></li>
        <li><a class="header_menu" href="#">Today Food</a></li>
        <li><a class="header_menu" href="#">Suggest</a></li>
        <li><a class="header_menu" href="#">Bob Talk</a></li>
        <li><a class="header_menu" href="#">Map</a></li>
        <li style="float: right;"><a class="header_menu" href="/proj/logout.do">Logout</a></li>
      </ul>
    </div>
  </div>
</header>
</body>
</html>