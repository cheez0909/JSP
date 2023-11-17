<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%
		PageDTO pages = null;
	if(request.getAttribute("page")!=null && !"".equals(request.getAttribute("page"))){
		pages = (PageDTO) request.getAttribute("page");
	} else{
		pages = new PageDTO(0, new Criteria());
	}
%>
<%--jsp:useBean id="pageDTO2" class="com.momo.dto.PageDTO"></jsp:useBean>  --%>
<%--<jsp:getProperty property="pageNo" name="pageDTO2"/> --%>

</head>
<body style="user-select: auto;">
<nav aria-label="Page navigation example">
  <ul class="pagination">
  	<!-- disabled : 비활성화 -->
   	<li class="page-item <%= pages.isPrevious() ? "" : "disabled" %>">
      <a class="page-link" href="/boardList?pageNo=<%=pages.getCriteria().getPageNo() - 1%>" >Previous</a>
    </li>
    
    <!-- 게시물 수에 따라서 페이지블럭이 달라짐 -->
    <%
    	for(int i = pages.getPage_startNo(); i <= pages.getPage_endNo(); i++){
    %>
    <!-- active : 활성화 -->
    <li class="page-item <%= pages.getCriteria().getPageNo() == i ? "active" : "" %>" aria-current="page">
      <a class="page-link" href="/boardList?pageNo=<%=i%>"><%=i %></a>
    </li>
    <%} %>
   
    
    
    <li class="page-item">
      <a class="page-link <%= pages.isNext() ? "" : "disabled" %>" href="/boardList?pageNo=<%=pages.getCriteria().getPageNo() + 1%>">Next</a>
    </li>
  </ul>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>