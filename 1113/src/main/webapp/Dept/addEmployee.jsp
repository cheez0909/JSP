<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>추가 페이지</h1>
<form action = "/addEmployee" method="post">
<ul>
<li>직원 번호 : <input type="text" name="id" /></li>
<li>직원 이름 : <input type="text" name="name" /></li>
<li>주민 번호: <input type="text" name="no" /></li>
<li>이메일 : <input type="email" name="email" /></li>
<li>전화번호 : <input type="text" name="number" /></li>
<li>직업 코드 : 
<select name="job_code">
<option value="J1">J1</option>
<option value="J2">J2</option>
<option value="J3">J3</option>
<option value="J4">J4</option>
<option value="J5">J5</option>
<option value="J6">J6</option>
<option value="J7">J7</option>
</select>
</li>
<li>부서 코드 : 
<select name="dept_code">
<option value="D1">D1</option>
<option value="D2">D2</option>
<option value="D3">D3</option>
<option value="D4">D4</option>
<option value="D5">D5</option>
<option value="D6">D6</option>
<option value="D7">D7</option>
<option value="D8">D8</option>
<option value="D9">D9</option>
</select>
</li>
<li>월급 : <input type="text" name="sal" /></li>
</ul>
<button type="submit">작성</button>
</form>
</body>
</html>