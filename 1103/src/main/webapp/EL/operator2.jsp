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
<%
/*
	empty 연산자
	값이 없는 경우 true를 반환
	 - null
	 - 빈문자열
	 - 길이가 0인 배열
	 - size가 0인 컬렉션
*/
pageContext.setAttribute("nullstr", null);
pageContext.setAttribute("emptystr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList<>());
pageContext.setAttribute("str", "str");

%>
<h3>empty 연산자</h3>
<!-- 주로 리스트 출력 시 리스트가 비었는 지 확인하는 용도로 사용 -->
empty nullstr : ${empty nullstr } <br> 
empty emptystr : ${empty emptystr } <br>
empty lengthZero : ${empty lengthZero } <br>
empty sizeZero : ${empty sizeZero } <br>
empty str : ${empty str } <br>

<hr>

<h3>null을 이용한 연산</h3>
<!--  null이 연산에 사용될 경우 0으로 인식 오류가 발생하지 않음 -->
${null + 10 } <br>
${nullstr + 10 } <br>
${param.noVar>10 } <br>


</body>
</html>