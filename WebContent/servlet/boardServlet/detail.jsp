<%@page import="board.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	  <meta charset='utf-8'>
	  <title>네트워크 상세 게시판</title>
	</head>
	<body>
	<c:import url="/include/topMenu.jsp"/>
	  <h2>자바 네트워크 게시판</h2>
	  <hr>
	<c:choose>
		<c:when test="${board == null}">
			입력된 번호는 존재하지 않습니다.
		</c:when>
		<c:otherwise>
		번호 : <c:out value="${board.no}"/><br>
		글쓴이 : <c:out value="${board.writer}"/><br>
		제목 : <c:out value="${board.title}"/><br>
		내용 : <c:out value="${board.content}"/><br>
		등록일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
		첨부파일 : <br>
		<a href="${pageContext.request.contextPath}/down?path=${file.realPath}&realName=${file.realFileName}&oriName=${file.oriFileName}">다운로드</a>
		<a href="${pageContext.request.contextPath}/down?path=${file.realPath}&realName=${file.realFileName}&draw=y">화면출력</a>
		</c:otherwise>
	</c:choose>
	
	
	<hr>
	<a href='updateForm?no=<c:out value='${board.no}'/>'/>수정</a>&nbsp;&nbsp;
	<a href='delete?no=<c:out value='${board.no}'/>'>삭제</a>&nbsp;&nbsp;
	<a href='list'>목록</a>
	<hr>
	<c:if test="${cList!=null}">
		<%@ include file="commitList.jsp" %>
	</c:if>
	<%@ include file="commitForm.jsp" %>
	<c:import url="/include/bottom.jsp"/>
	</body>
	</html>
		





	