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
	
	let modifybtn = document.querySelector("#modifybtn");
	if(modifybtn!=null){
		modifybtn.addEventListener('click', ()=> {
			alert('클릭')
			detail.action="/lib/ModifyBook.jsp?pageNo="+${param.pageNo };
		});
	};
	
};


/*
 * 	스크립트에서 함수를 정의하는 방법
 	function 함수명(파람1, 파람2, ... ){
	
	}
	
	함수의 호출
	함수명(파람1, 파람2, ...);
 */
 

 
 
 
 
</script>
<ul>
<c:if test="${not empty dto }">
<form name="detail" method="post">
<li>NO : ${dto.no }<input type="hidden" name="No" value="${dto.no }" /></li>
<li>제목 : ${dto.title }<input type="hidden" name="Title" value="${dto.title }" /></li>
<li>대여여부 : ${dto.rentyn }<input type="hidden" name="YN" value="${dto.rentyn }" /></li>
<li>작가 : ${dto.author }<input type="hidden" name="Author" value="${dto.author }" /></li>
<li><button type="submit" id="modifybtn">수정하기</button></li>
</form>
<li><button type="button" id="backbtn">뒤로가기</button></li>
</c:if>
</ul>
</body>
</html>