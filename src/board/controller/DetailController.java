package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.Board;
import board.BoardDAO;
import board.CommitVO;
import board.FileVO;
import board.JoinVO;

@WebServlet("/servlet/boardServlet/detail")
public class DetailController extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		int selNo = Integer.parseInt(req.getParameter("no"));
		Board b = dao.selectBoardByNo(selNo);
		FileVO fvo = dao.selectFile(selNo);
		List<CommitVO> cList = dao.selectCommit(selNo);
		req.setAttribute("cList", cList);
		req.setAttribute("board", b);
		req.setAttribute("file", fvo);
		
		int comNo = Integer.parseInt(req.getParameter("comNo"));
		req.setAttribute("comNo", comNo);

		RequestDispatcher rd = req.getRequestDispatcher("detail.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		int selNo = Integer.parseInt(req.getParameter("no"));
		Board b = dao.selectBoardByNo(selNo);
		FileVO fvo = dao.selectFile(selNo);
		List<CommitVO> cList = dao.selectCommit(selNo);
		req.setAttribute("cList", cList);
		req.setAttribute("board", b);
		req.setAttribute("file", fvo);
		
//		if(req.getParameter("comNo")!=null){
//			int comNo = Integer.parseInt(req.getParameter("comNo"));
//			req.setAttribute("comNo", comNo);
//		}
		RequestDispatcher rd = req.getRequestDispatcher("detail.jsp");
		rd.forward(req, resp);
	}
	
	
	
}
