<%@page import="com.momo.dto.myDTO"%>
<%@page import="com.momo.dao.myDAO"%>
<%@page import="com.momo.dao.DeptDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>Insert title here</title>
<style>
.card{
	margin : 10px;
	display : inline-block;
}
</style>
</head>
<body>

<h1>사원 목록</h1>
<%
	myDAO mydao = new myDAO(application);
	List<myDTO> list = mydao.getList();
	for(myDTO num : list){%>
		
	


<div class="card" style="width: 18rem;">
  <div class="card-header">
    <%=num.getDEPT_TITLE() %>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><a href="employee.jsp" ><%=num.getEMP_NAME() %></a></li>
    <li class="list-group-item"><%=num.getJOB_NAME() %></li>
  </ul>
</div>

<% }%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>

</html>