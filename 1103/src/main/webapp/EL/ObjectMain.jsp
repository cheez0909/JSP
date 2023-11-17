<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 다른 영역에 있는 값 읽기 -->
<h1>쿠키 값 읽기</h1>
<%
	CookieManager.makeCookie(response, "cookies", "123456789", 600);
	out.print("cookies :" +CookieManager.getCookieValue(request, "cookies"));
%>
<br/ >cookies : ${cookie.cookies.value }


<hr>

<h1>HTTP 헤더 읽기</h1>
<ul>
	
<li>host : ${header.host }</li>
<li>user-agent : ${header['user-agent'] }</li>
<li>cookie : ${header.cookie }</li>

</ul>

<hr>
<h1>컨텍스트 초기화 매개변수(web.xml에 저장된 매개변수)</h1>
initParam : ${initParam.INIT_PARAM }


<hr>

<h1>오라클 정보 불러오기</h1>
${initParam.driver }
${initParam.url }
<hr>

<h1>컨텍스트 루트 경로 읽기</h1>
경로를 지정하기 위해 종종 사용됨!!
${pageContext.request.contextPath }


<!-- 
	쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
	
	cookie : 쿠키를 읽을 때 사용
	header : 헤더정보를 읽을때
	initParam : web.xml에 설정한 컨텍스트 초기화 매개변수
	pageContext : JSP의 pageContext와 동일한 역할
 -->
 
 <a href="ObjectCollection.jsp?num=2">여기를 누르세요</a>
</body>
</html>