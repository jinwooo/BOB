<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1 style="text-align: center;">차트1</h1>
	<div
		style="min-width: 33%; min-height: 33%; margin-left: 33%; margin-right: 33%;">
		<canvas id="myChart" width="100%" height="100%"></canvas>
	</div>
	<div style="width: 100%; height: 100px;">
		<input type="button" onclick="location.href='main.do'" value="처음으로"></input>
	</div>
	<script>
		var ctx = document.getElementById("myChart").getContext('2d');
		
		var Options = {
			cutoutPercentage: 30,
			responsive: true
		}

		
		var myChart = new Chart(ctx,{
			type: 'doughnut',
			data: {
				labels: ["한식","증식","양식","일식","간식"],
				datasets:[{
					data: [12,19,3,5,2],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)'
					],
					borderColor:[
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)'
					]
				}]
			},
		options: Options
		});
		
</script>
</body>
</html>