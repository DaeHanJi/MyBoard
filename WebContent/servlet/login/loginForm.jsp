<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='UTF-8'>
<title>회원가입</title>

</head>
<body>
	<form action='loginCheck' method='post'>
		<table border='1' align='center' width='400px' height='200px'>
			<tr>
				<td>
					<table width='400px' height='200px'>
						<tr>
							<th width='20%'>ID</th>
							<td>&nbsp;&nbsp;<input type='text' name='userId' size='20' /></td>
						</tr>
						<tr>
							<th>PW</th>
							<td>&nbsp;&nbsp;<input type='password' name='userPassword'
								size='20' /></td>
						</tr>
						<tr>
							<td align='right' colspan='2'><input type='submit' value='로그인' />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='button' value='회원가입' onclick="location.href='${pageContext.request.contextPath}/servlet/join/joinForm'" />&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>