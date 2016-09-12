<%@page import="java.util.Map"%>
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
		Map<String, String[]> map = request.getParameterMap();
		String[] idCheck = map.get("idCheck");
 %>
		<html> 
		<head> 
		<meta charset=UTF-8> 
		<meta http-equiv='refresh' content='1; url=joinListServlet.jsp'> 
		<title>회원가입</title> 
		 
		</head> 
		<body> 
		<form action='joinListServlet.jsp' method='get'>
<% 
		boolean flag = true;
		if(idCheck == null){
			response.sendError(505, "삭제 할 내용을 선택을 안했습니다.");
		}else{
			
			int cnt = 0;
			for(int i = 0;i<idCheck.length;i++){
				cnt = dao.deleteJoin(idCheck[i]);
				if(cnt == 0) flag= false;
			}
			if(flag){
				dao.commitJoin();
				out.println( "완료");
			}else{
				dao.rollbackJoin();
				out.println("삭제 실패");
			}
		}
%> 
		<br>
		<a href ='joinListServlet.jsp'>목록</a>
		</body> 
		</html> 
