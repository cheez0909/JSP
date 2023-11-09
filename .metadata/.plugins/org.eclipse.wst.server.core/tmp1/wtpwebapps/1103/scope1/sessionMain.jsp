<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	웹브라우저에서 서버에 처음 요청할 때 sessionID를 발급
	-> 응답객의 쿠키에 담아서 웹 브라우저로 전송
	-> 웹브라우저는 응답을 받아서 쿠키에 저장
	-> 서버에 요청 시 쿠키정보를 담아서 요청
 
 	회원 인증 후 로그인 상태를 유지 하는 데 사용
 	웹 브라우저를 닫고 다시 열게 되면 세션은 유지 되지 않는다.
 
 -->
 
 <%
 
 	session.setAttribute("self", new Person("dani", 30));
 
 	List<String> list = new ArrayList<String>();
 	list.add("list");
 	list.add("set"); // 로또 만들기 사용
 	list.add("map"); // 여러가지 형식의 데이터를 전송하기 위해 map에 담아서 전달
 	
 	session.setAttribute("list", list);
 %>
 
<h2>페이지 이동 후 session 영역에 저장된 값을 출력</h2>
<a href ="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>

<h2>세션 무효화</h2>
 <a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>


</body>
</html>