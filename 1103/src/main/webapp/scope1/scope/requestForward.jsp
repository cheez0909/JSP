<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>forward 페이지</h2>
<h3>requestMain페이지 forward!!</h3>


<%
	
	Person request_p = new Person();

	if(request.getAttribute("request_person")!=null){
		request_p = (Person) request.getAttribute("request_person");
	} 

	String msg1 = request.getAttribute("request_str")==null ? "널값" : request.getAttribute("request_str").toString();

	String title = request.getParameter("isRedirect") == "1" ? "redirect" : "forward";
	
%>

<%=title %><br>
<%=request_p %><br>
<%=msg1 %>
</body>
</html>