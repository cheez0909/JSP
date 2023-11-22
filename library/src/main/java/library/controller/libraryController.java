package library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.libraryDAO;

@WebServlet("/library")
public class libraryController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		libraryDAO dao = new libraryDAO();
		
		request.setAttribute("list", dao.getList());
		
		dao.close();
		
		request.getRequestDispatcher("/lib/bookList.jsp").forward(request, response);
	}

	
	// 로그인 할 때
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
	
	
	}
}
