<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .none{display: none;}
    .w30{width : 30px;}
</style> 

<script type="text/javascript">
	// alert("none");

	// popup
	// id로접근 말고 선택자 이용하기
	// document.quertSelector("선택자");
	// 선택자 -> .클래스 #아이디 태그
	
	// document.querySelector("#popup")
	// document.querySelectorAll(".none")
	// document.querySelectorAll(".none")[1].style.display="block";
	// document.quertSelector("#popup").
	// 화면에서 숨김처리
	// popup.style.display = 'none';
	// 화면에서 출력
	
	
	/*
		querySelector : 요소를 하나 선택
		querySelectorAll 
			- 여러개의 요소를 선택할 때 사용
			- nodeList를 반환하며 리스트와 같이 방번호([0])를 이용해 접근이 가능하다.
	
	*/
	
	window.onload = function(){
	
		// 화면에 출력
		
		<%
		String display = "";
		if("Y".equals(CookieManager.getCookieValue(request, "popupClose"))){
		%>	
		 document.querySelector("#popup").style.display = '<%=display%>';
		 <%}
		 else{%>
			// 보여줘
			<% display = "block";%>
			document.querySelector("#popup").style.display =  '<%=display%>';
		<%}%>
		
		document.getElementById("closeBtn").onclick=function(){
			// 체크박스가 체크 되었을 때 쿠키 전송
			// document.querySelector("input[id=inactiveToday]")
			// 속성을 알고 싶을 땐 대괄호 안에
			// document.querySelector("input[id=inactiveToday]:checked")
			//document.querySelector("input[id=inactiveToday]").checked
			if(document.querySelector("input[id=inactiveToday]:checked")){
				
				
				// 서버에 페이지를 요청 
				// document.getElementById("form").submit();
			
				// 비동기통신으로 데이터만 가져옴
				fetch('cookiePopupAction1.jsp')
				.then((response) => response.json())
				.then((data) => {
					console.log(data.json);
					document.querySelector("#popup").style.display = '';
				});
				console.log('fetch를 이용하여 서버에 cookieAction.jsp페이지를 요청');                                                              
			}
			// 그렇지 않으면 닫기
			document.querySelector("#popup").style.display = '';
		}
	}
</script>

</head>
<body>
<h2>쿠키를 이용한 팝업창 제어 ver 2.0</h2>
<%
	String none = "none";
	String str = "안녕하세요";
%>

<!-- 
	변수 선언 후에 사용 -> <%=none%>
	변수 선언하지 않고 사용 -> <%="none"%>
	태그에 속성을 정의 할 때, 홀따옴표 또는 쌍따옴표로 감싸 주는 것은
	해당 속성의 값이 어디까지인지를 정의하는 것

	class속성 값에 여러개를 정의할 수 있음
	class = "none w30"
 -->

<h2 class="<%=none%>">쿠키 - 팝업 연습</h2>

<form action="cookiePopupAction1.jsp" name="cookiePopup" id="form">
	<div id="popup" class="<%=none%>">
		<h2 align="center">공지사항 입니다.</h2>
		<div align="right">
			<input type="checkbox" name = "inactiveToday" id="inactiveToday" value="Y" checked />
			하루 동안 열지 않음
			<input type="button" value="닫기" id="closeBtn" />
		</div>
	</div>
</form>



</body>
</html>