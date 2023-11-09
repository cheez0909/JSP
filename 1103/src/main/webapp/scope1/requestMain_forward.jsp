<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s</title>
</head>
<body>
<%
	// 두개의 속성을 저장하였다.
	request.setAttribute("title", "메인 페이지 : 지금은 리다이렉트&포워드 공부시간~~");
	request.setAttribute("self", new Person("dani", 30));
%>


<!-- 포워드로 페이지를 요청해보자!! -->
<!-- 쿼리스트링으로 넘긴 메서드는 겟파라미터로 이용해서 수집할 수 있다. -->
<% RequestDispatcher d = request.getRequestDispatcher("requestRedirect.jsp?isRedirect=포워드"); 
	d.forward(request, response);
%>
</body>
</html>