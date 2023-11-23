<%@page import="library.dto.Criteria"%>
<%@page import="library.dto.pageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<link rel="stylesheet" href="../5/simplex/bootstrap.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/bootstrap-icons/font/bootstrap-icons.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css" style="user-select: auto;">
<link rel="stylesheet" href="../_assets/css/custom.min.css" style="user-select: auto;">


<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-KGDJBEFF3W" style="user-select: auto;"></script>
<title>Insert title here</title>

<style type="text/css">
	.pointer {
		cursor : pointer;
	}
</style>


</head>
<body>
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
<form action="/library">
<input type="text" name="searchWord">
<select name="searchField">
<option value="title">책제목</option>
<option value="author">작가</option>
</select>
<button type="submit" id="searchBtn">검색</button>
</form>

<!-- 추가하기 버튼 / 스크립트로 작동함 -->
<input type="button" name="addListbtns" id="addListbtn" value="추가하기">

<!-- 도서 목록 출력 -->
<table>
<thead>
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

<%
	pageDTO dto = null;
	if(request.getAttribute("page")!=null){
		
		dto = (pageDTO) request.getAttribute("page");
	}else{
		dto = new pageDTO(0, new Criteria());
	}
%>
<tr>
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

</table>

<div class="card bg-light mb-3" style="width : 70%; ">
  <div class="card-header" style="user-select: auto;">
  <h6>게시판입니당.
  </h6>
  </div>
  <div class="card-body" style="user-select: auto;">
  <div class="table-responsive">
  		<div style=" float : left; ">
    	<input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." style=" float : left; ">
      <select class="form-select" id="exampleSelect1" style="float : right; ">
        <option style="user-select: auto;">1</option>
        <option style="user-select: auto;">2</option>
        <option style="user-select: auto;">3</option>
        <option style="user-select: auto;">4</option>
        <option style="user-select: auto;">5</option>
      </select>
     </div>
  </div>
      
  <table class="table table-hover" >
  <thead>
    <tr>
      <th>Type</th>
      <th>Column heading</th>
      <th>Column heading</th>
      <th>Column heading</th>
    </tr>
  </thead>
  <tbody>
  <tr class="table-primary" style="user-select: auto;">
      <th >Primary</th>
      <td >Column content</td>
      <td>Column content</td>
      <td>Column content</td>
   </tr>
  </tbody>
</table>
  </div>
</div>



<!-- footer 외부 파일 인클루드 -->
<%@ include file = "common/Footer.jsp" %>

<script src="../_assets/js/custom.js" style="user-select: auto;"></script>
 <script src="../_vendor/prismjs/prism.js" data-manual="" style="user-select: auto;"></script>   
<script src="../_vendor/bootstrap/dist/js/bootstrap.bundle.min.js" style="user-select: auto;"></script>
</body>
</html>