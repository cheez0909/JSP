<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
el 표현언어
- 4가지 내장영역 속성의 값 출력 
- 값이 null인 경우에도 오류가 발생하지 않음
- ${영역.속성} -> ${속성}
영역을 지정해주지 않은 경우 작은영영(page)부터 큰영역(application)까지 확인하여
값을 출력하기 때문에 속성의 이름이 중복되지 않는 경우라면 영역을 지정하지 않아도 문제가 발생하지 않는다.


	JSTL(JSP Standard Tag Library)
		JSP의 표준태그라이브러리를 이용하면 스크립틀릿을 사용하지 않고 태그를 사용하여 
		제어문, 반복문등을 사용 할 수 있습니다
		
		기본태그가 아닌 확장태그 이므로 사용하기 위해서는 별도의 라이브러리가 필요합니다.
		메이븐리파지토리로 접근하여 jstl-1.2.jar파일을 다운로드 받고 lib폴더에 추가합니다.
		
	JSTL 종류
		Core태그 		: 변수선언, 조건문/반복문, URL처리 
		접두어 		: c
		
		Formatting 태그 : 숫자, 날짜, 시간 포맷 지정
		접두어 		: fmt
		
	JSTL을 사용하기 방법
		1. 라이브러리 추가
		2. taglib 지시어 추가
	--%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>


<table border="1">
	<%for (int dan = 1; dan <=9; dan++) {%>
	<tr>
		<%for (int i = 2; i<=9; i++){ %>
		<td>
		<%=i %> * <%=dan %> = <%=dan * i %>
		</td>
		<%} %>
	</tr>
	<%} %>
</table>

<hr>

<table border ="1">
<c:forEach begin = "1" end = "9" var = "dan">
<tr>
<c:forEach begin = "2" end ="9" var ="i">
<td>
${i } * ${dan } = ${ i*dan }
</td>
</c:forEach>
</tr>
</c:forEach>
</table>



</body>
</html>