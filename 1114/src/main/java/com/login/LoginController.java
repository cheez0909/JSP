package com.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.EmployeeDAO;
import com.login.dto.EmployeeDTO;


@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   /*
    * get방식 : queryString을 이용해 데이터를 전달
    * post방식 : body영역을 통해서 데이터 전달
    */

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		EmployeeDAO dao = new EmployeeDAO();
		
		if(dao.Login(id, pw)!=null) {
			request.getSession().setAttribute("Emp_id", dao.Login(id, pw).getEmp_id());
			request.getSession().setAttribute("Emp_pw", dao.Login(id, pw).getEmp_pw());
			request.setAttribute("list", dao.Login(id, pw));
			request.getRequestDispatcher("/login/Welcome.jsp").forward(request, response);
			
			// response.sendRedirect("/경로");
			// post -> post 일때는 호출이 되지만
			// forward는 post방식이 유지됨
			// 이럴때는 redirect를 사용하면 된다.
		} else {
			request.setAttribute("msg", "아이디 비밀번호를 확인해주세요0");
			request.getRequestDispatcher("/login/msgbox.jsp").forward(request, response);
			

			
			// 서블릿의 한글깨짐 처리
//			response.setContentType("text/html; charset=UTF-8");
			
			// 자바스크립트 alert처리
//			response.getWriter().append("<script>");
//			response.getWriter().append("alert('아이디, 비밀번호를 확인해주세요');");
//			response.getWriter().append("history.back();");
//			response.getWriter().append("</script>");
			
			//response.sendRedirect("/login/loginForm.jsp?err=1");
		}
	}
}
