<%@page import="com.momo.dto.PageDTO"%>
<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html style="user-select: auto;">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1" style="user-select: auto;">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-KGDJBEFF3W" style="user-select: auto;"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" style="user-select: auto;">
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
	
	// select 요소의 옵션을 선택하는 방법
	let searchField = '${pages.criteria.searchField}'; // 왜 안나오지..
	console.log("searchField : ", searchField);
	let options = searchForm.searchField.options;
	
	for(let i=0; i<options.length; i++ ){
		options[i].removeAttribute("selected");
	}
		
		
	// select 요소의 옵션이 selected 속성을 부여
	for(let i=0; i<searchForm.searchField.options.length; i++){
		console.log(searchForm.searchField.options[i].value);
		if(searchForm.searchField.options[i].value==searchField){
			searchForm.searchField.options[i].setAttribute("selected", "selected")
		}
	}
	
	
}

/*
 *입력받은 페이지 번호로 이동합니다
 */
 
function goPage(pageNo){
	searchForm.pageNo.value=pageNo;
	searchForm.submit();
	// searchForm.action='/boardList';
	// location.href="/boardList";
}


 // 게시글의 넘버만 받아오면됨
 // 페이지 넘버는 이미 있음
function goDetail(num){
	// 파라미터로 넘어온 페이지번호를 searchForm에 pageNo에 입력
	searchForm.action='/session/ServletEX/detail';
	searchForm.num.value = num;
	searchForm.submit();
	// location.href="/boardList";
}

 // 폼을 전송(요청)한다
 function forSubmit(){
	 // 1. 폼을 선택 - 폼의 이름을 불러준다.
	 // 2. 폼 요소를 선택 - 폼.요소이름
	 searchForm.pageNo.value  = '페이지 번호';
	 
	 // 3. 폼 전송하기 - form의 action속성에 정의된 url을 요청한다.
	 // 폼안에 요소들을 파라미터로 서버에 전달
	 searchForm.submit();
	 
 }

<%--
searchForm.searchField.options.length -> 옵션의 개수
searchForm.searchField.options[0].value -> 첫번째 옵션 값
searchForm.searchField.options[2].setAttribute("selected", "selected") -> 옵션
searchForm.searchField.options -> 옵션 세부 사항
searchForm.searchField.options[2].removeAttribute("selected", "selected") -> 옵션 제거하기 
--%>
</script>

</head>
<body>


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





<!-- 페이지 넘버 변수 -->
	<%
		PageDTO pages = null;
	if(request.getAttribute("page")!=null && !"".equals(request.getAttribute("page"))){
		pages = (PageDTO) request.getAttribute("page");
	} else{
		pages = new PageDTO(0, new Criteria());
	}
%>






<!-- 로그인 / 로그아웃 링크 보여주기
	세션에 user_id가 null이 아니라면 로그아웃 버튼
	null이면 로그인
 -->
 
<%@ include file="Header.jsp" %>


<div class="navbar" style="user-select: auto;">
    
<div class="navbar-inner" style="user-select: auto;">
      <div class="container" style="width: auto; user-select: auto;">
        <a class="navbar-brand" href="/session/ServletEX/Login.jsp" style="user-select: auto;">Board</a>
		<form name="LoginForm">
        <c:if test="${empty sessionScope.userId }">
        <button type="button" class="btn btn-dark" id="login_button" style="user-select: auto;">login</button>
        </c:if>
        <c:if test="${not empty sessionScope.userId }">
        ${sessionScope.userId } &nbsp; welcome! &nbsp; &nbsp;
        <button type="button" class="btn btn-secondary my-2 my-sm-0" id="logout_button" style="user-select: auto;">logout</button>
        </c:if>
      	</form>
      </div>
    </div>    <!-- /navbar-inner -->
    
    <!-- 검색폼 : 테이블로 만들 수 있음-->
    <!--  페이지 번호 같이 넣어주기!!!! -->
    
      	<form name = "searchForm" class="d-flex" style="user-select: auto;" action="/boardList">
      	pageNo :<input type="text" name="pageNo" value="${param.pageNo }">
      	num : <input type="text" name = "num">
      	<select class="form-search me-sm-2" name = "searchField" id="exampleSelect1" style="user-select: auto;">
        <option value="title" ${pages.criteria.searchField eq 'title' ? 'selected' : ''}>제목</option>
        <option value="id" ${pages.criteria.searchField eq 'id' ? 'selected' : ''}>작성자</option>
        <option value="content" ${pages.criteria.searchField eq 'content' ? 'selected' : ''}>내용</option>
      	</select>
      	
        <input class="form-control me-sm-2" name = "searchWord" value = "${pages.criteria.searchWord}" type="search" placeholder="Search" style="user-select: auto;">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit" style="user-select: auto;">Search</button>
        </form>
  </div>








