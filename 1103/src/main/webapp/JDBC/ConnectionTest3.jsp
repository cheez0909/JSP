<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JDBC테스트3</h1>
<%
	DBConnection dbconn = new DBConnection(application);
	dbconn.stmtl = dbconn.con.createStatement();
	
	String sql = "select sysdate from dual";
	dbconn.rs = dbconn.stmtl.executeQuery(sql);
	dbconn.rs.next();
	out.print(dbconn.rs.getString(1));
	dbconn.close();
	

%>
</body>
</html>