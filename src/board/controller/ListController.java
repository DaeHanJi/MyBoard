package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDAO;
import board.CommitVO;

@WebServlet("/servlet/boardServlet/list")
public class ListController extends HttpServlet	{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.selectBoard();
		req.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
		rd.forward(req, resp);

	}

}
