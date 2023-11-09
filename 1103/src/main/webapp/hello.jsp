<!-- 
	패이지 지시어
	JSP페이지를 자바(서블릿)코드로 변환하는 데 필요한 정보를
	JSP 엔진에 알려주며, 주로 스크립트 언어나 인코딩 방식등을 설정
	
	페이지 지시어가 없는 경우, 오류가 발생
	
	속성 = 값
	language = "java"
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
	// 자바 코드를 입력하기 위해 스크립트를 열어줍니다. 
	String title = ".JSP 파일입니다."; 

	// 외부 클래스를 사용하기 위해서 page 지시어 import 속성을 이용!!
	Date today = new Date();
	

%>

<h1><% out.print(title); %></h1>
<hr>
<h2>
<% 
	// 내장객체 : 생성하지 않았지만 jsp가 자동으로 클래스로 변환되면서 생성해주는 객체 
	// out : 웹 브라우저에 출력하기 위한 내장객체
	out.print("오늘 날짜 : "  + today); 

%>
</h2>
<hr>
<h3>
<%= today %>
</h3>

</body>
</html>