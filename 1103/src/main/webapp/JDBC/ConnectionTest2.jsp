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

<h1>JDBC테스트2</h1>
<%
	DBConnection dbconn = new DBConnection(application.getInitParameter("driver"), application.getInitParameter("url"), application.getInitParameter("id"), application.getInitParameter("pw"));
	dbconn.stmtl = dbconn.con.createStatement();
	
	String sql = "select * from job";
	dbconn.rs = dbconn.stmtl.executeQuery(sql);
	List<Job> jobs = new ArrayList<>();
	while(dbconn.rs.next()){
		Job job = new Job();
		job.setJob_name(dbconn.rs.getString(1));
		job.setJob_code(dbconn.rs.getString(2));
	}
	
	
	dbconn.close();
	
	out.print("<br>" + "init param : " + application.getInitParameter("INIT_PARAM"));
	out.print("<br>" + "driver : " + application.getInitParameter("driver"));
	out.print("<br>" + "url : " + application.getInitParameter("url"));
	out.print("<br>" + "id : " + application.getInitParameter("id"));
	out.print("<br>" + "pw : " + application.getInitParameter("pw"));
%>
</body>
</html>