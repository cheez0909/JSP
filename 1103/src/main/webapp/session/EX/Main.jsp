<%@page import="com.momo.dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= session.getAttribute("user_id") %>

<%
	if(session.getAttribute("memberDTO")!=null){
		memberDTO dto = (memberDTO) session.getAttribute("memberDTO");
		out.print(dto.getName());
	} else{
		out.print("널값입니다");
	}%>
</body>
</html>