<%@page import="com.login.dto.EmployeeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
window.onload = function() {
	let logoutbtn = document.querySelector("#logout");
	// if(loglogoutbtn!=null){
	//logoutbtn.addEventListner('click', function(){
	//	alert("로그아웃되었습니다");
	//});
	//}
	
	if(logoutbtn!=null){
		logoutbtn.onclick = function() {
			location.href ="/Logout";
		}
	}
	
}
</script>

<%
	
	EmployeeDTO dto = (EmployeeDTO) request.getAttribute("list");
	if(dto!=null){
		out.print(dto.getEmp_name() + "님 환영합니다");
		out.print("<button type='submit' id='logout'>로그아웃</button>");

	}else{
		out.print("로그인해주세요");
	}
	request.setAttribute("list2", dto);
%>

<%@ include file="board.jsp" %>

</body>
</html>