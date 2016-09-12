package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDAO;

@WebServlet("/servlet/boardServlet/update")
public class UpdateController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		BoardDAO dao = new BoardDAO();
		Board b = new Board();
		b.setNo(Integer.parseInt(req.getParameter("no")));
		System.out.println(b.getNo());
		b.setTitle(req.getParameter("title"));
		b.setContent(req.getParameter("content"));
		
		dao.updateBoard(b);
		
		resp.sendRedirect("list");
	}
	
}
