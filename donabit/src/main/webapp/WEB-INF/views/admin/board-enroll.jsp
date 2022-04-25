<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<style>
	.admin_main_container {
	    padding: 2em;
	    height: 66em;
	    background-color: whitesmoke;
	    overflow: hidden;
	}

	.admin_sidebar_list:nth-child(1){
		background-color: #FF85B3;
	}
	
	a[href="board-enroll"] {
		color: black;
	}
	
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
	<main class="admin_main_container">
        <h2 class="admin_main_header">공지사항 관리 &#x1F4E2 </h2>
        <br>
        <hr style="border: 1px solid black;">
        <br>
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
	</main>
</body>
</html>