<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
 list-style:none;
}
</style>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	
	// 온 클릭의 경우 한 번에 한 번만 사용
	// submitbtn.onclick = function(){}

	// 여러개의 이벤트를 적용하고 싶은 경우 사용
	let submitbtn = document.querySelector("#submitbtn");
	
	submitbtn.addEventListener('click', ()=>{
		//alert('클릭');
		//submitbtn.action="FormResult.jsp";
		//submitbtn.submit();
		
		actionForm.action="FromResult.jsp";
		actionForm.method="post";
		actionForm.submit();
		
	});
}


</script>
<!-- 
	장바구니시에 체크박스 많이 이용함
	선택자를 잘 알아야 함!
 -->
 
<h1>폼값 전송하기</h1>
<form name = "actionForm">
<ul>
	<li>이름 : <input type="text" name="name" /></li>
	<li>성별 : 남자 <input type="radio" name="sex" value="male"> 
	여자 <input type="radio" name="sex" value="female"> </li>
	<li>학력 : 
	<select name="Education">
		<option value="elem">초딩</option>
		<option value="middle">중딩</option>
		<option value="high">고딩</option>
		<option value="uni">대딩</option>
	</select>
	</li>
	<li>
	관심사항 :
	<input type="checkbox" name="hobby" value="music" /> 음악
	<input type="checkbox" name="hobby" value="musical" /> 뮤지컬
	<input type="checkbox" name="hobby" value="movie" /> 영화
	<input type="checkbox" name="hobby" value="exer" /> 운동
	</li>
	<button type="button" id="submitbtn">전송하기</button>
</ul>
</form>
</body>
</html>