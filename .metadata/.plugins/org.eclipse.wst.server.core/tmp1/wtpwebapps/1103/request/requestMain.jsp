<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>

<body>

<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
<!-- method를 지정하지 않은 경우 -->

<p>
	<a href="RequestWebInfo.jsp?eng=Hello&han=안녕">GET 방식 요청</a>
</p>


<h2>2. 클라이언트의 요청 매개변수 읽기</h2>

<!-- post방식 일 경우 한글이 깨질 수 있음 -->
<!-- get방식 일 경우 한글 안깨짐  -->
<form action="RequestParameter.jsp" method="post">
	<!-- value & name 값은 속성으로 넘어감 -->
	
	아이디 : <input type="text" value="momo" name="id" />
	<br>
	성별 :<input type="radio" value="man" name="sex" /> 남
		<input type="radio" value="woman" name="sex" checked="checked" /> 여
	<br>
		<!-- 관심사항은 체크박스기 때문에 배열로 넘어감 -->
	관심사항 : <input type="checkbox" value="eco" name="favo" checked="true" /> 경제
		<input type="checkbox" value="pol" name="favo" /> 정치
		<input type="checkbox" value="ent" name="favo" /> 연예
		
	<br>
	자기소개 : <textarea rows="4" cols="30" name="intro">만나서 반갑습니다 잘부탁드려요!</textarea>
	
	<!-- form 내부에 button이 한 개 밖에 없는 경우 "submit"으로 사용됨 -->
	<button>전송</button>
</form>

<%@include file="requestHeader.jsp" %>

<h2><a href = "requestHeader.jsp">3. 요청 헤더 정보 출력하기</a></h2>

</body>
</html>