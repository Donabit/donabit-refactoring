<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit Main</title>
<script src="/jquery-3.6.0.min.js"></script>
<script src="mybatis_spring.js" defer></script>
<link rel="stylesheet" type="text/css" href="../css/main_header.css">

<script type="text/javascript">
	$(document).ready(function(){

	});
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>

<body> 

<header> 
	<div class="header_container">
		<div class="logo_container">
		<a href="http://localhost:8089/main"><img src="/img/logo_m.png"></a>

</div>
	<div class="nav_container" id="nav_menu">
	<div class="menu_container">
		<ul class="menu">

	<li class="menu_1"><a class="menu_title" href="/tutorial">튜토리얼</a>
</li>

	<li class="menu_2"><a class="menu_title" href="/challenge">챌린지</a>
</li>

	<li class="menu_3"><a class="menu_title" href="/checkcommunity">커뮤니티</a>
</li>

	<li class="menu_4"><a class="menu_title" href="/board/list"> 공지사항 </a>
</li>

</ul>
</div>

		<div class="login_container">
		<ul class="login">
		
<sec:authorize access="isAnonymous()">		
	<li class="menu_login">
		<a class="menu_title" href="/loginform">로그인</a></li>
	<li class="menu_join"><a class="menu_title" href="/joinform">회원가입</a></li> 
</sec:authorize>
	
<sec:authorize access="hasRole('ROLE_USER')">
	<a class="menu_title" href="/logout">로그아웃</a></li>
	<li class="menu_mypage"><a class="menu_title" href="/mypage">마이페이지</a></li> 
</sec:authorize>
	
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a class="menu_title" href="/logout">로그아웃</a></li>
	<li class="menu_mypage"><a class="menu_title" href="/admin">관리자페이지</a></li>
</sec:authorize>
	
</ul>
</div>
</div>
</div>

<hr class="two">
</header>

<!-- <header>
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
		
<div id="mainbar_login" onclick="location.href='loginForm.jsp'"><a href="loginForm.jsp">로그인</a>
|
<a href="../member/joinFrom.jsp">회원가입</a></div>
<div class="clear"></div>

</nav>
</header> -->

</html>
