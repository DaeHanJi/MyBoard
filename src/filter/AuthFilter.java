package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.JoinVO;

public class AuthFilter implements Filter {
	String[] sArr =null;
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		HttpServletRequest hReq = (HttpServletRequest)request;
		HttpServletResponse hResp = (HttpServletResponse)response;
		
		HttpSession session = hReq.getSession();
		String path = hReq.getServletPath();
//		System.out.println(1);
		boolean flag = false;
		if(session.getAttribute("user")==null){
//			System.out.println("path:"+path);
			for(String var : sArr){
				if(var.equals(path)){
//					System.out.println("var:"+var);
					chain.doFilter(request, response);
					flag = true;
				}
			}
			if(flag==false){
				String proName = hReq.getContextPath();
				hResp.sendRedirect(proName+"/servlet/login/loginForm");
			}
		}else{
			chain.doFilter(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String r = config.getInitParameter("pages");
		sArr = r.split(";");
		for(int i=0 ;i<sArr.length;i++){
			 sArr[i] = sArr[i].trim();
		}
	}
	
}
