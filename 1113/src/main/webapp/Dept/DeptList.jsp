<%@page import="com.deptInfo.DeptNationalDTO"%>
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


<table border = 1>

<tr>
<th>부서코드</th>
<th>부서이름</th>
<th>위치</th>
</tr>

<%
	if(request.getAttribute("DeptNational")!=null){
	List<DeptNationalDTO> deptdto = (List<DeptNationalDTO>) request.getAttribute("DeptNational");
		for(DeptNationalDTO num : deptdto){%>
		<tr>
		<td><%=num.getDept_id() %></td>
		<td><a href="/DeptDetail?dept_code=<%=num.getDept_id()%>"><%=num.getDept_title()%></a></td>
		<td><%= num.getNational_name() %></td>
		</tr>
			
<%		}
	}
%>
</table>
</body>
</html>