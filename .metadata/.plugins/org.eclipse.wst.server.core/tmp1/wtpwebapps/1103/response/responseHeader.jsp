<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	
	<%
	
	response.addIntHeader("age", 100); 
	response.addHeader("id", "test"); // 수정
	response.addHeader("id", "dani"); // 추가
	
	
	Collection<String> headerNames =
		response.getHeaderNames();
	for(String hName : headerNames){
		String hValue = response.getHeader(hName);
		out.print("<br> 헤더 명 : " +hName);
		out.print(" / 헤더 값 :" +hValue);
	}
	%>

	<%
	%>
</body>
</html>