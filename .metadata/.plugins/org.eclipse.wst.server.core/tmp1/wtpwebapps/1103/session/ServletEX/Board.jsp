<%@page import="com.momo.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <style type="text/css">
   .well{
   margin-left:100px;
   margin-right:100px;}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

window.onload = function() {
	
	let logoutBtn = document.querySelector("#logout_button");
	
	if(logoutBtn!=null){
		logoutBtn.onclick = function(){
			alert("로그아웃합니다.");
			LoginForm.action = "/LogoutController";
			LoginForm.submit();
		};
	}
	
	
	let loginBtn = document.querySelector("#login_button");
	
	if(loginBtn!=null){
	loginBtn.addEventListener('click', function(){
		alert("로그인합니다")
		LoginForm.action = "Login.jsp";
		LoginForm.submit();
	});
}
}

</script>

</head>
<body>
<!-- 로그인 / 로그아웃 링크 보여주기
	세션에 user_id가 null이 아니라면 로그아웃 버튼
	null이면 로그인
 -->
 

	
	
<form name="LoginForm">
<div class="navbar" style="user-select: auto;">
    <div class="navbar-inner" style="user-select: auto;">
      <div class="container" style="width: auto; user-select: auto;">
        <a class="brand" href="Login.jsp" style="user-select: auto;">Board</a>
         <%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
	if(dto!=null){ %>
		<%=dto.getName() %> 님 환영합니다
		<button type="button" class="btn btn-dark" id="logout_button" style="user-select: auto;">로그아웃 하기</button>
	<%} else {%>
		<button type="button" class="btn btn-dark" id="login_button" style="user-select: auto;">로그인 하기</button>
	<%} %>
      </div>
    </div><!-- /navbar-inner -->
  </div>
</form>	
	

<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>일련번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
			<th>조회수</th>
            <th class="text-center">Action</th>
        </tr>
      </thead>
       <%
	if(request.getAttribute("boarddto")!=null){
		List<BoardDTO> dtos = ( List<BoardDTO> ) request.getAttribute("boarddto");
		for(BoardDTO num : dtos){%>
    <tr>
                <td><%=num.getNum() %></td>
                <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>&ids=<%=dto.getId()%>"><%=num.getTitle() %></a></td>
                <td><%=num.getId() %></td>
				<td><%=num.getPostdate() %></td>
				<td><%=num.getVisitcount() %></td>
                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
            </tr>
           <%} 
}%>

</table>
</div>
<script type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>