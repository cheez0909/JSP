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
<h2>팝업 페이지 입니다.</h2>

<%
	// inactiveToday값을 출력 해봅니다.
	// 팝업닫기용 popupClose, Y 쿠키 생성
	// cookiePopupMain페이지로 페이지 전환
	String value = request.getParameter("inactiveToday");
	out.print(value); // 팝업닫기용 밸류 출력해보기
	if("Y".equals(value)){
	CookieManager.makeCookie(response, "popupClose", value, 3000);
	
	response.sendRedirect("cookiePopupMain1.jsp");
	
	//request.getRequestDispatcher("cookiePopupMain1.jsp")
	//.forward(request, response);
	}
%>
</body>
</html>