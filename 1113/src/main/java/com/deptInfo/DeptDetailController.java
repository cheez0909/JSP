package com.deptInfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeptDetail")
public class DeptDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDAO dao = new DeptDAO();
		List<EmployeeDTO> dto = dao.getDeptDetail(request.getParameter("dept_code"));
		
		request.setAttribute("details", dto);
		dao.close();
		
		request.getRequestDispatcher("/Dept/Detail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDAO dao = new DeptDAO();
		List<EmployeeDTO> dto = dao.getDeptDetail(request.getParameter("dept_code"));
		
		request.setAttribute("details", dto);
		dao.close();
		
		request.getRequestDispatcher("/Dept/Detail.jsp").forward(request, response);
	}
}

