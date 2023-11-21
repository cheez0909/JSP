<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h2>import 태그</h2>
<!-- 
	현재 위치는 core폴더임 
	../ : 상위 폴더로 이동
-->
<hr>
<!-- 
	import : 외부파일을 현재 위치에 삽입
	
	url 	: 외부파일 파일 경로
	scope 	: 영역
	var 	: 변수명
			  변수명을 사용하면 선언과 삽입을 분리 할수 있습니다. 

선언과 삽입을 다르게 할 수 있음
변수로 먼저 해놓고 

 -->
 
 <h2>외부파일에 변수 넣기</h2>
 <!-- 쿼리스트링 or param태그 이용 -->
 <!-- var속성을 추가하게 되면 값을 넣어줘야 출력이 됨 -->
<c:import url="../inner/link.jsp?title1=제목" var="link">
	<c:param name="title">title입니다.</c:param>
</c:import>
<hr>
<%--c:import url="../inner/innerPage.jsp"></c:import--%>
 <!-- var속성을 추가하게 되면 값을 넣어줘야 출력이 됨 -->
${link }
<h1>iframe을 이용한 외부자원 삽입하기</h1>
<iframe src="https://storage.enuri.info/pic_upload/knowbox2/202307/122938349202307153473cdad-2238-4491-86b2-68d5e57f7426.jpeg" style="width:500px; height:500px;"></iframe>

<h2>out 태그 - EL표현언어를 출력합니다.</h2>
<!-- value 속성을 이용해서 값을 지정하고 태그 안에도 값을 넣은 경우
오류가 발생할 수 있다.
 -->
<c:set var="iTag">
	i태그는 <i>기울임</i>을 표현합니다.
</c:set>
<c:out value="${iTag }"></c:out><br>
<!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력 -->
<c:out value="${iTag }" escapeXml="false"></c:out><br>
<c:out value="${param.text }" default="값없음"></c:out><br>
<!-- 빈 문자열도 값으로 받아들임 -->
<c:out value="" default="빈 문자열"></c:out>


<h1>redirect</h1>
<!-- redirect : request 영역이 공유되지 않음 -->
<%--c:redirect url="../inner/innerPage.jsp?text=2"></c:redirect--%>

<%--
<c:redirect url="../inner/innerPage.jsp?text=2">
	<c:param name="title">제목</c:param>
</c:redirect>
--%>



</body>
</html>