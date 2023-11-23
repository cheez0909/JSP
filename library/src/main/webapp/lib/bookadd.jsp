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
ul{
list-style: none;
}
</style>
</head>
<body>

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
<form action="/addList" method="post">
<ul>
<li>No : <input type="text" name="no" value="${no +1}"></li>
<li>TITLE : <input type="text" name="title"></li>
<li>RENTYN :
<select name="yn">
<option value="Y">Y</option>
<option value="N">N</option>
</select>
</li>
<li>AUTHOR : <input type="text" name="author"></li>
<li><button type="submit" id="addbtn" >등록</button></li>
</ul>
</form>
</body>
</html>