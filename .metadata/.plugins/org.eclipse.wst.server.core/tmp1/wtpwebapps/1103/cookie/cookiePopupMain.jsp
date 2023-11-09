<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style> 
</head>
<body>

<h2>쿠키를 이용한 팝업창 제어 ver 1.0 </h2>

<script>
// window객체의 onload이벤트가 발생하면 html요소가 모두 생성된 상태에서 실행 
//(if window.onload = function(){}실행 안했을 때 : 생성되지 않은 상태에서 실행하면 undefined상태가 됨)
// 페이지를 모두 그리고 설명

window.onload = function(){
	
	// 팝업클로스 쿠키의 값이 'Y'면
	// 팝업창을 숨김처리 한다.
	
	<%
	
	//String value = CookieManager.getCookieValue(request, "popupClose");
	//if("Y".equals(value)){
		%>
		// 요소를 선택 후 화면에서 숨김처리
		//document.quertSelector("#popup").style.display='none';
		<%
	//}%>
	
	
	
	// 버튼에 이벤트 추가
	// 버튼의 id값
	closeBtn.onclick = function(){
		// alert('팝업창을 닫습니다.');
		
		// 체크박스가 체크되어 있으면 쿠키를 생성하는 페이지를 호출!
		// 체크박스가 선택되었습니다 메세지를 출력하세요.
		if(document.querySelector('#inactiveToday').checked){
			alert('하루동안 열리지 않습니다.');
			//location.href= "cookiePopupAction.jsp";
			
			// 서버 요청 방법
			// 1. href
			// 2. form submit
			// form의 요소들을 가지고 이동
			cookiePopup.submit();
		}
		popup.style.display='none';
	}
	

	
	//inactiveToday.onclick = function(){
	//	alert('체크박스가 선택되었습니다.');
	//}

	
}

	




</script>




<!-- 
	1. 닫기 버튼을 클릭하면 cookiePopupAction.jsp 파일을 호출
		- 쿠키를 생성
		
	2. 팝업닫힘쿠키가 생성이 되어 있다면, 더이상 팝업창을 보여주지 않도록 처리
 -->


<form action="cookiePopupAction.jsp" name="cookiePopup">

<%  
	// y가 아니면 보여줘
	String value = CookieManager.getCookieValue(request, "popupClose");
	if(!"Y".equals(value)){
		%>
	<div id="popup">
		<h2 align="center">공지사항 입니다.</h2>
		<div align="right">
		
			<input type="checkbox" name = "inactiveToday" id="inactiveToday" value="Y" checked />
			하루 동안 열지 않음
			<input type="button" value="닫기" id="closeBtn" />
		
		</div>
	</div>
	<%} %>
</form>

</body>
</html>