package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;
import com.momo.dao.memberDAO;
import com.momo.dto.BoardDTO;
import com.momo.dto.memberDTO;

/**
 * Servlet implementation class loginControllerEX
 */
@WebServlet("/session/ServletEX/login")
public class loginControllerEX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = new memberDAO();
		memberDTO dto  = dao.login(request.getParameter("id"), request.getParameter("pw"));
		if(dto!=null) {
			request.getSession().setAttribute("dto", dto);
			;
			
			// 게시글 조회 후 request에 담아준다
			BoardDAO boarddao = new BoardDAO();
			List<BoardDTO> boarddto = boarddao.getList(request.getParameter("id"));
			request.setAttribute("boarddto", boarddto);
						
			// sendRedirect를 이용할 경우, request영역이 공유가 되지 않기 때문에
			// list값을 화면으로 전달할 수 없다.
			request.getRequestDispatcher("Board.jsp").forward(request, response);
					
		} else {
			request.getRequestDispatcher("Login.jsp?err=1").forward(request, response);
		}
	}

}
