s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
   
   html,
   body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
     background-color: #f5f5f5;
   }
   
   .form-signin {
     width: 100%;
     max-width: 330px;
     padding: 15px;
     margin: auto;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }

</style>
</head>

<body class="text-center">
   <main class="form-signin">
      <form action="loginProcess" method="post">
         <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/310/310869.png" alt="" width="72" height="57">
         <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
         
         <%
		String err = request.getParameter("err");
		if("1".equals(err)){%>
		<div class="alert alert-danger" role="alert">
  			회원정보를 확인할 수 없습니다.
		</div>
		<%}%>

         
         <div class="form-floating">
            <input type="text" class="form-control" id="id" placeholder="아이디 입력..." name="id">
            <label for="id">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="pwd" placeholder="Password" name="pw">
            <label for="pwd">비밀번호</label>
         </div>
         
         
         <div class="checkbox mb-3">
            <label>
               <input type="checkbox" value="remember-me"> 아이디 저장
            </label>
            <label>
               <input type="checkbox" value="remember-me"> 비밀번호 저장
            </label>
         </div>
         <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
         <p class="mt-5 mb-3 text-muted">&copy; mimi</p>
      </form>
   </main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>