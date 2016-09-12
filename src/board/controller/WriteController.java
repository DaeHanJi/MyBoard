package board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import board.FileVO;
import util.BitFileRenamePolicy;
import util.Thumbanail;

@WebServlet("/servlet/boardServlet/write")
public class WriteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		BoardDAO dao = new BoardDAO();
		Board b = new Board();
		
		ServletContext context = req.getServletContext();
		String realPath = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH/mm/");
		String path = sdf.format(new Date());
		realPath += path;
		
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		System.out.println(realPath);
		
		MultipartRequest mReq = new MultipartRequest(
				req,
				realPath,
				1024*1024*100,
				"UTF-8",
				new BitFileRenamePolicy()
				);
		
		b.setWriter(mReq.getParameter("writer"));
		b.setTitle(mReq.getParameter("title"));
		b.setContent(mReq.getParameter("content"));
//		System.out.println(b.getWriter());
//		System.out.println(b.getTitle());
//		System.out.println(b.getContent());
		
		
		int no = dao.insertBoard(b);
		
//		System.out.println("파일 저장 성공");
//		System.out.println("realPath : "+realPath);
		
		File file = mReq.getFile("attachFile");
		// 사용자가 선택한 파일이 있는지 체크
		if (file != null) {
			// 사용자가 선택한 파일명
			String oriFileName = mReq.getOriginalFileName("attachFile");
			
			// 실제 서버에 저장된 파일명
			String realFileName = mReq.getFilesystemName("attachFile");
			
			// 파일의 사이즈
			long size = file.length();
			
			FileVO fvo = new FileVO();
			fvo.setOriFileName(oriFileName);
			fvo.setFileSize(size);
			fvo.setRealPath(realPath);
			fvo.setRealPath(path);
			fvo.setNo(no);
//			System.out.println("oriFileName : " +oriFileName );
//			System.out.println("realFileName : " +realFileName );
//			System.out.println("size : " +size );
//			System.out.println("realPath : " +path );
//			System.out.println("no : " +no );
			
			Thumbanail thum = new Thumbanail();
			String thumName = thum.thum(realPath, realFileName);
			fvo.setRealFileName(thumName);
			
			dao.insertFile(fvo);
			
		}
		
		resp.sendRedirect("list");
	}
}
