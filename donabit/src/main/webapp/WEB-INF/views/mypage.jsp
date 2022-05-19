<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/main_header.jsp"%>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
</head>
<body>
<img class="mypagetitle" src="img/checktitle.svg">
<hr>
<div class="container">
	<div class="leftbox">
		<div class="profilebox">
			<div class="profile-wrapper">
				<c:choose>
					<c:when test="${principal.memberdto.avatar eq 'slime' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/slime1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/slime2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
								<img class=profileimg src="/img/slime3.jpg">
							</c:when>
							<c:otherwise>
								<img class=profileimg src="/img/slime3.jpg">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${principal.memberdto.avatar eq 'human' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/human1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/human2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
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

				<div class="nick-level-exp">
					<div class="nickname">${principal.memberdto.nickname}</div>
					<div class="level">Level : ${level}</div>
					<div class="exp">Exp : ${expsum}</div>
				</div>
			</div>

			<div class="listContainer">
				<a href="/makepc" class="setting"> 챌린지 만들기 </a>
				<a href="/updateform" class="setting"> 회원정보 수정하기	 </a> 
				<a href="/passwordmodifyform" class="setting"> 비밀번호 변경하기 </a>
				<a href="/deleteview" class="setting"> 회원 탈퇴하기 </a>
			</div>
		</div>
	</div>
	
	<div class="rightbox">
		<div class="scorebox">
			<div class="nowchallenge_title">참여중인 챌린지</div>
			<div class="nowchallenge_text">${mychallengecount}</div>
			<div class="v-line"></div>
			<div class="nowdonate_title">총<br>기부금액</div>
			<div class="nowdonate_text">${mydonate }</div>
		</div>

	<div class="challengebox">
		<div class="challengebox1">
			<div class="challengebox_title"> 참여중인 챌린지 </div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:forEach items="${participate}" var="dto">
							<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
							<!-- 오늘이 끝나는 날보다 앞일때 -->
							<c:if test="${edate > today}">
								<div class="swiper-slide">
									<div class="slidetext" style="cursor: pointer;" onclick="location.href='/checkmorning?chnum=${dto.chnum}';">
										<div class="slidename">${dto.chname}</div>
										<img src="/checkimage/${dto.chimg}" class="slideimg" width="150px" height="150px">
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- 네비게이션 -->
					<div class="swiper-button-next"></div>
					<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div>
					<!-- 이전 버튼 -->

					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
				</div>
		</div>
			
		<div class="challengebox2">
			<div class="challengebox_title"> 개설한 챌린지 </div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:forEach items="${makepc}" var="dto">
							<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
							<!-- 오늘이 끝나는 날보다 앞일때 -->
							<c:if test="${edate > today}">
								<div class="swiper-slide">
									<div class="slidetext" style="cursor: pointer;" onclick="location.href='/checkmorning?chnum=${dto.chnum}';">
										<div class="slidename">${dto.chname}</div>
										<img src="/checkimage/${dto.chimg}" class="slideimg" width="150px" height="150px">
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- 네비게이션 -->
					<div class="swiper-button-next"></div>
					<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div>
					<!-- 이전 버튼 -->

					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
				</div>
		</div>
		
		<div class="challengebox3">
			<div class="challengebox_title"> 획득한 챌린지 </div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach items="${badge}" var="dto2" varStatus="status">
							<c:choose>
								<c:when test="${dto2.count == dto2.chsuccess}">
									<div class="swiper-slide">
									<div class="slidetext" style="cursor: pointer;" onclick="location.href='/checkmorning?chnum=${dto2.chnum}';">
										<div id="badgename">${dto2.chname}</div>
										<img id="badgein" src="img/badge/SUCCESS.png" width="150px" height="150px">
									</div>
									</div>
								</c:when>
								<c:when test="${dto2.count < dto2.chsuccess}">
									<div class="swiper-slide">
									<div class="slidetext" style="cursor: pointer;" onclick="location.href='/checkmorning?chnum=${dto2.chnum}';">
										<div id="badgename">${dto2.chname}</div>
										<img id="badgein" src="img/badge/FAIL.png" width="150px" height="150px">
									</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
					<!-- 네비게이션 -->
					<div class="swiper-button-next"></div>
					<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div>
					<!-- 이전 버튼 -->

					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
					</div>
		</div>
		</div> <!-- challengebox end -->
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