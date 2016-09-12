<%@page import="java.util.List"%>
<%@page import="board.JoinVO"%>
<%@page import="board.JoinDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		<html> 
		<head> 
		<meta charset=UTF-8> 
		<title>회원가입</title> 
		 
		</head> 
		<body> 
		 <table><tr><th>
		 	<form action='/MyBoard/servlet/email/sendMail.jsp'>
		 	
			<input type= 'hidden' name='userId' value='${joinSub.getUserId()}'/>
			<input type= 'hidden' name='emailDomId' value='${joinSub.getCodeName()}'/>
			<input type='hidden' name='emailId' value='${joinSub.getEmailId()}'/>
			
			<input type='submit' value='인증메일전송' />
			
			</form>
		
		
		<br>
		 </th></tr></table> 
		<a href ='joinListServlet.jsp'>목록</a>
		</body> 
		</html> 
