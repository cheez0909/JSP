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
	String id = "dani";
	String err = request.getParameter("err");
	String saves ="";
	String pwd = "1234";
	
	if(err!=null){
		if("1".equals(err)){
			out.print("아이디 혹은 비밀번호를 확인해주세요");
		} else if("2".equals(err)){
			out.print("로그인에 실패하였습니다.");
		}
	}
	
	if(request.getParameter("id")!=null){
		id = request.getParameter("id");
	}
	
	if(request.getParameter("pwd")!=null){
		pwd = request.getParameter("pwd");
	}
	
	if(request.getParameter("saves")!=null){
		saves = request.getParameter("saves");
	}
%>

<form action="Login.jsp" method="post">
<h1><%=saves%></h1>

아이디 : <input type="text" name="id" value="<%=id %>" />
비밀번호 : <input type="password" name = "pwd" value="<%= pwd %>" />


<input type="checkbox" value="saveid" name="save" /> 아이디 저장
<input type="checkbox" value="savepwd" name="save" /> 비밀번호 저장
<button>전송</button>
</form>
</body>
</html>