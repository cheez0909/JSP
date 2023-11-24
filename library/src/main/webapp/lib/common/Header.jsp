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
clear:none;
color :  red;
}
</style>
</head>
<body>

<%--
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
 --%>

<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark" style="user-select: auto;">
  <div class="container-fluid" style="user-select: auto;">
    <a class="navbar-brand" href="#" style="user-select: auto;">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="user-select: auto;">
      <span class="navbar-toggler-icon" style="user-select: auto;"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01" style="user-select: auto;">
      <ul class="navbar-nav me-auto" style="user-select: auto;">
        <li class="nav-item" style="user-select: auto;">
          <a class="nav-link active" href="#" style="user-select: auto;">Home
            <span class="visually-hidden" style="user-select: auto;">(current)</span>
          </a>
        </li>
        <li class="nav-item" style="user-select: auto;">
          <a class="nav-link" href="#" style="user-select: auto;">Features</a>
        </li>
        <li class="nav-item" style="user-select: auto;">
          <a class="nav-link" href="#" style="user-select: auto;">Pricing</a>
        </li>
        <li class="nav-item" style="user-select: auto;">
          <a class="nav-link" href="#" style="user-select: auto;">About</a>
        </li>
        <li class="nav-item dropdown" style="user-select: auto;">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="user-select: auto;">Dropdown</a>
          <div class="dropdown-menu" style="user-select: auto;">
            <a class="dropdown-item" href="#" style="user-select: auto;">Action</a>
            <a class="dropdown-item" href="#" style="user-select: auto;">Another action</a>
            <a class="dropdown-item" href="#" style="user-select: auto;">Something else here</a>
            <div class="dropdown-divider" style="user-select: auto;"></div>
            <a class="dropdown-item" href="#" style="user-select: auto;">Separated link</a>
          </div>
        </li>
      </ul>
      <div class="form-group" style="user-select: auto;">
      <form action="" method="post" style="align : center">
      <ul style="list-style: none; display: inline-block; padding: 0;">
      <li style="display: inline-block; margin-right: 10px;">	ID  </li>
     <li style="display: inline-block; margin-right: 10px;"> <input class="form-control me-sm-2" type="text" placeholder="ID" style="user-select: auto;" name="id"></li>
		 <li style="display: inline-block; margin-right: 10px;">비밀번호  </li>
		<li style="display: inline-block; margin-right: 10px;">  <input class="form-control me-sm-2" type="password" placeholder="pw" style="user-select: auto;" name="pw"></li>
		 <li style="display: inline-block; margin-right: 10px;"><button class="btn btn-primary" type="submit">로그인</button></li>
		</ul>
		</form>
		</div>

      
      
    </div>
  </div>
</nav>
<br>


</body>
</html>