<form>
<div class="well">
	<div class="header">
	<H2 style="float: left;">Board</H2>
	<c:if test="${not empty dto }"  var="dto">
	<a href="/session/ServletEX/BoardWrite.jsp" style="float: right;"><button type="button" class="btn btn-info btn-xs" id="writebtn"><span class="glyphicon glyphicon-edit"></span>New</button></a>
	</c:if>
	</div>
	<%--  jstl 태그 이용하기
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <c:forEach items="${boarddto }" var="boarddtovar">
          ${boarddtovar.title } / ${boarddtovar.id }
          </c:forEach>
       --%>
</form>

 <%--
 <table width = "90%" align ="center">
  --%>
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
      
      <!-- 리스트가 비어있다면 데이터가 없습니다 출력 -->
      <!-- 리스트가 비어있지 않으면 목록을 출력 -->
      
      <c:if test="${empty boarddto}" var="result">
      no data
      </c:if>
      <c:if test="${not result }">
      <c:forEach var="num" items="${boarddto}">
      	<tr>
                <td>${num.num }</td>
                <td><a onclick="goDetail(${num.num})">${num.title }</a></td>
                <%-- <td><a href="/session/ServletEX/detail?num=<%=num.getNum()%>&ids=<%=dto.getId()%>"><%=num.getTitle() %></a></td> --%>
                <td>${num.id }</td>
				<td>${num.postdate }</td>
				<td>${num.visitcount }</td>
		</tr>
      </c:forEach>
      </c:if>
 

    
                
                <%--
                <td class="text-center">
        			if(dto.getId().equals(num.getId()))
        			{ 
        				out.print("<button id='deletebtn' class='btn btn-danger btn-xs'>del</button>");
        				out.print("<button id='deletebtn' class='btn btn-info btn-xs'>Edit</button>");
        			}
        			  </td>
                --%>
              
      

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





<!-- 

href = "..." 링크로 이동할 경우, 검색어가 유지되지 않는다
검색어를 유지하기 위해 searchForm을 전송하는 gopage함수를 생성하였다.

 -->

<div id = "pagination">
  <ul class="pagination justify-content-end" style="user-select: auto;">
    <li class="page-item <%= pages.isPrevious() ? "" : "disabled" %>" style="user-select: auto;">
      <a class="page-link" onclick="goPage(<%=pages.getCriteria().getPageNo() - 1%>)" style="user-select: auto;">&laquo;</a>
    </li>
    
    <%
    	for(int i = pages.getPage_startNo(); i <= pages.getPage_endNo(); i++){
    %>
    <li class="page-item <%= pages.getCriteria().getPageNo() == i ? "active" : "" %> style="user-select: auto;">
      <a class="page-link" onclick="goPage(<%=i %>)">
      <%=i%></a>
    </li>
     <%} %>
    
    <li class="page-item <%= pages.isNext() ? "" : "disabled" %>">
      <a class="page-link " onclick="goPage(<%=pages.getCriteria().getPageNo() +1%>)" style="user-select: auto;">&raquo;</a>
    </li>
  </ul>
</div>

</body>
</html>