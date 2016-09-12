package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDAO;

@WebServlet("/servlet/boardServlet/updateForm")
public class UpdateFormController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		Board b = dao.selectBoardByNo(Integer.parseInt(req.getParameter("no")));
		
		req.setAttribute("board", b);
		
		RequestDispatcher rd= req.getRequestDispatcher("updateForm.jsp");
		rd.forward(req, resp);
	}

}
