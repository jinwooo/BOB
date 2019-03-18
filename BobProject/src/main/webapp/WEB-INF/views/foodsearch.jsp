<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	
		<form action="food.do" >
            <tr>
                <td><input type="text" name="food">           
           <br><br> 
            <input type="submit" value="찾기"></td>
           </tr> 
            
         	<c:forEach items="${list}" var="dto" >
         	<b>${dto.foodname }</b> <br/>      	
         	</c:forEach> 
        </form>



</body>
</html>