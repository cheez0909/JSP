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
<h1>로그인 성공!</h1>
<%= session.getAttribute("user_id") %>

<%
	// 오류 발생하지 않도록 null 처리
	if(session.getAttribute("memberDTO")!=null){
		memberDTO dto = (memberDTO) session.getAttribute("memberDTO");
%>

<%=dto.getName()%>님 환영합니다.

<%} %>

<a href="logout.jsp">로그아웃</a>

</body>
</html>