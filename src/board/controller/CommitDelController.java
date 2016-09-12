package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

@WebServlet("/servlet/boardServlet/commitDel")
public class CommitDelController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		int no = Integer.parseInt(req.getParameter("no"));
		int comNo = Integer.parseInt(req.getParameter("comNo"));
		dao.deleteCommit(comNo);
		System.out.println(req.getContextPath());
		resp.sendRedirect("detail?no="+no);
	}
	
}
