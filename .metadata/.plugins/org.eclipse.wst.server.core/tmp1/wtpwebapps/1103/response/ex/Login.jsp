<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String saves = "";
	String[] save = request.getParameterValues("save");

	if(save!=null){
		for(String save1 : save){
			saves += save1 + " ";
		}
	}
	
	if("dani".equals(id) && "1234".equals(pwd)){
		response.sendRedirect("LoginOK.jsp?id="+id+"&saves="+saves);
	} else if("dani".equals(id) || "1234".equals(pwd)){
		request.getRequestDispatcher("Main.jsp?err=1&saves="+saves)
		.forward(request, response);
	} else {
		request.getRequestDispatcher("Main.jsp?err=2&saves="+saves)
		.forward(request, response);
	}
	
%>

</body>
</html>