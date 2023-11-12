package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.BoardDAO;
import com.momo.dto.BoardDTO;

/**
 * Servlet implementation class writeController
 */
@WebServlet("/session/ServletEX/write")
public class writeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	
	

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("id");
//		System.out.println(id);
//		request.getRequestDispatcher("BoardWrite.jsp").forward(request, response);
//	}
	
	
	
	/*
	 * 선생님이 하는 방법
	 * 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그인 체크
//		HttpSession session = request.getSession();
//		if(session.getAttribute("userId") == null) {
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print("alert('로그인후 게시글을 작성 할 수 있습니다.')");
//			out.print("</script>");
//			return;
//		}
		
		// 파라메터 수집
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 세션정보 확인
//		String id = session.getAttribute("userId").toString();
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		request.setAttribute("boarddto", dao.getList());
		dao.close();
		
//		dto.setId(id);
		
		request.getRequestDispatcher("/session/ServletEX/Board.jsp").forward(request, response);
		
	}
	
	*/
	
	
	
	
	/*
	 * write메서드를 이용하는 방법
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// System.out.println(request.getSession().getAttribute("userId"));
		
		if(request.getSession().getAttribute("userId")!=null) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = (String) request.getSession().getAttribute("userId");
			dao.write(title, content, id);
			request.setAttribute("boarddto", dao.getList());
			dao.close();
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인후 게시글을 작성 할 수 있습니다.')");
			out.print("</script>");
			request.setAttribute("boarddto", dao.getList());
			dao.close();
			return;
		}
		
		request.getRequestDispatcher("Login.jsp").forward(request, response);
			
		// } else {
			
		}
		
}

