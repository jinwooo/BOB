<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<style type="text/css">
	canvas{
		-moz-user-select:none;
		-webkit-user-select:none;
		-ms-user-select:none;
		}
</style>
</head>
<body>
	<div style="min-width: 33%; min-height: 33%; margin-left: 33%; margin-right: 33%;">
		<canvas id="myChart" width="100%" height="100%"></canvas>
	</div>
	
	<c:forEach items="${menu }" var="menu2">
		<input type="hidden" value="${menu2 }" class="menu2">
	</c:forEach>
	
	<c:forEach items="${kal }" var="kal2">
		<input type="hidden" value="${kal2 }" class="kal2">
	</c:forEach>
	
	<script>
		var ctx = document.getElementById("myChart");
		var menu = new Array();
		var kal = new Array();
		for(var i=0; i<${size}; i++){
			menu[i] = $(".menu2").eq(i).attr("value");
			kal[i] = $(".kal2").eq(i).attr("value");
		}
		
		var myChart = new Chart(ctx,{
			type: 'horizontalBar',
			data: {
				labels: menu,
				datasets:[{
					data: kal,
					backgroundColor: [
						'#F28169',
						'#8AC4E3',
						'#DEDF04',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)'
					],
					borderColor:[
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)'
					],
					fill: false
				}]
			},
			options: {
				resonsive: true,
				title:{
					display: true,
					text: "막대 차트 테스트"
				},

				hover:{
					mode: "nearest",
					intersect: true
				},
				scales: {
		            xAxes: [{
		                display: false,
		            }],
		            yAxes: [{
		                display: true,
		                ticks: {
		                    autoSkip: false,
		                }
		            }]
				},
				barStrokeWidth: 9,
			}
		});
		
</script>
</body>
</html>