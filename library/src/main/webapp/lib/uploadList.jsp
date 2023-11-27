<%@page import="library.dto.fileDTO"%>
<%@page import="java.util.List"%>
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
<table>
<thead>
<tr>
<th>파일번호</th>
<th>제목</th>
<th>아이디</th>
<th>카테고리</th>
<th>원본파일명</th>
<th>저장파일명</th>
<th>등록일</th>
</tr>
</thead>
<tbody>
<c:if test="${not empty list }">
<c:forEach var="filedto" items="${list }">
<tr>
<td>${filedto.file_no }</td>
<td>${filedto.name }</td>
<td>${filedto.title }</td>
<td>${filedto.cate }</td>
<td>${filedto.ofile }</td>
<td>${filedto.sfile }</td>
<td>${filedto.postdate }</td>
</tr>
</c:forEach>
</c:if>

</tbody>
</table>
</body>
</html>


