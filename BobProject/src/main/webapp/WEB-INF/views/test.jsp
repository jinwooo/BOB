<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.message {
background:#181818;
color:#FFF;
position: absolute;
top: -250px;
left: 0;
width: 100%;
height: 250px;
padding: 20px;
transition: top 300ms cubic-bezier(0.17, 0.04, 0.03, 0.94);
overflow: hidden;
box-sizing: border-box;
  
}

.message h1 {
  color:#FFF;
}

#toggle {
  position:absolute;
  appearance:none;
  cursor:pointer;
  left:-100%;
  top:-100%;
}

#toggle + label {
  position:absolute;
  cursor:pointer;
  padding:10px;
  background: #26ae90;
width: 100px;
border-radius: 3px;
padding: 8px 10px;
color: #FFF;
line-height:20px;
font-size:12px;
text-align:center;
-webkit-font-smoothing: antialiased;
cursor: pointer;
  margin:20px 50px;
  transition:all 500ms ease;
}
.container {
transition: margin 300ms cubic-bezier(0.17, 0.04, 0.03, 0.94);
  padding:5em 3em;
}

#toggle:checked ~ .message {
  top: 300px;
}

#toggle:checked ~ .container {
  margin-top: 0px;
}



</style>
</head>

<body>




<input type="checkbox" name="toggle" id="toggle" />
<label for="toggle"></label>

<div class="container">

  
 <h1>Pure CSS3 Slide Down Toggle Demo</h1>
  <h2> Click the Open button to see hidden mesage.</h2>
 
</div>


  
<div class="message"><h1> hello, I'm a hidden message. You found it.</h1>
<h2>Now Click the Heart button in the bottom to support CSS3</h2>
  


</div>



</body>
</html>