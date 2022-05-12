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
				<script src="../jquery-3.6.0.min.js"></script>
				<style>
				</style>
				<script type="text/javascript">

					//spring security - ajax post 방식으로 요청시 추가
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					$(document).ajaxSend(function (e, xhr, options) {
						xhr.setRequestHeader(header, token);
					});


					$(document).ready(function () {
						//참여하기 버튼 클릭시
						$(document).on("click", "#participatebtn", function () {
							//$("#participatebtn").click(function () {
							$.ajax({
								url: "/participate", // 호출할 주소
								data: { 'chnumajax': $("#chnumajax").val(), 'nickname': $("#nicknameajax").val() }, // 넘길 데이터
								type: 'get',
								dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
								success: function (list) { // 결과 받기
									console.log(list);
									console.log(list[0].chnum);
									console.log(list[0].nickname);
									var chmaxp = list[0].chmaxp;
									var nickname2 = list[0].nickname2;
									$('#participatebtn').remove();
									$('#recruitprog').remove();
									$('#recruitdivin').remove();
									$("#participate").prepend("<button id ='cancelbtn' type='button'>참가취소</button>");
									$("#divprog").prepend("<progress id='recruitprog2' value='" + nickname2 + "' max='" + chmaxp + "'></progress>");
									$("#recruitdiv").prepend("<div id = recruitdivin2 > " + nickname2 + " / " + chmaxp + "</div>");
									$("#zzz").load("/challengedetail.jsp");
									alert("참가완료");

								},// success
								error: function (jqXHR) {
									alert("failed");
								}// error
							});// ajax
						});//participatebtn click

						//취소하기 버튼 클릭시
						$(document).on("click", "#cancelbtn", function () {
							var con_test = confirm("주의, 해당 챌린지의 경험치와 인증 정보가 리셋됩니다. \n취소하시겠습니까?");
							if (con_test == true) {
								$.ajax({
									url: "/cancel", // 호출할 주소
									data: { 'chnumajax': $("#chnumajax").val(), 'nickname': $("#nicknameajax").val() }, // 넘길 데이터
									type: 'get',
									dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
									success: function (list) { // 결과 받기
										console.log('취소');
										console.log(list);
										console.log(list[0].chnum);
										var chnum = list[0].chnum;
										var chmaxp = list[0].chmaxp;
										var nickname2 = list[0].nickname2;

										$('#cancelbtn').remove();
										$('#recruitprog2').remove();
										$('#recruitdivin2').remove();
										$('#chnumajax').remove();
										$("#participate").prepend("<button id='participatebtn' type='button'>참가하기</button>");
										if (nickname2 == null) {
											$("#recruitdiv").prepend("<div id = recruitdivin > 0 / " + chmaxp + "</div>");
										} else {
											$("#recruitdiv").prepend("<div id = recruitdivin >  " + nickname2 + " / " + chmaxp + "</div>");
										}
										$("#divprog").prepend("<progress id='recruitprog' value='" + nickname2 + "' max='" + chmaxp + "'></progress>");
										$("#participate").prepend("<input type='hidden' id='chnumajax' name='chnumajax' value='" + chnum + "'>");
										// 
										alert("취소완료");
									},// success
									error: function (jqXHR) {
										alert("failed");
									}// error
								});// ajax
							}// confirm true
							else if (con_test == false) {
							}// confirm false
						});// cancelbtn click
					});// ready
				</script>
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
							<!-- 챌린지 전체참여 인원과 참여중인 챌린지번호 리스트 -->
							<c:forEach items="${challcount }" var="dto2">
								<!-- 현재 챌린지 번호같은 챌린지의 전체참여 인원 -->
								<c:if test="${dto.chnum == dto2.chnum}">
									<div>
										<!--모집 인원-->
										<div id=recruitdiv>
											<!-- ajax 적용하기 위해 2가지 경우로 나눠 놓음 -->
											<!-- 로그인 유저가 해당챌린지에 참가 했다면 -->
											<c:if test="${challnickname == 1}">
												<div id=recruitdivin2> ${dto2.nickname } / ${dto.chmaxp}</div>
											</c:if>
											<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
											<c:if test="${challnickname == 0}">
												<div id=recruitdivin> ${dto2.nickname } / ${dto.chmaxp}</div>
											</c:if>
											<!-- 로그아웃 상태 -->
											<c:if test="${challnickname == 2}">
												<div id=recruitdivin> ${dto2.nickname } / ${dto.chmaxp}</div>
											</c:if>
										</div>
										<!--모집 인원 progress bar-->
										<div id=divprog>
											<!-- ajax 적용하기 위해 2가지 경우로 나눠 놓음 -->
											<!-- 로그인 유저가 해당챌린지에 참가 했다면 -->
											<c:if test="${challnickname == 1}">
												<progress id="recruitprog2" value="${dto2.nickname }"
													max="${dto.chmaxp}"></progress>
											</c:if>
											<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
											<c:if test="${challnickname == 0}">
												<progress id="recruitprog" value="${dto2.nickname }"
													max="${dto.chmaxp}"></progress>
											</c:if>
											<!-- 로그아웃 상태 -->
											<c:if test="${challnickname == 2}">
												<progress id="recruitprog" value="${dto2.nickname }"
													max="${dto.chmaxp}"></progress>
											</c:if>
										</div>
									</div>
								</c:if> <!-- 현재 챌린지 번호같은 챌린지의 전체참여 인원 -->
							</c:forEach> <!-- 챌린지 전체참여 인원과 참여중인 챌린지번호 리스트 -->
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
								<!-- 챌린지 전체참여 인원과 참여중인 챌린지번호 리스트 -->
								<c:forEach items="${challcount }" var="dto2">
									<!-- 현재 챌린지 번호같은 챌린지 -->
									<c:if test="${dto.chnum == dto2.chnum}">
										<!-- 로그인 유저가 해당챌린지에 참가 하지 않았다면 -->
										<c:if test="${challnickname == 0}">
											<!-- 참여인원 full일때 -->
											<fmt:parseNumber value="${dto2.nickname}" var="num"/>
											<c:if test="${num == dto.chmaxp}">
												<button id="participatebtnx" type="button">최대인원</button>
											</c:if>
											<!-- 참여인원 full이 아닐때 -->
											<c:if test="${num < dto.chmaxp}">
												<button id="participatebtn" type="button">참가하기</button>
											</c:if>
										</c:if>
									</c:if>
								</c:forEach>
								<input type="hidden" id="chnumajax" name="chnumajax" value="${dto.chnum}">
								<!-- 추후 session -->
								<input type="hidden" id="nicknameajax" name="nicknameajax"
									value="${principal.memberdto.nickname}">
							</div> <!-- 참여하기 or 참여취소 -->
						</div> <!-- info -->
						<div class="description">
								<div class="descriptionin">${dto.chdesc }</div>
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