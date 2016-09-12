<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<html>
	<head>
	  <meta charset='utf-8'>
	  <title>게시판 수정 폼</title>
	</head>
	<body>
	<c:import url="/include/topMenu.jsp"/>
	<form action='update' method = 'post'>
	  <hr>
	  <h2>자바 네트워크 게시판</h2>
	  <hr>
	  <input type='hidden' name='no' value='<c:out value='${board.no}'/>'/><br>
	  제   목 : <input type='text' name='title' size='50' value='<c:out value='${board.title}'/>'/><br>
	  글쓴이 : <input type='text' readonly name='write' size='25' value='<c:out value='${board.writer}'/>'/><br>
	  내   용 : <textarea name='content' cols='70' rows='10' ><c:out value='${board.content}'/></textarea><br>
	<input type = 'submit' value='수정' /><br>
	</form>
	<c:import url="/include/bottom.jsp"/>
	</body>
	</html>