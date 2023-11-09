<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 
 <!-- 불러올 페이지 이기 때문에 오류나도 괜찮음 -->
 <ul>
 <li><%=page_str%></li>
 <li><%=page_int%></li> 
 <li><%=page_p.getName()%> </li> 
 <li><%=page_p.getAge()%> </li>  
 </ul>
 
 <!-- 오브젝트 객체에 투스트링 메서드가 내장되어있음 -->
 <ul>
 <li><%=pageContext.getAttribute("page")%></li>
 <li><%=pageContext.getAttribute("page_int")%></li> 
 <li><%=pageContext.getAttribute("pagePerson")%> </li>   
 </ul>
 
</body>
</html>