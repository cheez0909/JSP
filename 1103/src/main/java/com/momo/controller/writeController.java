package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;

/**
 * Servlet implementation class writeController
 */
@WebServlet("/write")
public class writeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/session/ServletEX/BoardWrite.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// if(request.getSession().getAttribute("uesrId")!=null) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// String id = request.getSession().getAttribute("uesrId").toString();
		dao.write(title, content);
		dao.close();
		
		request.getRequestDispatcher("/session/ServletEX/Board.jsp").forward(request, response);
			
		// } else {
			
		}
}

