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
		String id = request.getParameter("ids");
		BoardDAO dao = new BoardDAO();
		System.out.println(num+" "+id);
		
		List<BoardDTO> dto = dao.getList(id);
		
		
		if(dto!=null) {
			for(BoardDTO dtos : dto) {
				BoardDTO boarddto = dtos;
				if(boarddto.getNum().equals(num)) {
					request.setAttribute("boarddto", dtos);
				} else {
					System.out.println("게시물을 찾을 수 없습니다");
				}
			}
		} else {
			System.out.println("로그인 사용자를 찾을 수 없습니다");
		}
		request.getRequestDispatcher("Boarddetails.jsp").forward(request, response);
	}
}