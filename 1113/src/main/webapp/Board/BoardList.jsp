<%@page import="com.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border=1>
	<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성시간</th>
		<th>조회수</th>
		</tr>
	</thead>

		<%	
	if(request.getAttribute("List")!=null){
	List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("List");
	for(BoardDTO dto : list){ %>
		<tr>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getTitle() %></td>
			<td><%= dto.getContent() %></td>
			<td><%= dto.getId() %></td>
			<td><%= dto.getPostdate() %></td>
			<td><%= dto.getVisitcount() %></td>
		</tr>
					<%}
	}
	%>

	
	${requestScope.List }
	${requestScope.List[0] }
	${requestScope.List[1] }
	${requestScope.List[2] }
	${requestScope.List[3] }
	${requestScope.List[4] }

</table>
</body>
</html>