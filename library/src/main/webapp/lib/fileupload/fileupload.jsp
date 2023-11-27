<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>파일 업로드</h1>
<!-- 
	1. cos.jar 라이브러리 추가
	2. form 태그의 속성 설정
		- method : post
		- enctype : multipart.form-data
 -->
 
 <form method="post" enctype="multipart/form-data" action="/upload">
 	<p>작성자 : <input type="text" name="name" value="dani"></p>
 	<p>제목 : <input type="text" name="title" value="title"></p>
 	<p> 카테고리 :
 	
 	<input type="checkbox" name="category" value="해외">해외
 	<input type="checkbox" name="category" value="국내">국내
 	<input type="checkbox" name="category" value="잡지">잡지
 	<input type="checkbox" name="category" value="참고서">참고서
 	</p> 
 	<p>첨부파일 : <input type="file" name="attachedFile"></p>
 	<input type="submit" value="전송">
 </form>
</body>
</html>