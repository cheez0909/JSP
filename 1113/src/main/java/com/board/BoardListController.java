package com.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// BoardList 조회
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> dto = dao.getList();
		

		// 리스트를 리퀘스트 영역에 담아줌
		request.setAttribute("List", dto);
		
		// 자원 반납
		dao.close();
		
		request.getRequestDispatcher("/Board/BoardList.jsp").forward(request, response);
	}
}
