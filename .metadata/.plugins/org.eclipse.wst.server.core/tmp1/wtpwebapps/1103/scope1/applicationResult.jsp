<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="com.momo.dto.Person"%>
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
<%

	// 어플리케이션은 널체크를 할 필요가 없음
	if(application.getAttribute("map")!=null){
		
		Map<String, Person> map = (Map<String, Person>) application.getAttribute("map");
		
		// 맵이 담겨진 데이터의 키값을 조회합니다.
		// keySet() : 키의 집합을 set타입으로 변환합니다.
		
		Set<String> keys = map.keySet();
		
		for(String key : keys){
			Person p = map.get(key);
			out.print(p + "<br>");
			// toString 메서드를 재정의 했기 때문에 출력할 수 있음
		} 
		
	} else {
		out.print("map이 존재하지 않습니다.");
	}

%>
</body>
</html>