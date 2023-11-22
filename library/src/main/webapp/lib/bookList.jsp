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
<script type="text/javascript">
window.onload = function() {
	alert("로그아웃합니다.");
	
	let addbtn = document.querySelector("#addListbtn");
	
	if(addbtn!=null){
		addbtn.addEventListener('click', function(){
			alert("추가합니다~!");
			location.href="/lib/bookadd.jsp";
		});
	}
};
</script>
<!-- header 외부 파일 인클루드 -->
<%@ include file = "common/Header.jsp" %>

<!-- 도서 목록 출력 -->
<table border = "1">
<thead>
<tr>
<td colspan="4">
<input type="button" name="addListbtns" id="addListbtn" value="추가하기"></td>
</tr>
<tr>
<th>No</th>
<th>TITLE</th>
<th>RENTYN</th>
<th>AUTHOR</th>
</tr>
</thead>

<c:if test="${not empty list }">
<c:forEach var="bookList" items="${list}">
<tr>
<td>${bookList.no }</td>
<td>${bookList.title }</td>
<td>${bookList.rentyn }</td>
<td>${bookList.author }</td>
</tr>
</c:forEach>
</c:if>
</table>
<!-- footer 외부 파일 인클루드 -->
<%@ include file = "common/Footer.jsp" %>
</body>
</html>