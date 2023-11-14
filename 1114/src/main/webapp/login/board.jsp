<%@page import="com.login.dto.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% EmployeeDTO dtos = (EmployeeDTO)request.getAttribute("list2");
	out.print(dtos.getEmail()); %>
</body>
</html>