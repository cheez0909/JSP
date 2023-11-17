<%@page import="com.momo.dao.BoardDAO"%>
<%@page import="com.momo.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dto.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>UI card design css - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
body {
    margin:0;
    padding:0;
    font-family:sans-serif;
    background:#fbfbfb;
}
.card {
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    width:300px;
    min-height:500px;
    background:#fff;
    box-shadow:0 20px 50px rgba(0,0,0,.1);
    border-radius:10px;
    transition:0.5s;
}

.card .btn {
	display:inline-flex;
}
.card:hover {
    box-shadow:0 30px 70px rgba(0,0,0,.2);
}
.card .box {
    position:absolute;
    top:50%;
    left:0;
    transform:translateY(-50%);
    text-align:center;
    padding:20px;
    box-sizing:border-box;
    width:100%;
}
.card .box .img {
    width:120px;
    height:120px;
    margin:0 auto;
    border-radius:50%;
    overflow:hidden;
}
.card .box .img img {
    width:100%;
    height:100%;
}
.card .box h2 {
    font-size:20px;
    color:#262626;
    margin:20px auto;
}
.card .box h2 span {
    font-size:14px;
    background:#e91e63;
    color:#fff;
    display:inline-block;
    padding:4px 10px;
    border-radius:15px;
}
.card .box p {
    color:#262626;
}
.card .box span {
    display:inline-flex;
}
.card .box ul {
    margin:0;
    padding:0;
}
.card .box ul li {
    list-style:none;
    float:left;
}
.card .box ul li a {
    display:block;
    color:#aaa;
    margin:0 10px;
    font-size:20px;
    transition:0.5s;
    text-align:center;
}
.card .box ul li:hover a {
    color:#e91e63;
    transform:rotateY(360deg);
}

.card .btns {
	position: absolute;
    display:inline-flex;
    bottom: 8px;
    right : 8px;
}

.card .btns> #edit, #delete{
	margin-right : 5px;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
window.onload = function(){
	
	
	
	listBtn.onclick = function(){
		//location.href='/boardList';
		history.back();
	};
	
	
	
	
	let deletebtn = document.querySelector('#delete');
	
	if(deletebtn!=null){
		deletebtn.addEventListener('click', ()=>{
			// jsp를 단독으로 실행할 경우, 경로문제가 발생하지 않음(같은 경로에 있기 때문에)
			// 하지만 서블릿을 통해 들어오는 경우 경로문제가 발생할수 있어서
			// 루트경로부터 풀 경로를 적어주는 것이 오류가 발생하지 않음

			/* location.href='/session/ServletEX/deleteProcess.jsp?num= */ <%--=request.getParameter("num")--%> //';
			deleteFnc();
		});
		}
	// let edit = document.querySelector('#edit');
	
	//edit.onclick = function(){
	//	location.href='/boardList';
	//};
	
	
	//if(edit!=null){
	//	edit.addEventListener('click', ()=>{
			// jsp를 단독으로 실행할 경우, 경로문제가 발생하지 않음(같은 경로에 있기 때문에)
			// 하지만 서블릿을 통해 들어오는 경우 경로문제가 발생할수 있어서
			// 루트경로부터 풀 경로를 적어주는 것이 오류가 발생하지 않음
	//		location.href='/session/ServletEX/deleteProcess.jsp';
	//	});
	//	};
		
		function deleteFnc(){
			if(confirm("정말로 삭제하시겠습니까?")){
				// deletebtn.action="/delete";
				location.href='/deleteprocess?num=<%=request.getParameter("num")%>&pageNo=<%=request.getParameter("pageNo")%>';
				deletebtn.submit();
			} else{
				alert('취소 클릭');
			};
		};
		
}

</script>


</head>
<body>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="card">
		<button type="button" id="listBtn" class="btn btn-dark">리스트로 이동</button>
	<div class="btns">
		<button type="button" id="delete" class="btn btn-danger btn-xs">Del</button>
    	<button type="button" id="edit" class="btn btn-info btn-xs">Edit</button>
    </div>
    <div class="box">
        <div class="img">
            <img src="https://item.kakaocdn.net/do/b563e153db82fde06e1423472ccf192c960f4ab09fe6e38bae8c63030c9b37f9">
        </div>
<%
	if(request.getAttribute("boarddto")!=null){
		BoardDTO dtos = (BoardDTO) request.getAttribute("boarddto");
		%>
    			<h2><%=dtos.getTitle() %><br><span><%=dtos.getPostdate() %></span></h2>
    			<p> <%=dtos.getContent() %></p>
				<% } 
				else {
					out.print("(┬┬﹏┬┬)");
				}		
%>


		<span>
            <ul>
                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
        </span>
		
    </div>
    
</div>
</body>
</html>
