<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Squada+One);
body,
html {
  height: 100%;
  overflow: hidden;
  position: relative;
  margin: 0;
  padding: 0;
  background: none black;
}

.abs-center {
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  /* IE 9 */
  -webkit-transform: translate(-50%, -50%);
  /* Safari */
  -moz-transform: translate(-50%, -50%);
  /* Firefox Older versions*/
  -o-transform: translate(-50%, -50%);
  /* Opera */
  transform: translate(-50%, -50%);
}

.abs-fs {
  background: url("http://svencreations.com/demo/images/easter-preview.jpg") no-repeat center center transparent;
  background-size: cover;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.codepen-preview h1 {
  color: white;
  font-family: "Open Sans", sans-serif;
  font-weight: normal;
  font-size: 24px;
}

body.secure {
  background-image: url(resources/image/파스타.jpg);
  background-position: center center;
  background-repeat: no-repeat;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

body.secure:after {
  content: "";
  background: rgba(0,0,0,0.5);
}

a {
  display: block;
  width: 220px;
  height: 70px;
  z-index: 1000;
}

a:after {
  content: "";
  background: linear-gradient(120deg, #6559ae, #ff7159, #6559ae);
  background-size: 400% 400%;
  -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 4px 66px, 4px 100%, 100% 100%, 100% 0%, 0% 0%);
  -moz-animation: gradient 3s ease-in-out infinite, border 1s forwards ease-in-out reverse;
  -webkit-animation: gradient 3s ease-in-out infinite, border 1s forwards ease-in-out reverse;
  animation: gradient 3s ease-in-out infinite, border 1s forwards ease-in-out reverse;
}

a > span {
  display: block;
  background: linear-gradient(120deg, #6559ae, #ff7159, #6559ae);
  background-size: 400% 400%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-animation: gradient 3s ease-in-out infinite;
  -webkit-animation: gradient 3s ease-in-out infinite;
  animation: gradient 3s ease-in-out infinite;
}

/* helpers */
.absolute-centering, body:after, a, a:after {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
}

.text-formatting, a {
  text-transform: uppercase;
  text-decoration: none;
  text-align: center;
  letter-spacing: 2px;
  line-height: 70px;
  font-family: "Squada One", cursive;
  font-size: 28px;
}

/* motion */
@-moz-keyframes gradient {
  0% {
    background-position: 14% 0%;
  }
  50% {
    background-position: 87% 100%;
  }
  100% {
    background-position: 14% 0%;
  }
}
@-webkit-keyframes gradient {
  0% {
    background-position: 14% 0%;
  }
  50% {
    background-position: 87% 100%;
  }
  100% {
    background-position: 14% 0%;
  }
}
@keyframes gradient {
  0% {
    background-position: 14% 0%;
  }
  50% {
    background-position: 87% 100%;
  }
  100% {
    background-position: 14% 0%;
  }
}
@-moz-keyframes border {
  0% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 4px 66px, 4px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  25% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 216px 66px, 216px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  50% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 100% 0%, 0% 0%);
  }
  75% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 0%, 0% 0%);
  }
  100% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 0% 100%);
  }
}
@-webkit-keyframes border {
  0% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 4px 66px, 4px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  25% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 216px 66px, 216px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  50% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 100% 0%, 0% 0%);
  }
  75% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 0%, 0% 0%);
  }
  100% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 0% 100%);
  }
}
@keyframes border {
  0% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 4px 66px, 4px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  25% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 66px, 216px 66px, 216px 100%, 100% 100%, 100% 0%, 0% 0%);
  }
  50% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 216px 4px, 100% 0%, 0% 0%);
  }
  75% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 4px, 4px 0%, 0% 0%);
  }
  100% {
    -webkit-clip-path: polygon(0% 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 4px 100%, 0% 100%);
  }
}
</style>

</head>


<body class="secure">


<div id="dummy-image" class="codepen-preview abs-fs" style="display: none">
 
</div>

<a id="secure-button" href="main3.do" style="display: block;"><span>Enter BOBTONG</span></a>

</body>
</html>