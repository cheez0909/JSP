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
<h1>url 태그를 이용해서 링크 걸기</h1>
<!--
    	c:URL
    	지정한 경로와 매개변수를 이용해서 컨텍스트루트를 포함한 URL을 생성 합니다.
    	a태그의 href속성이나 form태그의 action속성에 이용할 수 있습니다.
    	
	    value 	: 경로
	    var 	: 변수명
	    
	    테스트 방법 : 서버에 컨텍스트루트를 지정하고 테스트 해보기
-->
<c:url var="url" value="/JSTL/core/Import.jsp">다른 파일 열기</c:url>
<a href="${url }">다른 페이지로 이동</a>

<c:url var="url2" value="/JSTL/inner/innerPage.jsp">다른 파일 열기</c:url>
<a href="${url2 }">외부 페이지로 이동</a>



<!-- 
	루트 페이지가 설정되어있을때
 -->
<c:set var = "root" value="<%=request.getContextPath() %>"></c:set>
<p>ContextPath : <%=request.getContextPath() %></p>
<a href="${root }/JSTL/core/Import.jsp">외부페이지로 바로가기 - request.getContextPath
</a>




<h1>예외처리</h1>
<!-- 
c:catch 태그
	예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달
 -->
 <%
 	int i=100;
 %>
 <c:catch var="msg">
 <%
 	int res = i/0;
 %>
 </c:catch>
 예외내용 : ${msg }

<h2>El표현언어에서 예외처리</h2>
<c:set var = "num" value="200" />
 <c:catch var="msg1">
${"str" + num }
 </c:catch>
 ${msg1 }


</body>
</html>