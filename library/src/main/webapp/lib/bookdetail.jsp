<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
	list-style: none;
}
</style>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	let backbtn = document.querySelector("#backbtn");
	if(backbtn!=null){
		backbtn.addEventListener('click', ()=> {
			alert('뒤로 갈게요~');
			history.back();
		});
	};
};
</script>
<ul>
<c:if test="${not empty dto }">
<form action="" method="post">
<li>NO : ${dto.no }</li>
<li>제목 : ${dto.title }</li>
<li>대여여부 : ${dto.rentyn }</li>
<li>작가 : ${dto.author }</li>
<li><button type="button" id="backbtn">뒤로가기</button></li>
<li><button type="submit" id="modifybtn">수정하기</button></li>
</form>
</c:if>
</ul>
</body>
</html>