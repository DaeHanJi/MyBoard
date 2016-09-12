<%@page import="board.JoinVO"%>
<%@page import="java.util.List"%>
<%@page import="board.JoinDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		JoinDAO dao = new JoinDAO();
		List<JoinVO> list =dao.selectJoin();
%>
		 <html> 
		 <head> 
		 <meta charset=UTF-8> 
		 <title>회원가입</title> 
		 </head> 
		 <body> 
		  <table align = 'center' border='1' width = '700px'><tr><th> 
		  <table border='1' width = '700px'> 
		  <tr> 
		  <th width = '20px'></th><th>ID</th><th>이름</th><th>이메일</th><th width = '50px'></th> 
		  </tr> 
		  <form action='joinDelServlet.jsp' method='post'>
		  <% 
		 for(int i = 0 ;i<list.size();i++){
			%>  <tr><th> 
			 <input type='checkbox' name ='idCheck' value='<%= list.get(i).getUserId()%>' /> 
			  </th>
			 <th><%= list.get(i).getUserId()+"</th><th>"+list.get(i).getUserName()%></th>
			 <th><%= list.get(i).getEmailId()+"@"+list.get(i).getCodeName()+list.get(i).getConfirm()%></th>
			 <th><a href='joinDelServlet.jsp?idCheck=<%= list.get(i).getUserId()%>'  >탈퇴</a></th> 
			  </tr>
			  <% }  %>
		  </table></th></tr> 
		  <tr><th align='right'> 
		  <form action='joinFormServlet.jsp' method='get'><input type='button' value='가입' onclick="location.href='joinFormServlet.jsp'" />
		  <input type='submit' value='선택탈퇴' />&nbsp;&nbsp;</form>
		 </form>
		  </th></tr></table> 
		 </body> 
		 </html> 
