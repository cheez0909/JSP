
<%@page import="com.momo.el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	MyELClass myclass = new MyELClass();
	request.setAttribute("myclass", myclass);
%>

<h1>객체를 영역에 저장 후 메서드 호출 하기</h1>
<p>el 표현언어에서 사용하기 위해서는 내장 객체의 영역에 저장되어 있어야 한다</p>
<br> 123456-234567 : ${myclass.getGender("123456-234567") }
<br> 123456-12345678 : ${myclass.getGender("123456-12345678") }
<br> 123456777-234567 : ${myclass.getGender("123456777-234567") }
<br> 123456-3234567 : ${myclass.getGender("123456-3234567") }
<br> 123456-134567 : ${myclass.getGender("123456-134567") }
<br> 1234567892-34567 : ${myclass.getGender("1234567892-34567") }
<!-- getter 메서드를 이용해서 값을 출력함 -->


<h2>정적메서드 호출하기</h2>
<%
	request.setAttribute("response", response);

%>
response : ${response }
<br>CookieManager : ${CookieManager.makeCookie(response, "cookies", "el사용해본시다", 100)}

<h2>메서드 호출하기</h2>
${"123-123".replace("-", "") }
</body>
</html>