<%@page import="com.momo.dao.DeptDAO3"%>
<%@page import="com.momo.dto.DeptDTO"%>
<%@page import="com.momo.dao.DeptDAO2"%>
<%@page import="com.momo.dao.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>DeptDAO - 3</h1>
<%
	DeptDAO3 empdao = new DeptDAO3(application);
	empdao.getList();
%>
</body>
</html>