<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>

body {font-family: "Lato", sans-serif;}
.main-head{height: 150px;background: #FFF;}
.sidenav {height: 100%;background-color: #000;overflow-x: hidden;padding-top: 20px;}
.main {padding: 0px 10px;}
@media screen and (max-height: 450px) {.sidenav {padding-top: 15px;}}
@media screen and (max-width: 450px) {
	.login-form{margin-top: 10%;}
	.register-form{margin-top: 10%;}
}
@media screen and (min-width: 768px){
    .main{margin-left: 40%;}
	.sidenav{width: 40%;position: fixed;z-index: 1;top: 0;left: 0;}
    .login-form{margin-top: 80%;}
    .register-form{margin-top: 20%;}
}
.login-main-text{margin-top: 20%;padding: 60px;color: #fff;}
.login-main-text h2{font-weight: 300;}
.btn-black{background-color: #000 !important;color: #fff;}

</style>
</head>
<body>

<div class="sidenav">
 	<div class="login-main-text">
		<h2>Application<br> Login Page</h2>
		<p>Login or register from here to access.</p>
	</div>
</div>

<form action="login" method="post" name="loginFrm">
<div class="main">
	<div class="col-md-6 col-sm-12">
		<div class="login-form">
			
			<%
		String err = request.getParameter("err");
		if("1".equals(err)){%>
		<div class="alert alert-danger" role="alert">
  			회원정보를 확인할 수 없습니다.
		</div>
		<%}%>
				<div class="form-group">
					<label for="id">ID</label>
					<input type="text" id="id" class="form-control" placeholder="ID" name="id">
				</div>
				<div class="form-group">
					<label for="pw">Password</label>
					<input type="password" id="pw" class="form-control" placeholder="Password" name="pw">
				</div>
				
				<button type="submit" class="btn btn-black">Login</button>
		</div>
	</div>
</div>
</form>
</body>
</html>