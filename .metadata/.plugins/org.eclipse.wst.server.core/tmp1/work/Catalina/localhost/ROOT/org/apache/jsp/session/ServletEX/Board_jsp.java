/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.81
 * Generated at: 2023-11-10 08:37:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.session.ServletEX;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.momo.dto.BoardDTO;
import java.util.List;
import com.momo.dto.memberDTO;

public final class Board_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.momo.dto.BoardDTO");
    _jspx_imports_classes.add("com.momo.dto.memberDTO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>게시판</title>\r\n");
      out.write("<link href=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("   .well{\r\n");
      out.write("   \r\n");
      out.write("   margin-left:100px;\r\n");
      out.write("   margin-right:100px;}\r\n");
      out.write("   \r\n");
      out.write("    </style>\r\n");
      out.write("    <script src=\"http://code.jquery.com/jquery-1.11.1.min.js\"></script>\r\n");
      out.write("    <script src=\"http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-1.11.1.min.js\"></script>\r\n");
      out.write("    <script src=\"http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("window.onload = function() {\r\n");
      out.write("	\r\n");
      out.write("	let logoutBtn = document.querySelector(\"#logout_button\");\r\n");
      out.write("	\r\n");
      out.write("	if(logoutBtn!=null){\r\n");
      out.write("		logoutBtn.onclick = function(){\r\n");
      out.write("			alert(\"로그아웃합니다.\");\r\n");
      out.write("			LoginForm.action = \"/LogoutController\";\r\n");
      out.write("			LoginForm.submit();\r\n");
      out.write("		};\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	let loginBtn = document.querySelector(\"#login_button\");\r\n");
      out.write("	\r\n");
      out.write("	if(loginBtn!=null){\r\n");
      out.write("	loginBtn.addEventListener('click', function(){\r\n");
      out.write("		alert(\"로그인합니다\")\r\n");
      out.write("		// 경로 확인,,, 뒤돌아왔을때 안될수도 있음\r\n");
      out.write("		//LoginForm.action = \"Login.jsp\";\r\n");
      out.write("		LoginForm.action=\"/session/ServletEX/Login.jsp\";\r\n");
      out.write("		LoginForm.submit();\r\n");
      out.write("	});\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	let deletebtn = document.querySelector(\"#delete\");\r\n");
      out.write("	\r\n");
      out.write("	if(deletebtn!=null){\r\n");
      out.write("	deletebtn.addEventListener('click', function(){\r\n");
      out.write("		if(confirm(\"정말로 삭제하시겠습니까?\")){\r\n");
      out.write("			deletebtn.action=\"/delete\";\r\n");
      out.write("			deletebtn.submit();\r\n");
      out.write("		};\r\n");
      out.write("	});\r\n");
      out.write("	}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<!-- 로그인 / 로그아웃 링크 보여주기\r\n");
      out.write("	세션에 user_id가 null이 아니라면 로그아웃 버튼\r\n");
      out.write("	null이면 로그인\r\n");
      out.write(" -->\r\n");
      out.write("	\r\n");
      out.write("<form name=\"LoginForm\">\r\n");
      out.write("<div class=\"navbar\" style=\"user-select: auto;\">\r\n");
      out.write("    <div class=\"navbar-inner\" style=\"user-select: auto;\">\r\n");
      out.write("      <div class=\"container\" style=\"width: auto; user-select: auto;\">\r\n");
      out.write("        <a class=\"brand\" href=\"Login.jsp\" style=\"user-select: auto;\">Board</a>\r\n");
      out.write("         ");

	memberDTO dto = (memberDTO) session.getAttribute("dto");
	if(dto!=null){ 
      out.write("\r\n");
      out.write("		");
      out.print(dto.getName() );
      out.write(" 님 환영합니다\r\n");
      out.write("		<button type=\"button\" class=\"btn btn-dark\" id=\"logout_button\" style=\"user-select: auto;\">로그아웃 하기</button>\r\n");
      out.write("	");
} else {
      out.write("\r\n");
      out.write("		<button type=\"button\" class=\"btn btn-dark\" id=\"login_button\" style=\"user-select: auto;\">로그인 하기</button>\r\n");
      out.write("	");
} 
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("    </div><!-- /navbar-inner -->\r\n");
      out.write("  </div>\r\n");
      out.write("</form>	\r\n");
      out.write("\r\n");
      out.write("<form>\r\n");
      out.write("<div class=\"well\">\r\n");
      out.write("	<div class=\"header\">\r\n");
      out.write("		<H2>게시물 조회</H2>\r\n");
      out.write("		<a class='btn btn-info btn-xs' href=\"/write\" id=\"writebtn\"><span class=\"glyphicon glyphicon-edit\"></span>작성하기</a>\r\n");
      out.write("	</div>\r\n");
      out.write("    <table class=\"table\">\r\n");
      out.write("    	\r\n");
      out.write("      <thead>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <th>일련번호</th>\r\n");
      out.write("            <th>제목</th>\r\n");
      out.write("            <th>작성자</th>\r\n");
      out.write("            <th>작성일</th>\r\n");
      out.write("			<th>조회수</th>\r\n");
      out.write("            <th class=\"text-center\">Action</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </thead>\r\n");
      out.write("       ");

	if(request.getAttribute("boarddto")!=null){
		List<BoardDTO> dtos = ( List<BoardDTO> ) request.getAttribute("boarddto");
		for(BoardDTO num : dtos){
      out.write("\r\n");
      out.write("    	<tr>\r\n");
      out.write("                <td>");
      out.print(num.getNum() );
      out.write("</td>\r\n");
      out.write("                <td><a href=\"/session/ServletEX/detail?num=");
      out.print(num.getNum());
      out.write('"');
      out.write('>');
      out.print(num.getTitle() );
      out.write("</a></td>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <td>");
      out.print(num.getId() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print(num.getPostdate() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print(num.getVisitcount() );
      out.write("</td>\r\n");
      out.write("                <td class=\"text-center\">\r\n");
      out.write("                <a class='btn btn-info btn-xs' href=\"#\"><span class=\"glyphicon glyphicon-edit\"></span> Edit</a> \r\n");
      out.write("                <a class='btn btn-danger btn-xs' id=\"delete\"><span class=\"glyphicon glyphicon-edit\"></span>Del</button>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("           ");
} 
}
      out.write("\r\n");
      out.write("	</table>\r\n");
      out.write("</div>\r\n");
      out.write("</form>\r\n");
      out.write("<script type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
