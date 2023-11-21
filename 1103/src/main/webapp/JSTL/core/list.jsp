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
<!-- 리스트가 비었을때 -->
<!-- 리스트가 비어있지 않을때 목록 출력 -->
<table border="1">
<thead>
	<tr>
	<th style="width:3%">번호</th>
	<th style="width:60%">제목</th>
	<th style="width:4%">작성자</th>
	<th style="width:10%">작성일</th>
	<th style="width:4%">조회수</th>
	</tr>
</thead>


<c:if test="${empty list}" var="result" >
<tr>
<td colspan="5" align="center">리스트가 비어있습니다.</td>
</tr>
</c:if>
<c:if test="${not result}">
<c:forEach var="num" items="${list }">
	<tr>
	<td>${num.num }</td>
	<td>${num.title }     </td>
	<td>${num.id }        </td>
	<td>${num.postdate }  </td>
	<td>${num.visitcount }</td>
	</tr>
</c:forEach>
</c:if>
</table>
</body>
</html>