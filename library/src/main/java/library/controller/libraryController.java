package library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.libraryDAO;
import library.dto.Criteria;
import library.dto.pageDTO;

@WebServlet("/library")
public class libraryController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		libraryDAO dao = new libraryDAO();
		Criteria cri = new Criteria(request.getParameter("pageNo"), 
				request.getParameter("amount"), 
				request.getParameter("searchField"),
				request.getParameter("searchWord"));
		
		System.out.println(request.getParameter("searchField"));
		System.out.println(request.getParameter("searchWord"));
		
		// 페이지로 리스트 조회하기
		request.setAttribute("list", dao.getList(cri));
		
		// 페이지 블럭 만들기
		int totalCnt = dao.getTotalCnt(cri);
		System.out.println(totalCnt);
		pageDTO dto = new pageDTO(totalCnt, cri);
		System.out.println(dto.getCritera());
		request.setAttribute("page", dto);
		
		dao.close();
		
		request.getRequestDispatcher("/lib/bookList.jsp").forward(request, response);
	}

	
	// 로그인 할 때
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
	
	
	}
}
