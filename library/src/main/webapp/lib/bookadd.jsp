<%@page import="library.dao.libraryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.w-15 {width:15%;}
.w-20 {width:20%;}

</style>


<link rel="stylesheet" href="../bootstrap.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../bootstrap.css" style="user-select: auto;">


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</head>
<body style="width: 80%; margin: 0 auto; align: center;">

<!-- header 외부 파일 인클루드 -->
<%@ include file = "common/Header.jsp" %>


<script type="text/javascript">
window.onload = function() {
	
	let addbtn = document.querySelector("#addbtn");
	
	if(addbtn!=null){
		addbtn.addEventListener('click', function(){
			alert('등록합니당~(❁´◡`❁)(❁´◡`❁)');
	});
};
};

</script>
<c:if test="${param.err eq 1 }">
<p>No를 다시 입력해주세요</p>
</c:if>

<div class="card bg-secondary mb-3">
  <div class="card-header" style="user-select: auto;">
  <h6>책 정보 추가하기
  </h6>
  </div>
  

	<div class="card-body" style="user-select: auto;">
	
	
<form action="/uploadProcess" method="post" enctype="multipart/form-data">
<div class="form-group" style="user-select: auto;">
  <div class="form-group" style="user-select: auto;">
    <div class="input-group mb-3" style="user-select: auto;">
      <span class="input-group-text w-15" style="user-select: auto;">No</span>
      <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="no" value="${no +1}" disabled>
    </div>
    <div class="input-group mb-3" style="user-select: auto;">
      <span class="input-group-text w-15" style="user-select: auto;">TITLE</span>
      <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="title">
    </div>
    
    <div class="input-group mb-3" style="user-select: auto;">
      <span class="input-group-text w-15" style="user-select: auto;">RENTYN</span>
      <select name="yn" >
		<option value="Y">Y</option>
		<option value="N">N</option>
		</select>
		</div>
		
    <div class="input-group mb-3" style="user-select: auto;">
      <span class="input-group-text w-15" style="user-select: auto;">AUTHOR</span>
      <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="author">
    </div>
    
    <div class="input-group mb-3 w-15" style="user-select: auto;">
    <span class="input-group-text w-15" style="user-select: auto;">파일첨부</span>
      <input class="form-control w-15" type="file" id="formFile" style="user-select: auto;" name="formFile">
    </div>
    
    <div class="input-group" style="user-select: auto;">
	<button type="submit" id="addbtn" class="btn btn-primary" style="user-select: auto;">등록</button>
    </div>
  </div>
</div>
</form>
	</div>
</div>

<!-- footer 외부 파일 인클루드 -->
<%@ include file = "common/Footer.jsp" %>


</body>
</html>