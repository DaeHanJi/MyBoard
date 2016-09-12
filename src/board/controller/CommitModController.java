package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.CommitVO;

@WebServlet("/servlet/boardServlet/commitMod")
public class CommitModController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		CommitVO cvo = new CommitVO();
		int comNo = Integer.parseInt(req.getParameter("comNo"));
		int no = Integer.parseInt(req.getParameter("no"));
		String comContent = req.getParameter("comContent");
		String modFlag = req.getParameter("modFlag");
		if(modFlag.equals("y")){
			cvo.setComNo(comNo);
			cvo.setNo(no);
			cvo.setComContent(comContent);
			System.out.println("comNo:"+cvo.getComNo());
			System.out.println("no:"+cvo.getNo());
			System.out.println("comContent"+cvo.getComContent());
			
			dao.updateCommit(cvo);
			
		}
		req.setAttribute("modFlag", modFlag);
		req.setAttribute("comNo", comNo);
		req.setAttribute("no", no);
		req.setAttribute("comContent", comContent);
		RequestDispatcher rd = req.getRequestDispatcher("detail");
		rd.forward(req, resp);
	}

	
	
}
