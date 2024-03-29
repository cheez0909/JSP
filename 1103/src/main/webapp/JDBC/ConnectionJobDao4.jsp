<%@page import="com.momo.dao.JobDAO"%>
<%@page import="com.momo.dao.DeptDAO3"%>
<%@page import="com.momo.dto.DeptDTO"%>
<%@page import="com.momo.dao.DeptDAO2"%>
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
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<h1>JobDAO - 1</h1>
<%
	JobDAO job = new JobDAO(application);
	List<Job> list = job.getList();
	for(int i=0; i<list.size(); i++){%>
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        JobDAO - J<%=i %>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      	<code>list.get(i)</code>
      	<%= list.get(i) %>
      </div>
    </div>
  </div>
</div>
<%}%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>