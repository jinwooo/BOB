<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h1 {
  font: 700 36px 'Oswald', sans-serif;
  text-align: center;
  color: #000;
}

.header-span {
  font-weight: 100;
}

hr { 
  max-width: 5em; 
  margin-bottom: 30px; 
}

.all-the-foods {
  max-width: 900px;
  margin: 0 auto;
  text-align: center;
}

div.clip-path-container {
  display: inline-block;
  position: relative;
  height: 250px;
  width: 250px;
  margin: 10px ;
  padding: 3px;
  cursor: pointer;
  transition: all .2s ease-in-out;
  overflow: hidden;  
  border-radius: 50%;
  border-collapse: separate; 
  background-color: #DEDF04;
}

.clip-path-container:focus,
.clip-path-container:active,
.clip-path-container:hover {
  border-radius: 50%;
  outline: none;
} 

.food {
  height: 250px;
  width: 250px;
  background-size: cover;
  transition: all .2s ease-in-out;
  transform: scale(1.7); 
  outline: none;
  overflow: hidden;  
  clip-path: polygon(0 100%, 0 0, 52% 0, 52% 100%);
  clip-path: polygon(0 100%, 0 0, 100% 0, 100% 100%);
}


.clip-path-container:hover .food {
  clip-path: polygon(50% 100%, 50% 0, 100% 0, 100% 100%);
  transform: scale(1.1);
  
}

.clip-path-container:hover .description-holder { 
  left: 20px;
  opacity: 1;
}

.description-holder {
  position: absolute;
  top: 35px;
  left: 120px;
  height: 300px;
  width: 100px;
  transition: all .4s ease-in-out;
  transition-delay: .1s;
  opacity: 0;
  text-align: right;
}

.guac-holder {
  top: 45px;
}

.description-holder h4 {
  font-size: 14px;
  margin-bottom: -8px;
}

.description-holder p {
  max-width: 100px;
  font-size: 12px;
  line-height: 14px;
  text-transform: none;
  
}

.bibimbap {
  background-image: url('resources/image/bibimbap-450x450.png');
  background-position: 0 0;
}

.pizza {
  background-image: url('resources/image/steak-1-450x450.jpg');
}

.guacamole {
  background-image: url('resources/image/feb-class-thaicuisineforwinter-450x450.png');
}

.cookie {
  background-image: url('resources/image/salmon-sashimi-450x450.jpg');
  background-position: 50% 90%;
}

.donut {
  background-image: url('resources/image/A001620011_01.jpg');
  background-position: 50% 70%;
}

.pancake {
  background-image: url('resources/image/cream-cheese-apple-cake-4-450x450.jpg');
  background-position: 50% 90%;
}
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
		$(".clip-path-container").click(function(){
			var sel = $(this).children().children(".select").text();
			$("#result").attr("src","map_search.do?foodselect="+sel);
		})
	})
</script>
<body>
	
	<%@ include file="form/header.jsp" %>
	<div style="margin-top: 100px;">
		<h1>메뉴를 <span class="header-span">선택해주세요</span></h1><hr>
		<div class="all-the-foods">
			<div class="clip-path-container">
				<div class="description-holder">
					<h4 class="select">한식</h4>
					<p>계절감이 뚜렷하고 아름다운 색과 영양항적으로 조화와 균형을 갖춘 건강음식</p>
				</div>
				<div class="food bibimbap"></div>
			</div>
			<div class="clip-path-container">
				<div class="description-holder">
					<h4 class="select">양식</h4>
					<p>치즈에 살고 치즈에 죽고싶으신 분들은 고민하지말고 바로 선택하세요!</p>
				</div>
				<div class="food pizza"></div>
			</div>	  
			<div class="clip-path-container">
				<div class="description-holder guac-holder">
					<h4 class="select">중식</h4>
					<p>각종 기름에 빠지고 싶으신 분들! 여기로 오셔서 선택하시면 됩니다!</p>
				</div>
				<div class="food guacamole"></div>
			</div>
			<div class="clip-path-container">
				<div class="description-holder">
					<h4 class="select">일식</h4>
					<p>강하지 않고 자연의 맛을 그대로 표현하는 일식! 깔끔한 맛을 좋아하시면 선택하세요!</p>
				</div>
				<div class="food cookie"></div>
			</div>
			<div class="clip-path-container">
				<div class="description-holder">
					<h4 class="select">분식</h4>
					<p>그쵸? 입맛 없을 땐 뭐니 뭐니해도 분식이죠?</p>
				</div>
				<div class="food donut"></div>
			</div>
			<div class="clip-path-container">
				<div class="description-holder">
					<h4 class="select">카페</h4>
					<p>식사 전부하셨죠? 느끼하거나 무언가 속이 꽉찬 기분이시죠?</p>		
				</div>
			<div class="food pancake"></div>
			</div>
		</div>
	</div>
	<div style="width: 70%; margin-top: 30px; margin-bottom: 30px; margin-left: 15%; margin-right: 15%; background-color:rgba(0,0,0,0.1); border-radius: 10px;">
		<iframe name="result" id="result" style="width: 100%; height: 510px; border: none;" scrolling="no" src="map_search.do?res=1"></iframe>	
	</div>
	<%@ include file="form/footer.jsp" %>	
		

</body>
</html>