package library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.libraryDAO;
import library.dto.libraryDTO;


@WebServlet("/detail")

public class detailController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		libraryDAO dao = new libraryDAO();
		
		libraryDTO dto = dao.getList(Integer.parseInt(request.getParameter("No")));
		request.setAttribute("dto", dto);
		dao.close();
		request.getRequestDispatcher("/lib/bookdetail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
