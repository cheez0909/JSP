<%@page import="com.momo.dto.myDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// jsp를 단독으로 실행할경우 list 값을 받아오지 못해서 null이 출력될 수 있다.
	List<myDTO> list = (List<myDTO>) request.getAttribute("list");
	out.print(list);

%>
</body>
</html>