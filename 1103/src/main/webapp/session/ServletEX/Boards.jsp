<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	console.log('onload event==================');
	
	let logoutBtn = document.querySelector("#logoutBtn");
	if(logoutBtn!=null){
		login.action="/logoutController"
		login.submit();
	}
	
	let loginBtn = document.querySelector("#loginBtn");
	
	if(loginBtn != null){
		login.addEventListener('click', function(){
			login.action="Login.jsp"
				login.submit();
		});
	}
	
	
	
}
</script>
<!-- 
	로그인 여부를 체크
	로그인을 했을 때 = 세션에 userId가 저장되어 있으면
		- 로그아웃 버튼을 출력
	없으면
		- 로그인 버튼을 출력
 -->
 
 <!-- 
 
 	submit : form의 요소들을 파라메터로 가지고 서버에 요청
 	action : 서버에 요청할 url 주소
 	method : 요청 방식 (get : 조회용, post : 등록, 수정용)
 	
  -->
 
 <form action="" name="login">
 <%
 	// getAttribute의 반환 타입은 Object이므로 형변환이 필요하다.
 	// nullpointException을 방지하기 위해서 null체크를 진행
 	// 로그인 버튼이 나오려면 - 세션이 없어야 함
 	// 로그아웃 버튼이 나오려면 - 세션이 있는 상태
 	if(session.getAttribute("userId")!=null && !"".equals(session.getAttribute("userId").toString())){ %>
 		//로그인한 사용자 - 로그아웃 버튼 출력 -> 세션을 만료 시키고 로그인페이지로 이동
 		<button id="logoutBtn">로그아웃</button>
 	 <%} else { 
 		// 로그인하지 않은 사용자 - 로그인 버튼 출력 -> 로그인 페이지로 이동
 		%>
 		<button id="loginBtn">로그인</button>
 	<%}
 %>
 </form>
</body>
</html>