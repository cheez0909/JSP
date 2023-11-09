<%@page import="com.momo.dto.Person"%>
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
	request.setAttribute("request_str", "request영역에 문자열 저장");
	request.setAttribute("request_person", new Person("da-eun", 29));

	
	Person request_person = new Person();
	
	if(request.getAttribute("request_person")!=null){
		request_person = (Person) request.getAttribute("request_person");
	}
	
	String msg1 = request.getAttribute("request_str")==null ? "널값" : request.getAttribute("request_str").toString();
	

	%>

<%=request_person %>
<%=msg1 %>
<!-- 출력 Ok -->

<!-- forward : request 영역 공유
sendredirect : request 영역 공유 안됨 -->



<h2>forward된 페이지에서 request 영역 속성 값 읽기</h2>
<%
	if(request.getParameter("isRedirect")!=null){
		// 리다이렉트 방식을 이용 시 다음 요청 페이지에 값을 넘기는 방법
		// 리다이렉트 방식을 이용 시 다음 요청 페이지에 값을 넘기는 방법
		// 리퀘스트 영역이 공유 되지 않으므로 리퀘스트 영역에 값을 저장 해도 유지가 안됨
		// 1. 뭐리스트링 방법 -> 겟 파라미터로 가져옴
		// 2. 세션을 이용하는 방법 -> 세션은 서버에 저장되는 영역이므로 필요 시 생성 후 바로 제거 해준다.
		
		// 리다이렉트 방식
		// 주소값도 바뀌고
		// 내용도 바뀌고 
		//request.setAttribute("isRedirect", 1);
		//session.setAttribute("isRedirect", "1");
		response.sendRedirect("requestForward.jsp?isRedirect=1");
	} else {
	// forward 방식
	// 주소는 main에서 안바뀌고 내용만 forward로 바뀜
	// requestForward.jsp에서 변수에 값을 다시 저장했지만, Main의 값이 불러와 진다.
	// 값이 공유된다.
	RequestDispatcher d = request.getRequestDispatcher("requestForward.jsp");
	d.forward(request, response);
	}
%>




</body>
</html>