<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1><%=request.getParameter("id") %>님 로그인에 성공하셨습니다!</h1>
<h2>checked : <%=request.getParameter("saves")%></h2>

</body>
</html>