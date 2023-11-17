<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>폼 값 출력</h2>
이름 : <%=request.getParameter("name") %>
성별 : <%=request.getParameter("sex") %>
학력 : <%=request.getParameter("Education") %>
<hr>
이름 : ${param.name }
성별 : ${param.sex }
학력 : ${param.Education }
취미 : ${paramValues.hobby[0] }
${paramValues.hobby[1] }
${paramValues.hobby[2] }
${paramValues.hobby[3] }

</body>
</html>