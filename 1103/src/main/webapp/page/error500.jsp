<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
    <!-- 에러가 발생할 경우 해당파일로 이동 errorPage  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어</title>
</head>
<body>
<%

	int age = 0;
	// try{
		 age = 
				Integer.parseInt(request.getParameter("age"));
		out.print("나이 : " + age);
		
	//}catch(Exception e){
	//	out.print("예외가 발생하였습니다");
	//}
	
%>
<hr>
<%="나이 : " + age %>
</body>
</html>