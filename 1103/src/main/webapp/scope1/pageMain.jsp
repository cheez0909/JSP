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
<!-- 
	내장객체의 영역
		웹에서는 페이지(page)들이 모여 하나의 요청(request)를 처리하며
		요청들이 모여 하나의 세선(session)을,
		세션이 모여 하나의 어플리케이션(application)을 이룹니다.
		
		page영역 : 동일한 페이지에서만 공유
		request영역 : 하나의 요청에 의해 호출된 페이지 및 포워드 페이지
		session영역 : 클라이언트가 처음 웹브라우저로 접속한 후 웹부르우저를 닫을 때까지
		application영역 : 웹 어플리케이션(웺서버)가 종료될 때까지
 -->
 
 
 <h1>페이지 영역 속성 값</h1>
 
 <%
 
 	pageContext.setAttribute("page", "페이지 영역(스코프)");
 	pageContext.setAttribute("page_int", 10000);
 	
 	Person p = new Person("dani", 30);
 	pageContext.setAttribute("pagePerson", p);
 	
 	// 반환값이 Object이므로 형변환 필요
 	String page_str = pageContext.getAttribute("page").toString();
 	int page_int = (Integer) pageContext.getAttribute("page_int");
 	Person page_p = (Person) pageContext.getAttribute("pagePerson");
 %>
 
 <ul>
 <li><%=page_str%></li>
 <li><%=page_int%></li> 
 <li><%=page_p%></li> 
 <li><%=page_p.getName()%> </li> 
 <li><%=page_p.getAge()%> </li> 
 </ul>
 
 
 <h2>include된 파일에서 page 영역 읽어오기</h2>
  <p>include지시어로 감싼 JSP파일은 포함관계를 가지므로 같은 페이지이고, 페이지 영역이나 변수등이 공유된다.</p>
 <%@ include file="includePage.jsp" %>
 
 
 <h2>페이지 이동 후 page영역 읽어오기</h2>
 <!-- 페이지 요청 -->
 <!-- 링크 또는 form을 이용해서 페이지를 다시 요청하게 되면 페이지 영역이 초기화된다. -->
 <a href = "pageLocation.jsp">pageLocation</a>
 
  <h2>영역 속성 삭제</h2>
 <!-- 영역 속성 삭제 -->
 <!-- removeAttribute는 메서드 값이 없는 경우 오류를 발생하지 않는다.
 getAttribute 메서드는 값이 없는 경우 null을 반환한ㄷ.
  -->
 <%
 	pageContext.removeAttribute("page");
 %>
 
 <%=pageContext.getAttribute("page") %>
 
 
</body>


</html>