package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.group.Response;

import com.momo.dao.myDAO;
import com.momo.dto.myDTO;

/**
 * Servlet implementation class myController1
 */

/*
 * 사용자가 /JDBC/myList 를 요청하면
 * 해당 서블릿이 실행됨
 * 
 * 요청 전달된 메서드에 의해 실행될 메서드가 결정된다.
 * - 사용자가 지정하지 않은 경우 get방식
 * - 링크를 클릭 했을 때, 주소창에서 직접 입력 했을 때
 * 
 * get 방식 요청에 대해서는 doGet메서드가 실행되고
 * post 방식 요청에 대해서는 doPost메서드가 실행된다.
 * 해당 요청방식이 구현되어 있지 않은 경우, 오류가 발생한다.
 * 
 * @WebServlet("경로") -> 실행할 jsp 파일이 있는 "경로/설정할 이름"
 * 
 * 서블릿이 아닌 java파일을 실행할 경우, 404 오류가 납니다!!
 * 
 */
@WebServlet("/JDBC/myList")
public class myController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//public myController1() {
    //    super();
    //}
    
    /*
     * 1. db로부터 내가 설정한 목록을 조회
     * 2. 내가 설정한 목록을 요청에 셋함
     * 
     * DAO(데이터 액세스 객체 Data Access Object)
     * 데이터베이스와의 상호작용을 관리하고 데이터베이스에서 데이터를 읽고 쓰는 데 사용
     * 
     * 주소표시줄, 링크 -> get방식 -> doGet() 메서드 호출
     * 
     * Controller
     * - 사용자의 요청 정보를 수집
     * - 비즈니스 로직(전처리, 후처리)
     * - 페이지 전환
     * 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 커넥션풀을 이용하면 어플리케이션 이용X
		// myDAO mine = new myDAO(request.getServletContext());
		myDAO mine = new myDAO();
		List<myDTO> list = mine.getList();
		System.out.println("=================request");
		System.out.println(list);
		
		// 포워드는 리퀘스트 영역이 공유가 됨
		request.setAttribute("list", list);
		request.getRequestDispatcher("myList.jsp")
		.forward(request, response);
	}

}
