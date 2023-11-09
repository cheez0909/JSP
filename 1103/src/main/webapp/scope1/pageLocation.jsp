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

<!-- Main 셋메소드가 공유되지 않음 -->
<%

	Object page_str =pageContext.getAttribute("page_str");
	Object page_int = pageContext.getAttribute("page_int");
	Object page_p = pageContext.getAttribute("page_p");
	
	String msg = page_str==null ? "page_str이 널값입니다" : "널값이 아닙니다";
	String msg1 = page_int==null ? "page_int이 널값입니다" : "널값이 아닙니다";
	String msg2 = page_p==null ? "page_p이 널값입니다" : "널값이 아닙니다";
%>

<%=msg %><br>
<%=msg1 %><br>
<%=msg2 %>

</body>
</html>