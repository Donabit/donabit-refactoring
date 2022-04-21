<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/main_header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<div class="boxes">
<div class="profilebox">
	<div class="profile-wrapper">
		<img class=profileimg src="/img/caticon1.jpg">		
	</div>
	<div class="nick-level">
	<h1>${principal.memberdto.nickname}</h1>
	<h3>Level : </h3>
	</div>
	
	<div class="listContainer">
	<a href="/updateform" class="setting">
        <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext">회원정보 수정하기<span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
    <a href="/passwordmodifyform" class="setting">
       <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext">비밀번호 변경하기<span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
    <a href="/deleteview" class="setting">
      <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext">회원 탈퇴하기<span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
	
	</div>
	
</div>
<div class="challenge-box">
    참여중인 챌린지 <div class="challenge-ing"> <a href="/challenge"><button class="go-challenge">챌린지 하러가기</button></a> </div>
    획득한 뱃지 <div class="challenge-badge"> <button class="badge">뱃지 모으러가기</button> </div>
</div>


</div>





</body>
</html>