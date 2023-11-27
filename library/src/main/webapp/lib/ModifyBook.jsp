<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../bootstrap.min.css" style="user-select: auto;">
<link rel="stylesheet" href="../bootstrap.css" style="user-select: auto;">


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


</head>
<body>

<form action="/Modify?no=${param.No }&pageNo=${param.pageNo}" method="post" name="modify">
<ul>
<li>No : <input type="text" name="no" value="${param.No }" disabled></li>
<li>TITLE : <input type="text" name="title" value="${param.Title }"></li>
<li>RENTYN :
<select name="yn">
<option value="Y" ${param.YN eq '대여중' ? 'selected' : ''}>Y</option>
<option value="N" ${param.YN eq '대여가능' ? 'selected' : ''}>N</option>
</select>
</li>
<li>AUTHOR : <input type="text" name="author" value="${param.Author }"></li>
<li><button type="submit" id="modifybtn" >수정</button></li>
</ul>
</form>

<div class="form-group" style="user-select: auto;">
  <label class="form-label mt-4" style="user-select: auto;">Input addons</label>
  <div class="form-group" style="user-select: auto;">
    <div class="input-group mb-3" style="user-select: auto;">
      <span class="input-group-text" style="user-select: auto;">$</span>
      <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" style="user-select: auto;">
      <span class="input-group-text" style="user-select: auto;">.00</span>
    </div>
    <div class="input-group mb-3" style="user-select: auto;">
      <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2" style="user-select: auto;">
      <button class="btn btn-primary" type="button" id="button-addon2" style="user-select: auto;">Button</button>
    </div>
  </div>
</div>

</body>
</html>