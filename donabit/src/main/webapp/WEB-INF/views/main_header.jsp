<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit Main</title>

<script src="resources/jquery-3.6.0.min.js"></script>
 <script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="css/main_header.css">

<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>
	<nav class="mainbar">
		<div class="mainbar_logo">
			<a href="">Donabit</a>
		
		</div>
	
		<ul class="mainbar_menu">
			<li><a href="">튜토리얼</a></li>
			<li><a href="">챌린지1</a></li>
			<li><a href="">챌린지2</a></li>
			<li><a href="">챌린지3</a></li>
			<li><a href="">커뮤니티</a></li>
		</ul>
		
			<ul class="mainbar_login">
			<li><a href="">로그인</a></li>
			<li><a href="">회원가입</a></li>
		</ul>
		
	</nav>
</body>
</html>
