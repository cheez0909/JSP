<%@page import="com.momo.dto.Criteria"%>
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
		// 경로 확인,,, 뒤돌아왔을때 안될수도 있음
		//LoginForm.action = "Login.jsp";
		LoginForm.action="/session/ServletEX/Login.jsp";
		LoginForm.submit();
	});
	}
	
	/* 취소버튼
	let deletebtn = document.querySelector("#deletebtn");
	
	if(deletebtn!=null){
	deletebtn.addEventListener('click', function(){
		deleteFnc();
	});
	}
	
	function deleteFnc(){
		alert('삭제버튼이 클릭되었습니다.');
		if(confirm("정말로 삭제하시겠습니까?")){
			deletebtn.action="/delete";
			// location.href="/delete";
			deletebtn.submit();
		} else{
			alert('취소 클릭');
		};
	}
	*/
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
        <a class="brand" href="/session/ServletEX/Login.jsp" style="user-select: auto;">Board</a>
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

<form>
<div class="well">
	<div class="header">
		<H2>게시물 조회</H2>
		<% if(dto!=null){ %>
		<a href="/session/ServletEX/BoardWrite.jsp"><button type="button" class="btn btn-info btn-xs" id="writebtn" style="user-select: auto;"><span class="glyphicon glyphicon-edit"></span>작성하기</button></a>
		<%} %>
		
	</div>
    <table class="table">
    	
      <thead>
        <tr>
          <th>일련번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
			<th>조회수</th>
        </tr>
      </thead>
       <%
		if(request.getAttribute("boarddto")!=null){
		List<BoardDTO> dtos = ( List<BoardDTO> ) request.getAttribute("boarddto");
		for(BoardDTO num : dtos){%>
    	<tr>
                <td><%=num.getNum() %></td>
                <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>"><%=num.getTitle() %></a></td>
                <%-- <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>&ids=<%=dto.getId()%>"><%=num.getTitle() %></a></td> --%>
                <td><%=num.getId() %></td>
				<td><%=num.getPostdate() %></td>
				<td><%=num.getVisitcount() %></td>
                <td class="text-center">
                <%--
        			if(dto.getId().equals(num.getId()))
        			{ 
        				out.print("<button id='deletebtn' class='btn btn-danger btn-xs'>del</button>");
        				out.print("<button id='deletebtn' class='btn btn-info btn-xs'>Edit</button>");
        			}
                --%>
                </td>
            </tr>
           <%
        }
}
%>
	</table>
	<!-- 
		페이지 네비게이션 작성
		- 페이지 번호
		- 페이지블럭당 페이지 수
		- 페이지블럭의 시작번호 ~ 페이지블럭의 끝번호
		
		총 게시물의 수 totalCnt
		- 페이지당 게시물의 수 amount
		진짜 블럭의 끝번호
	 -->
	<%
		out.print("=============================================================================");
		int endNo = 0;
		int startNo = 0;
		
		// 연산을 위해서 (올림처리를 위해)
		double pagePerBlock = 10.0;

		Criteria cri = new Criteria();
		int totalCnt = 0;
		
		if(request.getAttribute("page") != null && !"".equals(request.getAttribute("page"))){
			cri = (Criteria) request.getAttribute("page");
			out.print("요청페이지번호 - pageNo : " + cri.getPageNo());
			out.print("페이지당 게시물 수 - amout : " + cri.getAmount());
		} else{
			out.print("request.getAttribute('page')값이 없습니다");
		}
		
		if(request.getAttribute("totalCnt") != null && !"".equals(request.getAttribute("totalCnt"))){
			totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
			out.print("총 게시물의 수" + totalCnt);
		} else{
			out.print("request.getAttribute('totalCnt')값이 없습니다");
		}
		
		// 페이지 블럭의 시작 번호와 끝번호 구하기
		// 끝번호 구하기
		// 7페이지 요청 : 올림 (7/10.0) * 10 
		// 11페이지 요청 : 올림(11/10.0) * 10
		endNo = (int) (Math.ceil( cri.getPageNo() / pagePerBlock) * pagePerBlock);
		startNo = endNo - ((int) pagePerBlock - 1);
		
		// 페이지 블럭을 생성
		for(int i=startNo; i<=endNo; i++){
			out.print("<a href='/BoardList?pageNo="+i+"'>" + i + "</a>");
		}
	%>
</div>
</form>
<script type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>