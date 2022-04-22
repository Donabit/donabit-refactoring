<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			//location.href="http://localhost:8089/challenge"
			$(document).ready(function () {
				$("#bbbb").on('click', function () {

					$.ajax({
						url: "/participate", // 호출할 주소
						data: {
							name: 'ajax'
						}, // 넘길 데이터
						type: 'post',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (data) { // 결과 받기
							alert(JSON.stringify(data));
							$("#bbbb").css("background-color", "red");
							$('h1').text('ajax 테스트');
						},// 요청 완료 시
						error: function (jqXHR) {
							console.log("실패입니다.");
						}// 요청 실패.
					});
				});
			});
		</script>
		<link rel="stylesheet" href="css/challenge.css">
		<script src="js/challenge.js" type="text/javascript"></script>
		<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Source+Sans+Pro&display=swap"
			rel="stylesheet">

		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<style>
				#bb {
					background-color: red;
				}

				#cc {
					background-color: blue;
				}
			</style>
	</head>

	<body>

		<%@ include file="/WEB-INF/views/main_header.jsp" %>

			<div class="stars-wrapper">
				<div id='stars'></div>
				<div id='stars2'></div>
				<div id='stars3'></div>
			</div>

			<div class="container">


				<div class="header">
					<input class="inputsearch" id="aaaa" onkeyup="serchFunction();" type="text" size="20">
					<button class="btnsearch" id="bbbb" onclick="serchFunction();" type="button">검색</button>
				</div>
				<div class="section">
					<div class="containerflex">



						<c:forEach items="${challengelist }" var="dto">
							<div class="item">
								<div class="chimg">
									<img class="img" src="/image/${dto.chimg }">
								</div>
								<div class="chdetail">
									<div>
										<span>${dto.chnum }</span> <span>${dto.chname }</span>
									</div>

									<div>경험치 : ${dto.chexp}</div>
									<div>개인성공조건 : ${dto.chsuccess }</div>
									<div>chsdate ${dto.chsdate}</div>
									<div>chedate ${dto.chedate}</div>
									<form action="/challengedetail/${dto.chnum }" method="get">


										<input type="submit" value="${dto.chnum }번 상세페이지"> <input type="hidden"
											name="chnumdetail" value="${dto.chnum }">
									</form>


								</div>
								<div class="chdetail2">

									<div>
										기부조건 : ${dto.checknum } / ${dto.chdonate }
										<div>
											<progress value="${dto.checknum }" max="${dto.chdonate }"></progress>
										</div>
									</div>

									<c:forEach items="${challcount }" var="dto2">

										<c:if test="${dto.chnum == dto2.chnum}">
											<div>
												최대모집 : ${dto2.nickname }/ ${dto.chmaxp}

												<div>
													<progress value="${dto2.nickname }" max="${dto.chmaxp}"></progress>
												</div>
												<c:if test="${dto2.nickname == dto.chmaxp}">
													<div>**참여불가**</div>
												</c:if>
											</div>
										</c:if>

									</c:forEach>


								</div>
							</div>
						</c:forEach>

					</div>
				</div>

			</div>
			<%@ include file="/WEB-INF/views/main_footer.jsp" %>

	</body>

	</html>