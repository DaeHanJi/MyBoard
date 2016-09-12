<%@page import="board.JoinVO"%>
<%@page import="java.util.List"%>
<%@page import="board.JoinDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		 <html> 
		 <head> 
		 <meta charset='UTF-8'> 
		 <title>회원가입</title> 
		  
		 </head> 
		 <body> 
		 <form action='join' method='get'> 
		 <table border='1' align='center' width='400px'height='200px'> 
		 <tr><td> 
		 <table width='400px' height='200px'> 
		 <tr><th width='20%'>ID</th> 
		 <td>&nbsp;&nbsp;<input type='text' name='userId' size='20' /></td> 
		 </tr><tr><th>PW</th> 
		 <td>&nbsp;&nbsp;<input type='password' name='userPassword' size='20' /></td> 
		 </tr><tr><th>이름</th> 
		 <td>&nbsp;&nbsp;<input type='text' name='userName' size='20' /></td> 
		 </tr><tr><th>이메일</th> 
		 <td>&nbsp;&nbsp;<input type='text' value='daehan.ji' name='emailId' size='10'/>&nbsp;@&nbsp; 
		 <select name='emailDomId'> 
		 <option value='1'>naver.com</option> 
		 <option value='2'>daum.com</option> 
		 <option value='3' selected>gmail.com</option> 
		 </select> 
		 </td></tr><tr> 
		 <td align='right' colspan='2'><input type='submit'value='가입'/>&nbsp;&nbsp;&nbsp;&nbsp;</td> 
		 </tr></table> 
		 </td></tr> 
		 </table> 
		 </form> 
		 </body> 
		 </html>
