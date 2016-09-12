<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class='top'>
	<hr>
		<table>
			<tr>
				<h1>
					<th>하단</th>
					<c:if test="${empty user}">
					<th><a href='${pageContext.request.contextPath}/servlet/login/loginForm'/>로그인</th>
					</c:if>
					<c:if test="${user != null}">
					<th><a href='${pageContext.request.contextPath}/servlet/login/logout'/>로그아웃</th>
					</c:if>
				</h1>
			</tr>
		</table>
	</div>
	
</body>
</html>