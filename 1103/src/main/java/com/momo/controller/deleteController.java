package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;

/**
 * Servlet implementation class deleteController
 */
@WebServlet("/deleteprocess")
public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num").toString();
		
		BoardDAO dao = new BoardDAO();
		int res = dao.deleteBoard(num);
		System.out.println("안녕");
		System.out.println(res);
		if(res == 1) {
			// 삭제 성공
			response.setContentType("text/html; charset=UTF-8");
			request.setAttribute("msg", "삭제되었습니다.");
		} else {
			// 삭제 실패
			// response.setContentType("text/html; charset=UTF-8");
			request.setAttribute("url", "/boardList");
		}
		// 메세지 출력 화면으로 이동
		// response.setContentType("text/html; charset=UTF-8");
		request.getRequestDispatcher("/session/ServletEX/msgbox.jsp").forward(request, response);
	}
}
