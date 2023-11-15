package com.momo.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;
import com.momo.dto.Criteria;

/**
 * Servlet implementation class boardListController
 */
@WebServlet("/boardList")
public class boardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 리스트 조회 후 리퀘스트 영역에 저장
		BoardDAO dao = new BoardDAO();
		
		// 리스트 조회하기 위한 파라미터 수집
		Criteria page = new Criteria(request.getParameter("pageNo"), request.getParameter("amount"));
				
		
		request.setAttribute("boarddto", dao.getList(page));

		// 페이지 블럭을 생성하기 위해 필요한 정보를 저장
		request.setAttribute("page", page);
		
		request.setAttribute("totalCnt", dao.getTotalCnt());
		
				
				
		// 페이지 전환 forward방식으로 전환하므로 request영역이 공유됨
		request.getRequestDispatcher("/session/ServletEX/Board.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리스트 조회 후 리퀘스트 영역에 저장
		BoardDAO dao = new BoardDAO();
		
		// 리스트 조회하기 위한 파라미터 수집
		Criteria page = new Criteria(request.getParameter("pageNo"), request.getParameter("amount"));
						
		request.setAttribute("boarddto", dao.getList(page));
		
		// 페이지 블럭을 생성하기 위해 필요한 정보를 저장
		request.setAttribute("page", page);
				
		request.setAttribute("totalCnt", dao.getTotalCnt());
		// System.out.println(dao.getTotalCnt());
		
		
		// 페이지 전환 forward방식으로 전환하므로 request영역이 공유됨
		request.getRequestDispatcher("/session/ServletEX/Board.jsp").forward(request, response);
	}
}
