<%@page import="com.momo.dto.DeptDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
.card {
	display: inline-block;
	margin : 20px;
}

</style>
</head>
<body>
<h1>컨트롤러로 호출한 페이지</h1>

<%

	List<DeptDTO> dto = (List<DeptDTO>) request.getAttribute("dto");
	for(DeptDTO num : dto){%>
	

<form action="deptTitle.jsp">
<div class="card" style="width: 18rem;">
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><% out.print(num.getDEPT_ID());%></li>
    <li class="list-group-item"><% out.print(num.getDEPT_TITLE());%><input type="submit" value="<% out.print(num.getDEPT_TITLE());%>" name="detail"/></li>
    <li class="list-group-item"><% out.print(num.getLocal_name());%></li>
  </ul>
</div>
</form>
<%} %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</body>
</html>