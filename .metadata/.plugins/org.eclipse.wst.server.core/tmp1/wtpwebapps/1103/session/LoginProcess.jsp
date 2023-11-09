<%@page import="com.momo.dto.memberDTO"%>
<%@page import="com.momo.dao.memberDAO"%>
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
		1. 사용자의 요청 파라메터 수집(id, pw)
		2. DB에 등록된 사용자인지 확인
			- user테이블 생성
			- 사용자 정보 등록
	*/
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	memberDAO members = new memberDAO();
	memberDTO memberdto = members.login(id, pw);
	
	members.close();
	
	if(memberdto != null){
		// 로그인 성공 -> 메인 페이지
		// 세션에 저장
		session.setAttribute("memberDTO", memberdto);
		session.setAttribute("user_id", id);
		response.sendRedirect("loginMain.jsp");
	} else{
		// 로그인 페이지로 이동 후 메세지 출력
		request.getRequestDispatcher("loginForm.jsp?err=1").forward(request, response);
	}
	
%>


</body>
</html>