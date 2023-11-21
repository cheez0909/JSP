<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
	"submit"일 경우 기본 기능 -> 폼을 전송하는 기능
	유효성 검증이 필요할 경우가 있음
	validation 체크
 -->
 
<script type="text/javascript">
 window.onload = function(){
	 // alert('test');
	 submitbtn.addEventListener('click', function(){
			// alert('버튼이 클릭되었습니다.');
			// 기본 이벤트를 제거하는 함수
			// why? 폼에 버튼이 하나일경우 자동으로 submit되기 때문에
			// 기본 이벤트를 제거해야함
			console.log('event', event);
			event.preventDefault();
			console.log('기본이벤트를 제거하였습니다.');
			// 유효성검사
			let res = validateForm(testForm);
			if(res) {
				testForm.submit();
			}
	 });
 }
 
 /*
 	함수 정의
 	자바 : type 매개변수 명
 	자바스크립트 : function validateForm(매개변수)
 
 */
 function validateForm(form){
	// 유효성검사 validation check
	// 이름으로 속성값을 불러올 수 있음
	// 체크로직을 모두 통과했다면 서버에 요청, 체크로직을 통과하지 못했다면
	// 메세지 처리
	if( form.ko.value == ""){
		alert('국어점수를 입력하세요');
		form.ko.focus();
		return false;
	}else if(form.en.value == ""){
		alert('영어점수를 입력하세요');
		form.en.focus();
		return false;
	} else if(form.ma.value == ""){
		alert('수학점수를 입력하세요');
		form.ma.focus();
		return false;
	}else{
		alert('학점을 구합니다');
		return true;
	}
 }
 
</script>
</head>
<body>
<h1>다중 조건문</h1>
<p>홀짝 판단하기</p>
<!-- 변수선언 -->
<c:set var = "num" value="101" />

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${num mod 2 eq 0}">
	같음</c:when>
	<c:otherwise>다름</c:otherwise>
</c:choose>

<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<!-- form에 action을 주지 않은 경우, 동일한 페이지를 다시 요청합니다. -->
<form name = "testForm" method="post">
국어 점수 : <input type="text" name="ko" />
영어 점수 : <input type="text" name="en"/>
수학 점수 : <input type="text" name="ma"/>
<input type="button" id ="submitbtn" value="학점 구하기">
</form>

<ul>
<li>국어 점수 : ${param.ko }</li>
<li>영어 점수 : ${param.en }</li>
<li>수학 점수 : ${param.ma }</li>
<c:if test="${not ( empty param.ko or empty param.en or empty param.ma)}">
<li>평균점수 : 
<c:set var="avg" value="${(param.ko + param.en + param.ma) / 3 }" />
${avg }
</li>
<li> 학점 : 
<c:choose>
	<c:when test="${avg ge 90}">
	A</c:when>
	<c:when test="${avg ge 80}">
	B</c:when>
	<c:when test="${avg ge 70}">
	C</c:when>
	<c:when test="${avg ge 60}">
	D</c:when>
	<c:otherwise>재수강</c:otherwise>
</c:choose>
</li>
</c:if>
</ul>


<form name = "testForm1">
국어 점수 : <input type="text" name="ko" />
영어 점수 : <input type="text" name="en"/>
수학 점수 : <input type="text" name="ma"/>
<button onclick="return validateForm(testForm1);">전송</button>
</form>

<form name = "testForm2" onsubmit="return validateForm(testForm2);">
국어 점수 : <input type="text" name="ko" />
영어 점수 : <input type="text" name="en"/>
수학 점수 : <input type="text" name="ma"/>
<button>전송</button>
</form>


</body>
</html>