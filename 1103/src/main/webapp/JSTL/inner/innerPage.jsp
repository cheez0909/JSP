<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 외부 페이지 연결하기 -->
<c:import url="https://www.yes24.com/Main/default.aspx"></c:import>

${param.text } <br>
${param.title}
</body>
</html>