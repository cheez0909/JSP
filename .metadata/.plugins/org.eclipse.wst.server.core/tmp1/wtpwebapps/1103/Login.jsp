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
	String userId = "dani";
	String userPwd = "1234";
	String checked_id ="";
	String checked_pwd="";
	
	userId = CookieManager.getCookieValue(request, "id");
	userPwd = CookieManager.getCookieValue(request, "pwd");
	checked_id = !"".equals(userId) ? "checked" : "";
	checked_pwd = !"".equals(userPwd) ? "checked" : "";
	
	
	/*
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie num : cookies){
			if(num.getName().equals("id")){
				userId = num.getValue();
				checked_id="checked";
			}
			if(num.getName().equals("pwd")){
				userPwd = num.getValue();
				checked_pwd="checked";
				break;
			}
		}
	}
	*/
	


%>
<form action="LoginAction.jsp" method="post">
<div class='loginbox'>
	<div id='login'>
		<input type="text" name="userid" id="userpw" placeholder='ID를 입력해주세요.' 
            				required="required" value="<%=userId%>"><br>
         <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required="required" value=<%=userPwd %>><br>
         <input type="checkbox" <%=checked_id%> name="save_check_id" value="Y">아이디 저장하기
         <input type="checkbox" <%=checked_pwd%> name="save_check_pwd" value="Y">비밀번호 저장하기<br>
     </div>
     
     <div id='button'>
        <input type="submit" value="로그인" name="login">
     </div>
</div>

<div id='info'>
	<a href="">회원가입</a>
	<a href="">ID찾기</a>
	<a href="">PW찾기</a>
</div> 
</form>
</body>
</html>