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
	Cookie[] cookie = request.getCookies();
	// 헤더에 있는 쿠키 정보 꺼내오기
	if(cookie!=null){
		for(Cookie num : cookie){
			String name = num.getName();
			String value = num.getValue();
			out.print(name + ", " + value + "<br>");
		}
	}
%>
</body>
</html>