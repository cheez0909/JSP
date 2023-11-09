
<%@page import="java.util.Arrays"%>
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

	// POST 방식 일 때 발생하는 한글 깨짐처리를 utf-8방식으로 인코딩함 
	// 필터로 처리함
	// 필터 : web.xml에 직접 작성 or 어노테이션
	request.setCharacterEncoding("UTF-8");

	// GET 방식
	// URL에서 타고 들어와서 한글이 안깨짐
	
	// POST 방식
	// 가드를 타고 들어오기 때문에 인코딩을 해주어야함 


	String id=request.getParameter("id");
	String sex=request.getParameter("sex");
	String favolist = "";
	// 체크박스 인 경우
	String[] favo= request.getParameterValues("favo");
	
	// 1. 반복문을 이용해서 하나씩 출력
	for(String favolist1 : favo){
		favolist += favolist1 + " ";
	}
	
	// for(int i=0; i<favo.length; i++){
	// 	favolist += favo[i] + " ";
	// }
	
	// 2. Arrays.toString()
	
	// out.print(Arrays.toString(favo));
	
	String intro = request.getParameter("intro");
%>


<ul>
<li>아이디 : <%= id %></li>
<li>성별 : <%= sex %></li>
<li>관심사항 : <%= favolist %></li>
<li>자기소개 : <%= intro %></li>
</ul>

</body>
</html>