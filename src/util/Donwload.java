/*
 * 	모든 페이지에서 사용할 수 있도록 공통 컴포넌트로 생성
 */

package util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/down")
public class Donwload extends HttpServlet {

	// 다운로드 하기 위한 기본 파라미터
	// path : 파일이 실제 서버에 저장된 경로
	// realName : 저장된 실제 파일명
	// oriName : 사용자가 선택한 원본 파일명
	// draw : Y(화면에 출력) N(다운로드)
	// 1. 다운로드 경우
	// http://localhost:8000/ServletJspp/down?paht=/2016/08/11
	// & reaName=32156487.jsp & oriName=설현.jsp
	// 2. 화면에 출력 
	// http://localhost:8000/ServletJspp/down?paht=/2016/08/11
	// & reaName=설현1.jsp & draw=Y
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getParameter("path");
		String oriName = req.getParameter("oriName");
		String realName = req.getParameter("realName");
		//draw의 값이 null 이거나 Y가 아닌 경우는 다운로드
		String draw = req.getParameter("draw");
		System.out.println(path);
		System.out.println(oriName);
		System.out.println(realName);
		System.out.println(draw);
		// 서버에서 지정한 실제 저장되는 루트 경로 얻기
		ServletContext context = req.getServletContext();
		// 컨텍스트의 실 하드 디스크의 경로 읽기
		String uploadPath = context.getRealPath("/upload");
//		String uploadPath = "c:/upload";
//		 upload : E:\java\tomcat-work\wtpwebapps\ServletJspp\jsp/upload
		// path : 2016\08\11
		// realName : 설현1.jpg
		
		// 파일을 읽기 위해서 File 객체 생성한다.
		File f = new File(uploadPath +"/"+ path + realName);
		
		// 응답헤더의 조작을 통해서 처리함...
		// 화면 출력(이미지) 또는 다운로드 인지 처리
		//&& draw.equalsIgnoreCase("y")
		if(draw != null && draw.equalsIgnoreCase("y")){
			// 화면출력 처리
			resp.setHeader("Content-Type", "image/jpg");
		}else{
			// 다운로드
			resp.setHeader("Content-Type", "application/octet-stream");
			// 다운로드 이름 설정
			String downName = new String(oriName.getBytes("UTF-8"),"8859_1");
			System.out.println(downName);
			resp.setHeader("Content-Disposition", "attachment;filename="+downName);
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Content-Length", String.valueOf(f.length()));
		}
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = resp.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true){
			int ch = bis.read();
			if (ch == -1) break;
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
}
