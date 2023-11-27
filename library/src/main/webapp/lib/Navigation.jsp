<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 페이지 블럭을 출력하는 방법 -->
<!-- 1. pageDTO를 request에 저장
	2. PageNavi.jsp를 원하는 위치에 include 하기
	3. searchForm을 생성
		pageNo요소가 있어야함
 -->
 
<%
	pageDTO dto = null;
	if(request.getAttribute("page")!=null){
		
		dto = (pageDTO) request.getAttribute("page");
	}else{
		dto = new pageDTO(0, new Criteria());
	}
%>

<tr class="table-primary" style="user-select: auto;">
<td colspan="4">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${page.pre ? 'active' : 'disabled'}">
      <a class="page-link" onclick="gopage(${page.critera.pageNo -1})">Previous</a>
    </li>
    
	<%for(int i=dto.getPage_firstNo(); i<=dto.getPage_lastNo(); i++) {
		String curr = i == dto.getCritera().getPageNo() ? "active" : "";
	%>
    <li class="page-item <%=curr%>"><a class="page-link" href="/library?pageNo=<%=i%>"><%=i %></a>
    </li>
    <%} %>
    
    <%String next = dto.isNext() ? "active" : "disabled";%>
    <li class="page-item <%=next%>">
      <a class="page-link" href="/library?pageNo=<%=dto.getCritera().getPageNo() + 1%>">Next</a>
    </li>
  </ul>
</nav>
</td>
</tr>
</body>
</html>