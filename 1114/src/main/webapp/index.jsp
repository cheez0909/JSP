<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인덱스페이지입니다.</h1>
<%=request.getAttribute("str") %>
<%=request.getAttribute("time") %>
</body>
</html>