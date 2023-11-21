<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 변수 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="scopeVar" value="pageValue"></c:set>
<c:set var="scopeVar" value="requestValue" scope="request"></c:set>
<c:set var="scopeVar" value="sessionValue" scope="session"></c:set>
<c:set var="scopeVar" value="applicationValue" scope="application"></c:set>
<h1>4가지 영역에 저장된 속성을 출력해봅시다</h1>
<ul>
<li>${scopeVar }</li>
<li>${pageScope.scopeVar }</li>
<li>${requestScope.scopeVar }</li>
<li>${sessionScope.scopeVar }</li>
<li>${applicationScope.scopeVar }</li>
</ul>

<hr>

<h2>session영역에 저장된 속성을 삭제해봅시다.</h2>

<c:remove var="scopeVar" scope="session" />

<ul>
<li>${scopeVar }</li>
<li>${pageScope.scopeVar }</li>
<li>${requestScope.scopeVar }</li>
<li>${sessionScope.scopeVar }</li>
<li>${applicationScope.scopeVar }</li>
</ul>

<h2>전체영역에 저장된 속성을 삭제해봅시다.</h2>
<!-- 영역을 지정해주지 않으면 전체 영역에서 삭제됨 -->
<c:remove var="scopeVar" />
<ul>
<li>${scopeVar }</li>
<li>${pageScope.scopeVar }</li>
<li>${requestScope.scopeVar }</li>
<li>${sessionScope.scopeVar }</li>
<li>${applicationScope.scopeVar }</li>
</ul>
</body>
</html>