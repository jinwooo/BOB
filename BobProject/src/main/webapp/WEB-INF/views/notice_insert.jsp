<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="notice_insert.do" method="post">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="n_title"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td>
					<textarea rows="10" cols="60" name="n_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성"/>
					<input type="button" value="취소"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>