package library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.libraryDAO;


@WebServlet("/Modify")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("yn"));
		System.out.println(request.getParameter("author"));
		System.out.println(request.getParameter("no"));
		libraryDAO dao = new libraryDAO();
		int rs = dao.modify(request.getParameter("title"), request.getParameter("yn"), request.getParameter("author"), request.getParameter("no"));
		dao.close();
		if(rs!=1) {
			request.getRequestDispatcher("/lib/ModifyBook.jsp?err=1").forward(request, response);
		}else {
			response.sendRedirect("/library?pageNo="+request.getParameter("pageNo"));
		}
	}
}
