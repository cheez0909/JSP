package com.deptInfo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addEmployee")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDAO dao = new DeptDAO();
		dao.addEmployee(request.getParameter("id"), request.getParameter("name"), request.getParameter("no"), request.getParameter("email"),   request.getParameter("number"),request.getParameter("dept_code"), request.getParameter("job_code"), request.getParameter("sal"));
		// System.out.println(request.getParameter("dept_code"));
		
		dao.close();
		
		// request.getRequestDispatcher("/DeptDetail?dept_code="+request.getParameter("dept_code")).forward(request, response);
		response.sendRedirect("/DeptDetail?dept_code="+request.getParameter("dept_code"));
	}
}

