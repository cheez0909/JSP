package library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import library.dao.libraryDAO;

@WebServlet("/addList")
public class addListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		libraryDAO dao = new libraryDAO();
		request.setAttribute("no", dao.noMax());
		request.getRequestDispatcher("/lib/bookadd.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getParameter("no"));
//		System.out.println(request.getParameter("title"));
//		System.out.println(request.getParameter("rentyn"));
//		System.out.println(request.getParameter("author"));
		libraryDAO dao = new libraryDAO();
		int rs = dao.insert( request.getParameter("title"), 
				request.getParameter("yn"), 
				request.getParameter("author"));
		if(rs!=1) {
			request.getRequestDispatcher("/lib/bookadd.jsp?err=1").forward(request, response);
		}else {
		// 메세지 박스 활용해보기
		response.sendRedirect("/library");
		}
	}
}
