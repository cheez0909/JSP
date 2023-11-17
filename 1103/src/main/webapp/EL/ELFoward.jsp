<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<li>페이지 영역(공유되지 않는다) : ${pageScopeValue }</li>
<li>요청 영역 : ${requestScopeValue }</li>
<li>어플리케이션영역 : ${applicationScopeValue }</li>
<li>세션 영역 : ${sessionScopeValue }</li>
</ul>
</body>
</html>