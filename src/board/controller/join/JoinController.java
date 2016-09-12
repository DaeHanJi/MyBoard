package board.controller.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.JoinDAO;
import board.JoinVO;

@WebServlet("/servlet/join/join")
public class JoinController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		JoinDAO dao = new JoinDAO();
		JoinVO join = new JoinVO();
		join.setUserId(req.getParameter("userId"));
		join.setUserPassword(req.getParameter("userPassword"));
		join.setUserName(req.getParameter("userName"));
		join.setEmailId(req.getParameter("emailId"));
		join.setEmailDomId(Integer.parseInt(req.getParameter("emailDomId")));
		
		JoinVO flag = dao.selectJoinOne(join.getUserId());
		if (flag != null) {
			RequestDispatcher rd = req.getRequestDispatcher("joinFail");
			rd.forward(req, resp);
		} else {
			dao.insertJoin(join);
			dao.commitJoin();
			JoinVO joinSub = dao.selectJoinOne(join.getUserId());
			req.setAttribute("flag", flag);
			req.setAttribute("user", joinSub);
			RequestDispatcher rd = req.getRequestDispatcher("/servlet/boardServlet/index");
			rd.forward(req, resp);
		}
	}
}
