<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jstl 제어문을 통해 짝수/홀수 구하기</h1>
<c:set var="num" value="10"></c:set>
<c:set var="num1" value="11"></c:set>

<!-- 
	제어문에서 사용되는 속성
	test : if문에서 사용할 조건 지정
	var : 조건의 결과를 저장할 변수명
	scope : 변수가 저장될 영역
 -->
 <!-- 조건이 참일때만 실행됨 / else문장이 없음-->
<c:if test="${num mod 2 eq 0}" var="result" >
${num }은 짝수입니다.
</c:if>
<c:if test="${not result}">${num }은 홀수입니다.
</c:if>
<c:if test="${num1 mod 2 eq 0}" var="result1" >
${num1 }은 짝수입니다.
</c:if>
<c:if test="${not result1}">${num1 }은 홀수입니다.
</c:if>

<h2>문자열 비교와 else문장 만들기</h2>
<%
	String str = "JSP";
	pageContext.setAttribute("str", str);
%>
<c:set var = "str" value="JSP" />
<c:if test="${str eq 'JAVA' }" var="result">
	\${str eq 'JAVA' }
	문자열(\${str }) : ${str }은 'JAVA'와 같습니다.
</c:if>

<!-- not eq =>  ne -->
<c:if test="${str ne 'JAVA'}">
	\${str ne 'JAVA' }
	문자열 : ${str }은 'JAVA'와 다릅니다.
</c:if>

<h1>조건식 주의사항</h1>
<!-- el(표현언어)가 사용되지 않은 경우 -->
<c:if test="true" var="result5">
result5 : ${result5 }
</c:if>

<c:if test="false" var="result6">
result6 : ${result6 }
</c:if>
<!-- test에 숫자, 문자 입력시 false -->
<c:if test="100" var="result7">
result7 : ${result7 }
</c:if>
<c:if test="TruE" var="result8">
result8 : ${result8 }
</c:if>
<!-- 쌍따옴표 안에 공백이 있을때 -->
<c:if test="${true }  " var="result9">
result9 : ${result9 }
</c:if>



</body>
</html>