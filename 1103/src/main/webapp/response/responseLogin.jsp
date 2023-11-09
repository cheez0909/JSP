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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// id : dani & pwd : 1234 라면 로그인 성공
	// id.equals("dani") && id!= null
	if("dani".equals(id) && "1234".equals(pwd)){
		// 로그인 성공
		// 페이지 전환 -> 웹 브라우저 -> 웹 브라우저가 다시 요청
		// 요청정보가 공유되지 않음
		// 아이디를 파라미터로 넘겨주지 않으면 id값이 공유되지 않는다!
		response.sendRedirect("responseWelcome.jsp?id="+request.getParameter("id"));
	} else {
		// 로그인 실패
		// 이전화면으로 돌아가기
		// 요청 정보가 공유된다.
		request.getRequestDispatcher("responseMain.jsp?loginErr=1")
		.forward(request, response);
	}
%>

<h2>페이지를 전환하는 방법</h2>
<p>sendRedirect</p>
<p>forward</p>

id : <%= id %> <br>
pw : <%=pwd %>

</body>
</html>