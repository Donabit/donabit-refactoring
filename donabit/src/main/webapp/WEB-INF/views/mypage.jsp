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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">
.swiper-container {
	height:250px;
	width: 700px;
	border:1px solid red;
	border-radius:12px;
	box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex;
	align-items:center;
	justify-content:center;
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%;
}
</style>

</head>
<body>
${level }
${expsum }
<div class="boxes">
<div class="profilebox">
	<div class="profile-wrapper">
<c:choose>
	<c:when test = "${principal.memberdto.avatar eq 'slime' }">
		<c:choose>
			<c:when test = "${principal.memberdto.level eq '0'}">   
			<img class=profileimg src="/img/slime1.jpg">	
			</c:when>
			<c:when test = "${principal.memberdto.level eq '1'}">   
				<img class=profileimg src="/img/slime2.jpg">	
			</c:when>
			<c:when test = "${principal.memberdto.level eq '2'}">   
				<img class=profileimg src="/img/slime3.jpg">	
			</c:when>
			<c:otherwise>
				<img class=profileimg src="/img/slime3.jpg">
			</c:otherwise>
		</c:choose>
	</c:when>	
	<c:when test = "${principal.memberdto.avatar eq 'human' }">
		<c:choose>
			<c:when test = "${principal.memberdto.level eq '0'}">   
			<img class=profileimg src="/img/human1.jpg">	
			</c:when>
			<c:when test = "${principal.memberdto.level eq '1'}">   
				<img class=profileimg src="/img/human2.jpg">	
			</c:when>
			<c:when test = "${principal.memberdto.level eq '2'}">   
				<img class=profileimg src="/img/human3.jpg">	
			</c:when>
			<c:otherwise>
				<img class=profileimg src="/img/human3.jpg">
			</c:otherwise>
		</c:choose>
	</c:when>	
	<c:otherwise>
	<img class=profileimg src="/img/select.png">
	</c:otherwise>
</c:choose>

	</div>
	<div class="nick-level">
	<h1>${principal.memberdto.nickname}</h1>
	<h4>Level : ${principal.memberdto.level}</h4>
	</div>
	
	<div class="listContainer">
	<a href="/updateform" class="setting">
        <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext"><p>회원정보 수정하기</p><span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
    <a href="/passwordmodifyform" class="setting">
       <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext"><p>비밀번호 변경하기</p><span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
    <a href="/deleteview" class="setting">
      <div class="sicon"><img class="imgicon" src="/img/pig.svg"></div>
        <div class="stext"><p>회원 탈퇴하기</p><span class="circle"></span></div>
        <div class="sright"><img class="imgicon" src="/img/setting.jpg"></div>
    </a>
	
	</div>
	
</div>
<div class="challenge-box">
    <p>참여중인 챌린지</p> <div class="challenge-ing"> <div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
		<div class="swiper-slide" style="cursor: pointer;" onclick="location.href='/challenge';"><img src="/img/logo.png"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
		</div>
	</div>
    <p>획득한 뱃지</p> <div class="challenge-badge"> <button class="badge">뱃지 모으러가기</button> </div>
</div>
</div>

<script>
new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3,

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	loopFillGroupWithBlank : true,

	loop : true, // 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>


</body>
</html>