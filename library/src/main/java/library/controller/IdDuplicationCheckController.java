package library.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.MemberDAO;


@WebServlet("/IdDuplicationCheck")
public class IdDuplicationCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println(request.getParameter("id"));
		MemberDAO dao = new MemberDAO();
		List<String> list = dao.getListId();
		
		if(list.contains(request.getParameter("id"))) {
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			
//			PrintWriter out = response.getWriter();
//			// out.append("중복된 id 입니다!");
//			out.print("<script>");
//			out.print("alert('중복된id입니다')");
//			out.print("history.back()");
//			out.print("</script>");
			System.out.println("true");
			response.sendRedirect("/Join.jsp?err=4");
			
		} else {
			request.getRequestDispatcher("/Join.jsp?ok=1").forward(request, response);
			System.out.println("false");
		}
	}

}
