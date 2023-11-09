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
	// 리퀘스트 영역을 이용 시 값이 유지 되지 않으므로 다른 방법을 이용 해야 함.
	request.setAttribute("title", "메인 페이지 : 지금은 리다이렉트&포워드 공부시간~~");
	request.setAttribute("self", new Person("dani", 30));
%>


<!-- 리다이렉트로 페이지를 요청해보자! -->
<%
	response.sendRedirect("requestRedirect.jsp?isRedirect=1");
%>

<!--  -->
<%
	session.setAttribute("session_str", "session_str");
%>


</body>
</html>