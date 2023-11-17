<%@page import="com.momo.dto.PageDTO"%>
<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="user-select: auto;">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1" style="user-select: auto;">
<link rel="stylesheet" href="../5/sketchy/bootstrap.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/bootstrap-icons/font/bootstrap-icons.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css" style="user-select: auto;">
<link rel="stylesheet" href="../_assets/css/custom.min.css" style="user-select: auto;">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-KGDJBEFF3W" style="user-select: auto;"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" rel="stylesheet">
</head>

    <style type="text/css">
    
   .well{
   
   margin-left:100px;
   margin-right:100px;
   }
 
 a{
 text-decoration-line: none;
 }

 


    </style>
    <script style="user-select: auto;">
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-KGDJBEFF3W');
    </script>
</head>



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
<body class style="user-select: auto;">

<script type="text/javascript">

</script>


<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="user-select: auto;">
    <div class="modal-content" style="user-select: auto;">
      <div class="modal-header" style="user-select: auto;">
        <h5 class="modal-title" style="user-select: auto;" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="user-select: auto;">
          <span aria-hidden="true" style="user-select: auto;"></span>
        </button>
      </div>
      <div class="modal-body" style="user-select: auto;">
        <p style="user-select: auto;">Modal body text goes here.</p>
      </div>
      <div class="modal-footer" style="user-select: auto;">
        <button type="button" class="btn btn-primary" style="user-select: auto;">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="user-select: auto;">Close</button>
      </div>
    </div>
  </div>
</div>
















<!-- 로그인 / 로그아웃 링크 보여주기
	세션에 user_id가 null이 아니라면 로그아웃 버튼
	null이면 로그인
 -->
	
	
	

	
	
	
<form name="LoginForm">
<div class="navbar" style="user-select: auto;">
    <div class="navbar-inner" style="user-select: auto;">
      <div class="container" style="width: auto; user-select: auto;">
        <a class="navbar-brand" href="/session/ServletEX/Login.jsp" style="user-select: auto;">Board</a>
         <%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
	if(dto!=null){ %>
		<%=dto.getName() %> &nbsp; welcome! &nbsp; &nbsp;
		<button type="button" class="btn btn-secondary my-2 my-sm-0" id="logout_button" style="user-select: auto;">logout</button>
	<%} else {%>
		<button type="button" class="btn btn-dark" id="login_button" style="user-select: auto;">login</button>
	<%} %>
      </div>
    </div><!-- /navbar-inner -->
  </div>
</form>	

<br/>
<br/>

<!-- 페이지 넘버 변수 -->
	<%
		PageDTO pages = null;
	if(request.getAttribute("page")!=null && !"".equals(request.getAttribute("page"))){
		pages = (PageDTO) request.getAttribute("page");
	} else{
		pages = new PageDTO(0, new Criteria());
	}
%>


<form>
<div class="well">
	<div class="header">
	<H2 style="float: left;">Board</H2>
		<% if(dto!=null){ %>
	<a href="/session/ServletEX/BoardWrite.jsp" style="float: right;"><button type="button" class="btn btn-info btn-xs" id="writebtn"><span class="glyphicon glyphicon-edit"></span>New</button></a>
		<%} %>
	</div>
    <table class="table">
      <thead>
        <tr>
          <th>No</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Date Created</th>
			<th>views</th>
        </tr>
      </thead>
       <%
		if(request.getAttribute("boarddto")!=null){
		List<BoardDTO> dtos = ( List<BoardDTO> ) request.getAttribute("boarddto");
		for(BoardDTO num : dtos){%>
    	<tr>
                <td><%=num.getNum() %></td>
                <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>&pageNo=<%=pages.getCriteria().getPageNo()%>"><%=num.getTitle() %></a></td>
                <%-- <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>&ids=<%=dto.getId()%>"><%=num.getTitle() %></a></td> --%>
                <td><%=num.getId() %></td>
				<td><%=num.getPostdate() %></td>
				<td><%=num.getVisitcount() %></td>
                
                <%--
                <td class="text-center">
        			if(dto.getId().equals(num.getId()))
        			{ 
        				out.print("<button id='deletebtn' class='btn btn-danger btn-xs'>del</button>");
        				out.print("<button id='deletebtn' class='btn btn-info btn-xs'>Edit</button>");
        			}
        			  </td>
                --%>
              
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
	<%--
		// out.print("=============================================================================");
		int endNo = 10;
		int startNo = 0;
		// 연산을 위해서 (올림처리를 위해)
		double pagePerBlock = 10.0;

		Criteria cri = new Criteria();
		// 전체 게시물 수
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
		// 끝번호 구하기 -> 전체페이지수 / 한페이지당개수 : 올림
		// 7페이지 요청 : 올림 (7/10.0) * 10 
		// 11페이지 요청 : 올림(11/10.0) * 10
		endNo = (int) (Math.ceil( cri.getPageNo() / pagePerBlock) * pagePerBlock);
		startNo = endNo - ((int) pagePerBlock - 1);
		
		// 페이지 블럭을 생성
		for(int i=startNo; i<=endNo; i++){
			out.print("<a href='/BoardList?pageNo="+i+"'>" + i + "</a>");
		}
	--%>

	<%--@ include file = "PageNavi.jsp" --%>





</form>

<div id = "pagination">
  <ul class="pagination justify-content-end" style="user-select: auto;">
    <li class="page-item <%= pages.isPrevious() ? "" : "disabled" %>" style="user-select: auto;">
      <a class="page-link" href="/boardList?pageNo=<%=pages.getCriteria().getPageNo() - 1%>" style="user-select: auto;">&laquo;</a>
    </li>
    
    <%
    	for(int i = pages.getPage_startNo(); i <= pages.getPage_endNo(); i++){
    %>
    <li class="page-item <%= pages.getCriteria().getPageNo() == i ? "active" : "" %>"" style="user-select: auto;">
      <a class="page-link" href="/boardList?pageNo=<%=i%>" style="user-select: auto;"><%=i%></a>
    </li>
     <%} %>
    
    <li class="page-item <%= pages.isNext() ? "" : "disabled" %>">
      <a class="page-link " href="/boardList?pageNo=<%=pages.getCriteria().getPageNo() + 1%>" style="user-select: auto;">&raquo;</a>
    </li>
  </ul>
</div>

</body>
</html>