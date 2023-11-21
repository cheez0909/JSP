<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.odd{
		background-color: yellow;
	}




</style>
</head>
<body>
<!-- 일반 for문 형태의 ForEach문 -->
<!-- forEach 태그를 활용한 반복문
	begin : 시작값
	end : 종료값
	step : 증가값
	var : 변수
 -->
 <c:forEach begin="1" end="10" step="3" var="i">
 i : ${i } /
 </c:forEach>
 <!-- 
   varStatus 루프의 현재 상태를 알려주는 변수 이름  
   	current 	: var에 지정한 현재 루프의 변수값
   	index 		: var에 지정한 현재 루프의 인덱스값
   	count 		: 실제 반복횟수(1부터 시작)
   	first 		: 루프의 처음일때 true
   	last 		: 루프의 마지막일때 true
--> 
<!-- 일반 for문의 경우 current, index, var의 값이 동일하다.  -->
<table border="1">
 <c:forEach begin="1" end="5" var="i" varStatus="loop">
	 
	 <c:if test="${loop.first }">
	 <tr>
	 <td colspan="6"><button>글쓰기</button></td>
	 </tr>
	 </c:if>
 <tr>
 <td>i : ${i }</td>
 <td>loop.current : ${loop.current }</td>
 <td>loop.index : ${loop.index }</td>
 <td>loop.count : ${loop.count }</td>
 <td>loop.first : ${loop.first }</td>
 <td>loop.last : ${loop.last }</td>
 </tr>
 <c:if test="${loop.last }">
 	<tr>
	 <td colspan="6"><button>글쓰기</button></td>
	 </tr>
	 </c:if>
 </c:forEach>
</table>
<h2>1~100까지 정수 중 홀수의 합을 구해보자</h2>

<c:forEach begin="1" end="100" var="i">
	<c:if test="${i mod 2 eq 1 }">
	<c:set var="result" value="${result = result + i }"></c:set>
	</c:if>
</c:forEach>
${ result}
<c:set var="result1" value="${ result1 }"></c:set>
${result1 }

<h2>향상된 for문 형태의 forEach태그 </h2>
<%
	String[] rgba = {"red", "green", "blue", "black"};
	for(String color : rgba){
		out.print(color + "/");
	}
%>

<table border="1">
<c:forEach items="<%=rgba %>" var="color" varStatus="loop">
<c:set value='${loop.index mod 2 eq 1 ? "odd" : ""}' var="odd"></c:set>
<tr class="${odd }">
<td>color : ${color }</td>
 <td>loop.current : ${loop.current }</td>
 <td>loop.index : ${loop.index }</td>
 <td>loop.count : ${loop.count }</td>
 <td>loop.first : ${loop.first }</td>
 <td>loop.last : ${loop.last }</td>
</tr>
</c:forEach>
</table>


<hr>
<h1>List컬렉션 사용하기</h1>
<%
	List<BoardDTO> list = new ArrayList<>();
	list.add(new BoardDTO("1", "제목1", "내용1", "test", "2023-11-21", "0"));
	list.add(new BoardDTO("2", "제목2", "내용2", "test", "2023-11-21", "0"));
	list.add(new BoardDTO("3", "제목3", "내용3", "dani", "2023-11-21", "0"));
	list.add(new BoardDTO("4", "제목4", "내용4", "test", "2023-11-21", "0"));
	list.add(new BoardDTO("5", "제목5", "내용5", "dani", "2023-11-21", "0"));
%>
<!-- 
	컨트롤러를 통해서 화면을 출력할 경우, 내장객체의 영역에 저장해주고 있으므로
	따로 set하지 않아도 됨
 -->
<c:set var="list" value="<%=list %>"></c:set>
<ul>
<c:forEach var="n" items="${list }">
<li>제목 : ${n.title } / 내용 : ${n.content } / 작성자 : ${n.id } </li>
</c:forEach>
</ul>

<hr>

<h1>Map 컬렉션 이용하기</h1>
<%
	Map<Integer, BoardDTO> map = new HashMap<>();
	map.put(1, new BoardDTO("6", "제목6", "내용6", "test", "2023-11-21", "0"));
	map.put(2, new BoardDTO("7", "제목7", "내용7", "dani", "2023-11-21", "0"));
	map.put(3, new BoardDTO("8", "제목8", "내용8", "test", "2023-11-21", "0"));
	map.put(4, new BoardDTO("9", "제목9", "내용9", "dani", "2023-11-21", "0"));

%>
<c:set var="map" value="<%=map %>"></c:set>

<c:forEach var="n" items="${map }">
<c:if test="${n.key eq 4 }">
${n.value.title }
</c:if>
</c:forEach>

<hr>

<h1>forTokens 태그 사용</h1>
<!-- 
    	Token : 문법적으로 의미 있는 최소단위
    			구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복 합니다 
    	
    	items 	: 문자열(문자열만 사용가능)
    	delims 	: 구분자
    	var 	: 변수명
    	
     --> 
     
     <%
     	String rgb = "Red,Green,Blue,Black";
     
     %>
     
     <c:forTokens items="<%=rgb %>" delims="," var="color">
     <span style="color:${color}">${color }</span>
     </c:forTokens>

</body>
</html>