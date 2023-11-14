package com.deptInfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDAO dao = new DeptDAO();
		List<DeptNationalDTO> dto = dao.getDeptNational();
		
		request.setAttribute("DeptNational", dto);
		
	
		dao.close();
		
		request.getRequestDispatcher("/Dept/DeptList.jsp").forward(request, response);
	}
}
