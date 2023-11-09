<%@page import="com.momo.dto.myDTO"%>
<%@page import="com.momo.dao.myDAO_ex"%>
<%@page import="com.momo.dto.employeeDTO"%>
<%@page import="com.momo.dao.employeeDAO"%>
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

<h1>DeptDAO - 1</h1>
<%
	myDAO_ex emp = new myDAO_ex();
	List<myDTO> dao = emp.getList();
	for(myDTO num : dao){
		out.print(num.getDEPT_TITLE());
	}
	%>
</body>
</html>