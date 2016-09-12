package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.CommitVO;
import board.JoinVO;
@WebServlet("/servlet/boardServlet/commit")
public class CommitController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		HttpSession session = req.getSession();
		JoinVO jvo = (JoinVO)session.getAttribute("user");
		CommitVO cvo = new CommitVO();
		cvo.setComContent(req.getParameter("comContent"));
		cvo.setComWriter(jvo.getUserId());
		cvo.setNo(Integer.parseInt(req.getParameter("no")));
		dao.insertCommit(cvo);
		int selNo = Integer.parseInt(req.getParameter("no"));
		resp.sendRedirect("detail?no="+selNo);
	}
}
