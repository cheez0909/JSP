<%@page import="java.util.List"%>
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


<%
	if(session.getAttribute("self")!=null){
		Person p = (Person) session.getAttribute("self");
		out.print(p+"<br>");
	} else {
		out.print("세션에 저장된 person객체는 없습니다");
	}
%>



<%
	if(session.getAttribute("list")!=null){
		List<String> list = 
				(List) session.getAttribute("list");
		
		for(String str : list){
			out.print(str+"<br>");
		}
	}else{
		out.print("세션에 저장된 person객체는 없습니다");
	}
%>
<h2>세션 무효화</h2>


</body>
</html>