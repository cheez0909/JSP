<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//String id = request.getParameter("userid");
	//String pwd = request.getParameter("userpw");
	//if("dani".equals(id) && "1234".equals(pwd)){
	//	out.print("로그인 성공!");
	//}else{
%>
<!-- 
<script type="text/javascript">
	alert('id/pw를 확인해주세요'); // 팝업창
	history.go(-1); // 페이지이동
</script>
 -->
<%
	//}
%>

<%
	String id = request.getParameter("userid");
	String pwd = request.getParameter("userpw");
	
	// save_check값이 null이 아니라면
	// 체크박스는 값이 선택된 경우에만 넘어온다.
	if(request.getParameter("save_check_id")!=null){
		CookieManager.makeCookie(response, "id", id, 3600);
		//Cookie save_id = new Cookie("id", id);
		//save_id.setMaxAge(3600);
		//response.addCookie(save_id);
		out.print("아이디를 쿠키에 저장했습니다<br>");
	
		if(request.getParameter("save_check_pwd")!=null){
			Cookie save_pwd = new Cookie("pwd", pwd);
			save_pwd.setMaxAge(3600);
			response.addCookie(save_pwd); // response에 쿠키를 담아서 request에서 get할 수 있다. 
			out.print("비밀번호를를 쿠키에 저장했습니다<br>");
		} 	
	}
	
	
	//쿠키의 이름이 내가 생각한 것과 같다면 밸류값을 가져온다.
	//out.print(CookieManager.getCookieValue(request, "id"));
	//out.print(CookieManager.getCookieValue(request, "pwd"));
	
	//Cookie[] cookies = request.getCookies();
	//String save_id ="";
	//if(cookies!=null){
	//	for(Cookie num : cookies){
	//		if(num.getName().equals("id")){
	//			out.print("쿠키에 저장된 ID : " + num.getValue() + "<br>");
	//		}
	//		if(num.getName().equals("pwd")){
	//			out.print("쿠키에 저장된 ID : " + num.getValue() + "<br>");
	//		}
	//	}
	//}
	
	
	if("danis".equals(id) && "1234".equals(pwd)){
		out.print("로그인 성공!");
	} else {
		String script = 
			"<script type='text/javascript'>" +
			"alert('id/pw를 확인해주세요');" +
			"history.go(-1);" +
			"</script>";
		out.print(script);
	}
%>
</body>
</html>