package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.common.DBConnectionPool;
import com.login.dao.HelloDAO;

/**
 * 만약 url이 중복될 경우, 서버가 실행이 안될수 있다.
 */
@WebServlet("/Hello")
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("str", "만나서 반갑습니다.");
		
		HelloDAO time = new HelloDAO();
		System.out.println(time.getTime());
		request.setAttribute("time", time.getTime());
		
		// 사용자의 요청을 처리 후 화면으로 전환
		request.getRequestDispatcher("").forward(request, response);
	}

}
