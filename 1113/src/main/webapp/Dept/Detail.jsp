<%@page import="com.deptInfo.EmployeeDTO"%>
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

<table border=1>
<thead>
<tr>
<th>이름</th>
<th>주민번호</th>
<th>이메일</th>
<th>전화번호</th>
<th>월급</th>
</tr>
<a href="/Dept/addEmployee.jsp"><button type="submit">추가하기</button></a>
</thead>

<%


	if(request.getAttribute("details")!=null){
		List<EmployeeDTO> dtos = (List<EmployeeDTO>) request.getAttribute("details");
		for(EmployeeDTO num : dtos){
%>
			<tr>
			<td><%= num.getEmp_name()%></td>
			<td><%=num.getEmp_no()%></td>
			<td><%=num.getEmail()%></td>
			<td><%=num.getPhone()%></td>
			<td><%=num.getSalary()%></td>
			</tr>
<%		
		}
	}
%>

</table>
</body>
</html>