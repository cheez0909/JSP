package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;
import com.momo.dto.Criteria;


@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * 
	 * 리스트 조회 후 반환
	 * 
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		// 리스트 호출 후 리퀘스트에 담기
		request.setAttribute("list", dao.getList(new Criteria()));
		
		
		request.getRequestDispatcher("/JSTL/core/list.jsp").forward(request, response);
	}
}
