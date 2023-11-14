<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String msg = "1".equals(request.getParameter("err")) ? "아이디 비밀번호를 확인해주세요 " : ""; %>
<%=msg %>
<form action="/Login" method="post">
	<div id='login'>
	사원번호 : <input type="text" name="id" />
	생년월일 : <input type="password" name="pw" />
	</div>
	<button type="submit" id="button">로그인</button>
</form>
</body>
</html>