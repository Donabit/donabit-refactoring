<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<!--  spring security - ajax post 방식으로 요청시 추가-->
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">
		<title>Donabit 습관을 기부하세요</title>
		<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
		<link rel="stylesheet" href="../css/challengedetail.css">
		<link rel="stylesheet" type="text/css" href="../css/main_header.css">
		<link rel="stylesheet" type="text/css" href="../css/main_footer.css">
		<script src="js/challenge.js" type="text/javascript"></script>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/challengedetail.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<!-- 챌린지 테이블 + 참가자수(checknum) -->
			<c:forEach items="${challengelist }" var="dto">
				<!-- 챌린지 번호와 챌린지페이지 번호가 같을때 -->
				<c:if test="${dto.chnum == chnumdetail}">
					<div class="container">
						<div class="head"></div>
						<div class="img">
							<img class="imgin" src="/image/${dto.chimg }" height="400px" width="400px">
						</div>
						<div class="info">
							<div class="infoimg">
							</div>
							<div class="infotitle1">성공조건</div>
							<div class="infotitle2">경험치</div>
							<div class="infotitle3">모집인원</div>
							<div class="infotitle4">후원기업</div>
							<div class="infotitle5">기부금액</div>
							<div class="infotitle6">기부조건</div>
							<div class="infotitle7">참여기간</div>
							
							<div class="infotitle8">조회수 : ${updateViewCount}</div>
							
							<div id="text1"> ${dto.chname }</div>
							<div id="text2">
								 ${dto.checknum } / ${dto.chdonate }
								<div>
									<progress id="text2-1" value="${dto.checknum }" max="${dto.chdonate }"></progress>
								</div>
							</div>
							<div id="text3">${dto.chsuccess } 회</div>
							<div id="text4">${dto.chexp} Point</div>
							<div id="text5">
								<fmt:formatNumber value="${dto.donatepay}" pattern="#,###" /> 원
							</div>

							<div id="text6"> ${dto.donateco}</div>
								<div>
									<!--모집 인원-->
									<div id=recruitdiv>
										<!-- ajax 적용하기 위해 2가지 경우로 나눠 놓음 -->
										<!-- 로그인 유저가 해당챌린지에 참가 했다면 -->
										<c:if test="${challnickname == 1}">
											<div id=recruitdivin2> ${dto.count } / ${dto.chmaxp}</div>
										</c:if>
										<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
										<c:if test="${challnickname == 0}">
											<div id=recruitdivin> ${dto.count } / ${dto.chmaxp}</div>
										</c:if>
										<!-- 로그아웃 상태 -->
										<c:if test="${challnickname == 2}">
											<div id=recruitdivin> ${dto.count } / ${dto.chmaxp}</div>
										</c:if>
									</div>
									<!--모집 인원 progress bar-->
									<div id=divprog>
										<!-- ajax 적용하기 위해 2가지 경우로 나눠 놓음 -->
										<!-- 로그인 유저가 해당챌린지에 참가 했다면 -->
										<c:if test="${challnickname == 1}">
											<progress id="recruitprog2" value="${dto.count}"
												max="${dto.chmaxp}"></progress>
										</c:if>
										<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
										<c:if test="${challnickname == 0}">
											<progress id="recruitprog" value="${dto2.count}"
												max="${dto.chmaxp}"></progress>
										</c:if>
										<!-- 로그아웃 상태 -->
										<c:if test="${challnickname == 2}">
											<progress id="recruitprog" value="${dto2.count}"
												max="${dto.chmaxp}"></progress>
										</c:if>
									</div>
								</div>
							<div id="text8">${dto.chsdate} ~ ${dto.chedate}</div>
							<!-- 참여하기 or 참여취소 -->
							<div id="participate">
								<!-- 로그아웃 상태 -->
								<c:if test="${challnickname == 2}">
									<button id='login' type='button'
										onclick="location.href='http://localhost:8089/loginform' ">로그인</button>
								</c:if>
								<!-- 로그인 유저가 해당챌린지에 참가 했다면 -->
								<c:if test="${challnickname == 1}">
									<button id='cancelbtn' type='button'>참가취소</button>
								</c:if>
									<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
									<c:if test="${challnickname == 0}">
										<!-- 참여인원 full일때 -->
										<fmt:parseNumber value="${dto.count}" var="num"/>
										<c:if test="${num == dto.chmaxp}">
											<button id="participatebtnx" type="button">최대인원</button>
										</c:if>
										<!-- 참여인원 full이 아닐때 -->
										<c:if test="${num < dto.chmaxp}">
											<button id="participatebtn" type="button">참가하기</button>
										</c:if>
									</c:if>
								<input type="hidden" id="chnumajax" name="chnumajax" value="${dto.chnum}">
								<!-- 추후 session -->
								<input type="hidden" id="nicknameajax" name="nicknameajax"
									value="${principal.memberdto.nickname}">
							</div> <!-- 참여하기 or 참여취소 -->
						</div> <!-- info -->
						<div class="description">
								<div class="descriptionin">${dto.chdesc}</div>
						</div>
						<div class="button" id="divbutton">
						</div> <!-- button-->
						<div class="footer">
						<div class="description2"></div ></div>
					</div> <!-- container -->
					<%@ include file="/WEB-INF/views/main_footer.jsp" %>
				</c:if> <!-- 챌린지 번호와 챌린지페이지 번호가 같을때 -->
			</c:forEach> <!-- 챌린지 테이블 + 참가자수(checknum) -->

	</html>