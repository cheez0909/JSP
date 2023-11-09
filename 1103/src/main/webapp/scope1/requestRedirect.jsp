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
<%
	String title = "널값입니다.";
	Person self = new Person();
	if(request.getAttribute("title")!=null){
		title = request.getAttribute("title").toString();
	} 

	if(request.getAttribute("self")!=null){
		self = (Person) request.getAttribute("self");
	} 
%>

<%=title %><br>
<%=self %><br>
<%=request.getParameter("isRedirect") %><br>
<%=session.getAttribute("session_str") %><br>
<% session.removeAttribute("session_str"); %>
<%= session.getAttribute("session_str") %>
</body>
</html>