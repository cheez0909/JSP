<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	Core 태그
	 : 변수선언, 조건문, 반복문등을 대체하는 태그를 제공
 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	set : 변수 선언(setAttribute()) 
	var : 변수명
	value : 값
	scope : 저장영역(디폴트 : page)
	

--%>

<c:set var="hi" value="안녕하세요" scope="request" />
<c:set var="food" value="${hi} 무슨 음식 좋아하세요?" />
<c:set var="date" value="<%=new Date()%>" />
<c:set var="betweenVar">값</c:set>

<h1>el을 이용해서 변수를 출력해봅시다.</h1>
<ul>
	<li>${hi }</li>
	<li>${food }</li>
	<li>${date }</li>
	<li>${betweenVar }</li>
</ul>

<hr>
<h2>자바빈즈 생성1 - 생성자를 이용</h2>
<c:set var="person" value='<%=new Person("GD", 25) %>' scope="request"></c:set>

<ul>
<li>${person.name}</li>
<li>${person.age}</li>
</ul>

<h2>자바빈즈 생성후 값을 변경하기</h2>
<c:set var="person1" value='<%=new Person("홍길동", 25) %>' scope="request"></c:set>
<ul>
<li>${person1 }</li>
<li>${person1.name }</li>
<li>${person1.age }</li>
</ul>
<!-- 
	자바빈즈 생성 후 값을 변경해보자
	target : 자바빈즈 변수명
	property : 자바빈즈 속성명(멤버변수명)
	value : 값 지정
 -->
 <c:set target="${person1}" property="name" value="권지용"></c:set>
 <c:set target="${person1}" property="age" value="30"></c:set>
 <ul>
 <p> 변경 후 </p>
 <li>${person1 }</li>
 <li>${person1.name }</li>
 <li>${person1.age }</li>
 </ul>
 
 
 <hr>
 <H2>List 컬렉션 이용하기</H2>
 <%
 	// 리스트 생성
 	ArrayList<Person> list = new ArrayList<>();
 	list.add(new Person("사람1", 20));
 	list.add(new Person("사람2", 30));
  %>
  
  <c:set var="list" value="<%=list %>"></c:set>
  <ul>
  <li>${list }</li>
  <li>${list[0] }</li>
  <li>${list[0].name }</li>
  <li>${list[0].age }</li>
  <li>${list[1] }</li>
  <li>${list[1].name }</li>
  <li>${list[1].age }</li>
  </ul>
  <hr>
  <!-- foreach구문으로 list 출력하기 -->
  <!-- list에서 하나씩 꺼내서 num(변수)에 저장함 -->
  <h2>forEach 구문 활용하기</h2>
  <c:forEach var="num" items="<%=list %>">
  <li>
  ${num }
  </li>
  <li>${num.name }</li>
	<li>${num.age }</li>
  </c:forEach>
  <hr>
  <h1>Map 컬렉션 이용하기</h1>
  <%
	// 맵으로 저장하면 이름으로 꺼내올 수 있음
	// 리스트의 경우 인덱스로 꺼내와야함
  	Map<String, Person> map = new HashMap<>();
  	map.put("person3", new Person("사람3", 40));
  	map.put("person4", new Person("사람4", 50));
  %>
  <!-- map은 변수로 선언만하고 영역에 저장하지 않았기 때문에 el문법으로 사용할 수 없음 -->
  <c:set var="personMap" value="<%=map %>"></c:set>
  <ul>
  <li>${personMap.person3 }</li>  
  <li>${personMap.person3.name }</li>  
  <li>${personMap.person3.age }</li>  
  <li>${personMap.person4 }</li>  
  <li>${personMap.person4.name }</li>  
  <li>${personMap.person4.age }</li>  
  </ul>
</body>
</html>