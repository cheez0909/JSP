<%@page import="library.dto.Criteria"%>
<%@page import="library.dto.pageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../bootstrap.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../bootstrap.css" style="user-select: auto;">


<script src="../bootstrap.min.css" style="user-select: auto;"></script>
<title>Insert title here</title>

<style type="text/css">
	.pointer {
		cursor : pointer;
	}
</style>


</head>
<body style="width: 80%; margin: 0 auto; align: center;">
<script type="text/javascript">
window.onload = function() {
	alert("로그아웃합니다.");
	
	let addbtn = document.querySelector("#addListbtn");
	
	if(addbtn!=null){
		addbtn.addEventListener('click', function(){
			alert("추가합니다~!");
			//location.href="/lib/bookadd.jsp";
			location.href="/addList";
		});
	}
};


// function click(str){
//	 alert(str);
//}

//click('안녕');

//function msg(str){
//	alert(str);
//}


function view(no, pageNo){

	location.href = "/detail?No=" + no+"&pageNo="+pageNo; 
}

function gopage(go){
	location.href = "/library?pageNo=" + go;
}



</script>


<!-- header 외부 파일 인클루드 -->
<%@ include file = "common/Header.jsp" %>




<!-- 검색하기 -->
<div class="card bg-secondary mb-3">
  <div class="card-header" style="user-select: auto;">
  <h6>게시판입니당.
  </h6>
  </div>
  

	<div class="card-body" style="user-select: auto;">
		<form action="/library" class="table-responsive" style="display:inline-block;">
 			<div class="form-group" style="user-select: auto;">
				<div class="input-group mb-3" style="user-select: auto;">
     				<select class="form-select" name="searchField" id="exampleSelect1" >
       				<option value="title">책제목</option>
       				<option value="author">작가</option>
    				</select>
					<input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username"  aria-describedby="button-addon2" name="searchWord">
					<button class="btn btn-outline-primary" type="submit" id="searchBtn" style="user-select: auto;">검색</button>
     			</div>
			</div>
 		</form>
  	
		<!-- 추가하기 버튼 / 스크립트로 작동함 -->
		<input type="button" class="btn btn-outline-info" name="addListbtns" id="addListbtn" value="추가하기" style="float:right">
      
  		<!-- 도서 목록 출력 -->
  		<table class="table table-hover" >
  		<thead>
    		<tr class="table-primary">
      			<th>No</th>
				<th>TITLE</th>
				<th>RENTYN</th>
				<th>AUTHOR</th>
    		</tr>
  		</thead>
  

		<tbody>
			<c:if test="${not empty list }">
			<c:forEach var="bookList" items="${list}">
			<form>
			<tr>
				<td>${bookList.no }</td>
				<c:if test="${empty param.pageNo}">
					<td><a class = "pointer" onclick="view(${bookList.no}, 1)" >${bookList.title }</a></td>
				</c:if>
				<c:if test="${not empty param.pageNo}">
					<td><a class = "pointer" onclick="view(${bookList.no}, ${param.pageNo })" >${bookList.title }</a></td>
				</c:if>
				<td>${bookList.rentyn }</td>
				<td>${bookList.author }</td>
			</tr>
			</form>
			</c:forEach>
			</c:if>
		</tbody>

		<tfoot>
			<%@ include file = "Navigation.jsp" %>
		</tfoot>
		</table>
	</div>
</div>







<!-- footer 외부 파일 인클루드 -->
<%@ include file = "common/Footer.jsp" %>

</body>
</html>