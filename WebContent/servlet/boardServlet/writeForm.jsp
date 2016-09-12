<%@page import="board.Board"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset='utf-8'>
  <title>게시판 등록 폼</title>
</head>
<body>
<c:import url="/include/topMenu.jsp"/>
<form action='write' method = 'post' enctype="multipart/form-data">
  <hr>
  <h2>자바 네트워크 게시판</h2>
  <hr>
  제   목 : <input type='text' name='title' size='50'  /><br>
  글쓴이 : <input type='text' name='writer' size='25' /><br>
  내   용 : <textarea name='content' cols='70' rows='10'  ></textarea><br>
<input type='file' name='attachFile' value='파일업로드'/><br>
	  
<input type = 'submit' value='등록'  /><br>
</form>
	<c:import url="/include/bottom.jsp"/>
</body>
</html>
