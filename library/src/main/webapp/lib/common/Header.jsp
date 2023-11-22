<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#logo>nav>ul>li{
	float : left;
	width : 15%;
	height: 30px;
	list-style : none;
}

.floatClear{
clear:both;
}
</style>
</head>
<body>
<!-- 메뉴, 로그인 정보 -->
<header id="logo">
<nav>
	<ul>
		<li>Home</li>
		<li>Board</li>
		<li>Contact</li>
		<li>Map</li>
	</ul>
</nav>
<form action="" method="post">
아이디 : <input type="text" name="id" />
비밀번호 : <input type="password" name="pw" />
<button>전송</button>
</form>
</header>
<hr class="floatClear">
</body>
</html>