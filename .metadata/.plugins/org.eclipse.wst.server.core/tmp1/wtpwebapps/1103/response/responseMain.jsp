<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 객체</title>
</head>
<body>
<%
	// 에러값이 1이면 아이디 비밀번호 확인하는 메세지
	// id는 id의 입력칸에 사용자가 입력한 아이디를 출력
	
	String err = request.getParameter("loginErr");
	
	if(err!=null){
		String msg;
		if(err.equals("1")){
		msg = "아이디 혹은 비밀번호를 확인하세요<br>";
		out.print(msg);
		}
	}
	

	String id="momo";
	if(request.getParameter("id")!=null){
	id=request.getParameter("id");
	}
%>

<form action="responseLogin.jsp" method="post">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id" value="<%=id%>">

	<label for="pwd">비밀번호</label>
	<input type= "password" id="pwd" name="pwd" value="1234">
	<button>로그인</button>
	
	
</form>

<form action="responseHeader.jsp" method="get">
	<h2>응답 헤더 확인하기</h2>
	<button>응답헤더</button>
</form>

</body>
</html>