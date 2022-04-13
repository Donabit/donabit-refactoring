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

<header>

<nav class="mainbar">

<div class="mainbar_logo">
<div><a href=""><img src="/img/logo_m.png" height=100px></a></div>
</div>
		<ul class="mainbar_menu">
			<li><a href="">홈</a></li>
			<li><a href="tutorial.jsp">챌린지1</a></li>
			<li><a href="ch1.jsp">챌린지2</a></li>
			<li><a href="ch2.jsp">챌린지3</a></li>
			<li><a href="com.jsp">커뮤니티</a></li>
		</ul>
		
		<button type="button" onclick="location.href='loginForm.jsp'">로그인</button>
		
<!-- <div id="mainbar_login" onclick="location.href='loginForm.jsp'"><a href="loginForm.jsp">로그인</a>
|
<a href="../member/joinFrom.jsp">회원가입</a></div>
<div class="clear"></div> -->

</nav>
</header>

<!--
<nav class="mainbar">

	<div class="mainbar_logo">
	<div><a href=""><img src="/img/logo_m.png" height=100px></a></div>
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
-->

</body>
</html>
