<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>List 컬렉션</h1>
<%
	// 리스트 생성
	List<Object> aList = new ArrayList<>();
	aList.add("문자열");
	aList.add(new Person("dani", 30));

	// 페이지 영역에 리스트 저장
	// EL 표현언ㅇ러를 사용하기 위해서 내장객체에 값이 저장되어있어야한다.
	pageContext.setAttribute("aList", aList);
%>
<h2>List 컬렉션</h2>
<br>${aList }
<br>${aList[0] }
<br>${aList[1].name }
<br>${aList[1].age }
<br>파라미터로 전달 받은 값 :${param.num }
<br>값이 없어도 오류가 발생하지 않음 : ${aList[2] }
<br> 영역을 지정하지 않아도 작은영역부터 탐색해서 있으면 출력한다.

<hr>

<h2>Map 컬렉션</h2>
<%
	// Map 선언
	Map<String, Integer> map = new HashMap<>();
	map.put("dani", 30);
	map.put("hong", 40);
	map.put("dog", 7);
	
	// 내장객체 어딘가에 저장해야함
	pageContext.setAttribute("map", map);
%>

<ul>
<li>${map['dani'] }</li>
<li>${map["dani"] }</li>
<li>\${map.dani }</li>
<li><%=map.get("dani") %></li>
<!-- 
	한글은 . 찍어서 불러올 수 없음
	"/"는 맵의 주석처리?

 -->
 <li>${map.hong }</li>
 
 
</ul>
</body>
</html>