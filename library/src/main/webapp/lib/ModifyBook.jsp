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

<form action="/Modify?no=${param.No }&pageNo=${param.pageNo}" method="post" name="modify">
<ul>
<li>No : <input type="text" name="no" value="${param.No }" disabled></li>
<li>TITLE : <input type="text" name="title" value="${param.Title }"></li>
<li>RENTYN :
<select name="yn">
<option value="Y" ${param.YN eq '대여중' ? 'selected' : ''}>Y</option>
<option value="N" ${param.YN eq '대여가능' ? 'selected' : ''}>N</option>
</select>
</li>
<li>AUTHOR : <input type="text" name="author" value="${param.Author }"></li>
<li><button type="submit" id="modifybtn" >수정</button></li>
</ul>
</form>
</body>
</html>