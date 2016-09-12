package board.controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.JoinDAO;
import board.JoinVO;

@WebServlet("/servlet/login/loginCheck")
public class LoginCheck extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userPassword = req.getParameter("userPassword");
		JoinDAO jdao = new JoinDAO();
		JoinVO jvo = jdao.selectJoinOne(userId);
		if(jvo == null){
			resp.sendRedirect("loginForm");
		}else{
			
			if(jvo.getUserPassword().equals(userPassword)){
				HttpSession session = req.getSession();
				session.setAttribute("user", jvo);
				
				resp.sendRedirect("/MyBoard/servlet/boardServlet/index");
			}
		}
	}
}
