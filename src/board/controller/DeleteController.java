package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

@WebServlet("/servlet/boardServlet/delete")
public class DeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO(); 	
		int delNo = Integer.parseInt(req.getParameter("no"));
		dao.deleteBoard(delNo);	
		
		resp.sendRedirect("list");		
	}
	
}
