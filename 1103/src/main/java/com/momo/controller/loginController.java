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
 * Servlet implementation class loginController
 */
@WebServlet("/session/ServletEX/loginProcess")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       /*
        * Controller의 역할
        * 	- 파라미터 수접
        * 	- 페이지 전환(jsp로 요청을 위임)
        * 
        * 사용자의 로그인 요청을 처리
        * 1. 파라미터 수집(id, pw)
        * 2. db로부터 해당 사용자가 있는지 확인
        * 	2-1. 사용자가 존재하면 로그인 처리(세션에 사용자정보를 저장)
        * 	2-2. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메세지를 출력
        * 
        */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = new memberDAO();
		memberDTO dto  = dao.login(request.getParameter("id"), request.getParameter("pw"));
		if(dto!=null) {
			request.getSession().setAttribute("dto", dto);
			
			// 게시글 조회 후 request에 담아준다
			BoardDAO boarddao = new BoardDAO();
			List<BoardDTO> boarddto = boarddao.getList(request.getParameter("id"));
			request.setAttribute("boarddto", boarddto);
			
			// sendRedirect를 이용할 경우, request영역이 공유가 되지 않기 때문에
			// list값을 화면으로 전달할 수 없다.
			request.getRequestDispatcher("Board.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("loginForm.jsp?err=1").forward(request, response);
		}
		
	}

}
