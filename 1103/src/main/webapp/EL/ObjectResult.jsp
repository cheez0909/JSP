<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.momo.dto.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영역을 통해 전달된 객체 읽기</h1>
<ul>
	<li>Person객체(daniObj)
		<p> 이름 : ${daniObj.name } / ${daniObj.age }
	</li>
	<li>문자열
		<p>${requestScope.str }</p>
	</li>
	
	<li>숫자
	<p>${integer }</p>
	</li>
</ul>
</body>
</html>