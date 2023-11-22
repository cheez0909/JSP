<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
<input type="button" name="addListbtns" id="addListbtn" value="추가하기" style="float:right"></td>
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

<form>
<tr>
<td>${bookList.no }</td>
<td><a href="/detail?No=${bookList.no }">${bookList.title }</a></td>
<td>${bookList.rentyn }</td>
<td>${bookList.author }</td>
</tr>
</form>
</c:forEach>
</c:if>
<tr>
<td colspan="4">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</td>
</tr>
</table>
<!-- footer 외부 파일 인클루드 -->
<%@ include file = "common/Footer.jsp" %>


</body>
</html>