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
	alert('<%=request.getAttribute("msg") %>');
	
	if(<%=request.getAttribute("url")%>!=null){
	let url = '<%=request.getAttribute("url")%>';
	// 만약 url이 없다면 location.href = url
	// url로 이동
		location.href=url;
	} else{
		// 뒤로가기	
		// history.back();
		location.href='/boardList';
	}
}
</script>

</body>
</html>