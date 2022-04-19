<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>게시판 등록 페이지</title>

<script src="resources/jquery-3.6.0.min.js"></script>
 <script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="#.css">

<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
</head>
<body>

<h1>게시판 등록</h1>
<form action="/board/enroll" method="post">
    <div class="input_wrap">
        <label>Title</label>
        <input name="title">
    </div>
    <div class="input_wrap">
        <label>Content</label>
        <textarea rows="3" name="content"></textarea>
    </div>
    <div class="input_wrap">
        <label>Writer</label>
        <input name="writer">
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit" class="btn">등록</button>
</form>

</body>
</html>