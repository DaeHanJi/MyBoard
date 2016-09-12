<%@page import="board.JoinVO"%>
<%@page import="board.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("userId");
JoinDAO jdao = new JoinDAO();
JoinVO jvo = jdao.selectJoinOne(userId);

%>	

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


%>
</body>
</html>