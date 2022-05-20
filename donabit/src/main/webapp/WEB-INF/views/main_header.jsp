<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<head>
	<meta charset="UTF-8">
	<title>Donabit 습관을 기부하세요</title>
	<script src="jquery-3.6.0.min.js"></script>
	<script src="js/main_header.js" defer></script>
	<link rel="stylesheet" type="text/css" href="css/main_header.css">
	<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
</head>
<body> 
	<header> 
		<div class="header_container">
			<div class="logo_container">
				<a href="/main">
					<img src="/img/logo_m1.png" height="65px">
				</a>
			</div>
			<div class="menu_container">
				<ul class="menu">
					<li class="menu_nav">
						<a class="menu_title" href="/tutorial">튜토리얼</a>
					</li>
					<li class="menu_nav">
						<a class="menu_title" href="/challenge">챌린지</a>
					</li>
					<li class="menu_nav">
						<a class="menu_title" href="/checkcommunity">커뮤니티</a>
					</li>
					<li class="menu_nav">
						<a class="menu_title" href="/board/list">공지사항</a>
					</li>
				</ul>
			</div>
			<div class="login_container">
				<ul class="login">
					<sec:authorize access="isAnonymous()">		
						<li class="menu_nav">
							<a class="menu_title" href="/loginform">로그인</a>
						</li>
						<li class="menu_nav">
							<a class="menu_title" href="/joinform">회원가입</a>
						</li> 
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<li class="menu_nav">
							<a class="menu_title" href="/logout">로그아웃</a>
						</li>
						<li class="menu_nav">
							<a class="menu_title" href="/mypage">마이페이지</a>
						</li> 
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="menu_nav">
							<a class="menu_title" href="/logout">로그아웃</a>
						</li>
						<li class="menu_nav">
							<a class="menu_title" href="/admin">관리자페이지</a>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</header>
</body>