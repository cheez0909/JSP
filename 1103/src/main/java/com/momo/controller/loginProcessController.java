package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.memberDAO;
import com.momo.dto.memberDTO;

/**
 * Servlet implementation class loginProcessController
 */
@WebServlet("/session/EX/LoginProcess")
public class loginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 파라미터 수집
		memberDAO dao = new memberDAO();
		memberDTO dto = dao.login(request.getParameter("user_id"), request.getParameter("user_pw"));
		
		
		
		if(dto!=null) {
			// 3. session영역에 memberDTO 저장, 세션의 만료기간이 남아 있고 웹브라우저를 닫을때까지 세션 정보가 서버에 유지
			request.getSession().setAttribute("memberDTO", dto);
			request.getSession().setAttribute("user_id", dto.id);
			
			// 4. 페이지 전환
			response.sendRedirect("Main.jsp");
		} else {
			// 로그인 실패
			// 4. 페이지 전환
			request.getRequestDispatcher("loginForm.jsp?err=1").forward(request, response);
		}
		
	}
}
