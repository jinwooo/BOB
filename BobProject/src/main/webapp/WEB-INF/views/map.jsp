<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
$(function(){
		$("#btn02").click(function(){
			$("#result").attr("src","map_search.do");
		})
		
		$("#btn03").click(function(){
			$("#result").attr("src","map_search2_1.do");
		})
		
		$(".select").click(function(){
			var sel = $(this).html();
			$("#result").attr("src","map_search.do?foodselect="+sel);
		})
	
/* 
		function add(){
			var name = $("#result").contents().find("#namearray").text();
			var address = $("#result").contents().find("#address").text();
			var phone = $("#result").contents().find("#phone").text();
			
			var res = name.split(",");
			var res2 = address.split(",");
			var res3 = phone.split(",");
			var top = "<tr><th>장소명</th>"
					+"<th>주	소</th>"
					+"<th>전화번호</th></tr>";
			$("#name_table").append(top); 
			
			for(var i=0; i<res.length; i++){
				var a = "<tr class='prop'><td>"+res[i]+"</td>"
						+"<td>"+res2[i]+"</td>"
						+"<td>"+res3[i]+"</td></tr>";
				$("#name_table").append(a); 	
			}
		}
		
		function remove(){
			$("#name_table").empty();
		}
		
 */
	})
</script>
<body>

	<div id="header" style="width: 100%; height: 200px; background-color: blue;">
		<h1>헤더</h1>
	</div>
	<div id="food_selction" style="width: 100%; height: 150px; margin-top: 20px;">
		<div class="select" style="float: left; width: 150px; height: 150px; 
			background-color: red; border-radius: 100%; margin-right: 10px;">한식</div>
			
		<div class="select" style="float: left; width: 150px; height: 150px; 
			background-color: yellow; border-radius: 100%; margin-right: 10px;">중식</div>
			
		<div class="select" style="float: left; width: 150px; height: 150px; 
			background-color: blue; border-radius: 100%; margin-right: 10px;">양식</div>
			
		<div class="select" style="float: left; width: 150px; height: 150px; 
			background-color: blue; border-radius: 100%;">맛집</div>
	</div>
	<iframe name="result" id="result" style="width: 100%; height: 600px; border: none;" scrolling="no" src="map_search.do?res=1"></iframe>	

	<div id="footer" style="width: 100%; height: 200px; background-color: yellow;">
		<h1>푸터</h1>
	</div>
		

</body>
</html>