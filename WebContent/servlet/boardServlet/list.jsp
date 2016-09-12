<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta charset='UTF-8'>
		<title>네트워크 게시판</title>
	</head>
	<body>
	<c:import url="/include/topMenu.jsp"/>
	  <h2>네트워크 게시판</h2>
	전체 <c:out value="${fn:length(list)}"/>
	개
	<hr>
	 <table width='80%' border='1'>
	 <tr>
	   <th>번호</th><th>글쓴이</th><th>제목</th><th>등록일</th>
	 </tr>
	<c:if test="${list!=null}">
	<c:forEach var="board" items="${list}">
		<tr>
		<td><c:out value="${board.no}"/></td>
		<td><c:out value="${board.writer}"/></td>
		<td><a href = detail?no=<c:out value='${board.no}'/>><c:out value='${board.title}'/></a></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
		</tr>
	</c:forEach>
	</c:if>
	<c:if test="${list==null}">
			<tr>
			  <th colspan = '4'>게시물이 존재하지 않습니다.</th>
			</tr>
	</c:if>
		  </table>
		  <a href='writeForm'>글쓰기</a>
		<c:import url="/include/bottom.jsp"/>
		</body>
		</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	