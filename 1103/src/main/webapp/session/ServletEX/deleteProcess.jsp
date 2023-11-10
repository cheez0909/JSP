<%@page import="com.momo.dao.BoardDAO"%>
<%@page import="com.momo.utils.JSFunction"%>
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
	if(request.getParameter("num")!=null){
		String num = request.getParameter("num").toString();
		BoardDAO dao = new BoardDAO();
		if(dao.deleteBoard(num)!=1){
			JSFunction.alertBack("존재하지 않는 게시글입니다.", out);
		}
	}else{
		// out.print("<script type='text/javascript'>");
		// out.print("alert('test');");
		// out.print("</script>");
		JSFunction.alertBack("게시물 번호를 확인할 수 없습니다", out);
	}
%>
</body>
</html>