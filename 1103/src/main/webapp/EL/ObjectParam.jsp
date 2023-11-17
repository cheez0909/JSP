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

<h2>객체 매개변수 설정</h2>
<%
	request.setAttribute("daniObj", new Person("dani", 30));
	request.setAttribute("str", "༼ つ ◕_◕ ༽つ༼ つ ◕_◕ ༽つ");
	request.setAttribute("integer", new Integer(99));
%>
<jsp:forward page="ObjectResult.jsp"></jsp:forward>
</body>
</html>