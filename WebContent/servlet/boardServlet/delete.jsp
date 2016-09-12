<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	  <meta charset='utf-8'>
	  <meta http-equiv='refresh' content="1; url='listServlet.jsp'">
	  <title>게시판 삭제</title>
	</head>
	<body>
	<c:import url="/include/topMenu.jsp"/>
	  <h2>네트워크 게시판</h2>
	  <h3>
	<c:if test="${cnt==0}">
		입력하신 번호에 해당하는 게시글이 없습니다.
	</c:if>
	<c:if test="${cnt==1}">
		게시글이 삭제되었습니다.
	</c:if>
	  </h3>
	  <br>
	  <hr>
	  <a href='listServlet.jsp'>목록</a>
	<c:import url="/include/bottom.jsp"/>
	</body>
	</html>




