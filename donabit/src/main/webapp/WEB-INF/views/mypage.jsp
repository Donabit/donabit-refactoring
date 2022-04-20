<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/main_header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<div class="profilebox">
	<div class="profile-wrapper">
		<img src="/img/caticon1.jpg">		
	</div>
	<div class="nick-level">
	<h1>${principal.memberdto.nickname}</h1>
	<h3>Level : </h3>
	</div>
	
	<ul class="m-list">
	<li>
	<a href="/updateform">회원정보 수정하기</a><br>
	</li>
	<li>
	<a href="/passwordmodifyform">비밀번호 변경하기</a><br>
	</li>
	<li>
	<a href="/deleteview">회원 탈퇴하기</a>
	</li>	
	</ul>
	
</div>






</body>
</html>