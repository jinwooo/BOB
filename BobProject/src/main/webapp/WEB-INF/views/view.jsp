<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</body>
</head>
<body>

<form action="trans.do">
            <tr>
                <td><input type="text" name="text"> 
                <select name="source" size="1">
                <option value="ko" >한국어</option>
                <option value="en" seleted>영어</option>
            </select> <br><br> <input
                    type="submit" value="번역"></td>
            </tr>
 
 
 
 
            <br> <br> <br> <br> <br> 번역결과 
            <select name="target" size="1">
                <option value="ko" seleted>한국어</option>
                <option value="en" >영어</option>
            </select> <br>
            <textarea rows="2" cols="20">${result }</textarea>
 
 
 
        </form>




</body>
</html>