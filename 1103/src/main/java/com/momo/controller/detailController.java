package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDAO;
import com.momo.dto.BoardDTO;


@WebServlet("/session/ServletEX/detail")
public class detailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		// String id = request.getParameter("ids");
		
		BoardDAO dao = new BoardDAO();
		System.out.println(num+" ");
		
		dao.visitCount(num);
		BoardDTO dto = dao.getOne(num);
		
		
		
		request.setAttribute("boarddto", dto);
		dao.close();
		
		request.getRequestDispatcher("Boarddetails.jsp").forward(request, response);
	}
}
