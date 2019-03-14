<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>수정창</h1>

	<form action="notice_update.do" method="post">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="n_no" value="${dto.n_no }" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="user_id" value="${dto.user_id }" ></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="n_title" value="${dto.n_title }" ></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td>
					<textarea rows="10" cols="60" name="n_content" >${dto.n_content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정하기"/>
					<input type="button" value="취소" onclick="location.href='notice_selectone.do?n_no=${dto.n_no }'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>