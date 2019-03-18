<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/jquery.jqplot.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqPlot/1.0.9/plugins/jqplot.donutRenderer.js"></script>
</head>
<body>
	<h1>차트 2</h1>
	<div id="graph" style="width: 500px; height: 500px;"></div>
	<div style="width: 100%; height: 100px;">
		<input type="button" onclick="location.href='main.do'" value="처음으로"></input>
	</div>	
<script type="text/javascript">
	$(function(){
		$.jqplot("graph",[[["첫 번째",50],["두 번째", 22],["세 번째",30],["네 번째",30]]],
				{
					seriesDefaults:{
						renderer: $.jqplot.DonutRenderer,
						rendererOptions:{
							showDataLabels: true
						}
					},
					legend:{
						show:true,
						location: "e"
					}
				}
			);		
	})
	
</script>	
</body>
</html>