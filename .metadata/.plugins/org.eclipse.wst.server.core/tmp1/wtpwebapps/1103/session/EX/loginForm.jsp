<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
<h1>서블릿을 통한 로그인</h1>
<!-- 
	LoginProcess 또는 ./LoginProcess
	: 현재 페이지의 위치를 기준으로 경로를 호출
	/session/EX/LoginProcess
	
	
	/LoginProcess : 루트 경로를 기준으로
	/LoginProcess
	
	../LoginProcess : 상위 경로로 이동
	/session/LoginProcess
 -->
 
	<form action="LoginProcess" method="post" name="loginFrm">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <button type="submit" class="btn btn-primary" value="로그인하기">로그인하기</button>
    </form> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>