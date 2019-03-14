<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="notice_updateform.do" method="post">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="n_no" value="${dto.n_no }" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="user_id" value="${dto.user_id }" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="n_title" value="${dto.n_title }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td>
					<textarea rows="10" cols="60" name="n_content" readonly="readonly">${dto.n_content }</textarea>
				</td>
			</tr>
			<tr>
				<th>DATE</th>
				<td><input type="text" name="n_date" value="${dto.n_date }" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>VIEW</th>
				<td><input type="text" name="n_view" value="${dto.n_view }" readonly="readonly" ></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정"/>
					<input type="button" value="취소" onclick="location.href='notice_list.do'"/>
					<input type="button" value="삭제" onclick="location.href='notice_delete.do?n_no=${dto.n_no }'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>