<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<style>
div, form{
margin-left : 10px;
}
.alert{
	width : 300px;
	padding:10px;
	margin-top : 10px;
}
.login {
	text-align: right;
}

form {
width : 300px;
height: 450px;
}

input {
margin-bottom : 5px;
margin-top : 5px
}
</style>
<body>

<%
	String err = "";

	if("1".equals(request.getParameter("err"))){%>
	<div class="alert alert-danger" role="alert"><b>회원정보가 없습니다.</b></div>
	<%}
	if(err!=null){
		err = request.getParameter("err");
	}
%>
	<form action="LoginProcess.jsp" method="post" name="loginFrm" class="login"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <button type="submit" class="btn btn-primary" value="로그인하기">로그인하기</button>
    </form> 
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>