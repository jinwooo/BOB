<%@page import="com.bob.proj.api.TransApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</script>
</body>
</head>
<%
	TransApi tans = new TransApi();
	String test = "test";
%>
<body> 


			<form action="trans.do"id="test" >
            <tr>
                <td><input type="text" name="text" value="test"> 
                <select name="source" size="1">
                <option value="ko" >한국어</option>
                <option value="en" seleted>영어</option>
            </select> <br><br> 
            <input type="submit" value="번역" ></td>
            </tr>
 
  
 
 
            <br> <br> <br> <br> <br> 번역결과 
            <select name="target" size="1">
                <option value="ko" seleted>한국어</option>
                <option value="en" >영어</option>
            </select> <br>
            <textarea rows="2" cols="20">${result }</textarea>
 			<input type="text" value="<%=tans.TranslateService(test) %>">
 
 
        </form>




</body>
</html>