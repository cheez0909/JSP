<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 

	${영역.속성} -> 영역을 설정하지 않아도 아래의 순서로 찾음

	page : pageScope
	request : requestScope
	session : sessionScope
	application : 주로 설정파일 저장함
	
	request, session 주로 이용함

 --%>
 
 
 <h1>각 영역에 저장된 속성 읽기</h1>
 <%
 	request.setAttribute("requestScopeValue", "요청영역에 저장됨");
 	session.setAttribute("sessionScopeValue", "세션영역에 저장됨");
 	application.setAttribute("applicationScopeValue", "어플리케이션영역에 저장됨");
 	pageContext.setAttribute("pageScopeValue", "페이지영역에 저장됨");
 %>
 
 <ul>
<li>
EL표현언어(요청영역) : ${requestScope.requestScopeValue }</li>
<li>영역을 적어주지 않았음 : ${requestScopeValue}</li>
<hr>

<li>
EL표현언어(세션영역) : ${sessionScope.sessionScopeValue}</li>
<li> 영역을 적어주지 않았음 : ${sessionScopeValue}</li>
<hr>

<li>
EL표현언어(어플리케이션 영역) : ${applicationScope.applicationScopeValue }</li>
<li>영역을 적어주지 않았음 : ${applicationScopeValue}</li>
<hr>

<li>
EL표현언어(페이지 영역) : ${pageScope.pageScopeValue }</li>
<li>영역을 적어주지 않았음 : ${pageScopeValue}</li>

<hr>
<h2>NPE이 발생하지 않음</h2>
<li>
EL표현언어(페이지 영역) : ${pageScope.pageScopeValues }</li>
<li>영역을 적어주지 않았음 : ${pageScopeValues}</li>
</ul>

<jsp:forward page="ELFoward.jsp"></jsp:forward>


 
 
</body>
</html>