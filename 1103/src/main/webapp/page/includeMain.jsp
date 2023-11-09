<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
=========includeFile.jsp==========
<h1>include 지시어</h1>
오늘 날짜 : <%=today %> <br />
=========includeFile.jsp==========
<hr>
<ul>
<li>선언부(클래스 내부에 생성) <br />
	- 메서드 작성이 가능 <br />
	- <\%! %>
</li>
<li>
스크립틀릿(메서드 내부에 생성) <br />
	- 메서드 작성이 불가능 <br />
	- 자바코드 <br />
	- <\% %>	
</li>
<li>
표현식 <br />
	- 실행 결과 하나의 값을 출력 <br />
	- 상수, 변수, 연산자, 수식 사용 가능 <br />
	- <%=10+20 %>
	- <%= "오늘 날짜는 " + today %>
	</li>
</ul>

<hr>
=========includeFooter.jsp==========
<%@ include file="includeFooter.jsp" %>
=========includeFooter.jsp==========
<hr>
</body>
</html>