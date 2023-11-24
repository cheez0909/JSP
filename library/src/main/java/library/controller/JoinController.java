package library.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import library.dao.MemberDAO;


@WebServlet("/Join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.append("post방식으로 요청해주세요!");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("email"));
		

		
		if(request.getParameter("pw").equals(request.getParameter("re_pw"))) {
			int rs = dao.join(request.getParameter("id"), request.getParameter("pw"), request.getParameter("name"), request.getParameter("email"));
			if(rs!=1) {
		
				request.getRequestDispatcher("Join.jsp?err=1").forward(request, response);
			} else {

				response.sendRedirect("Join.jsp?err=3");
			}
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호를 확인해주세요');");
			out.print("history.back();");
			out.print("</script>");
			// request.getRequestDispatcher("Join.jsp?err=2").forward(request, response);
		}
		
		dao.close();
	}

}
