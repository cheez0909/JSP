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
<style>
	table, tr, td {
		border: 1px solid #444444;
	}
</style>
</head>
<body>

<h1>DeptDAO - 2</h1>
<%
	DeptDAO2 empdao = new DeptDAO2(application);
	List<DeptDTO> result = empdao.getList();
	
%>

<table>
	<tr>
		<td>부서ID</td>
		<td>부서이름</td>
		<td>지역이름</td>
	</tr>
	<%
	for(DeptDTO num : result){%>
	<tr>
		<td><% out.print(num.getDEPT_ID()); %></td>
		<td><% out.print(num.getDEPT_TITLE()); %></td>
		<td><% out.print(num.getLocal_name()); %></td>
	</tr>
	<%}%>
	

</table>
</body>
</html>