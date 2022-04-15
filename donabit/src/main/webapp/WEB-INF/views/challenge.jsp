<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>
	<!-- 추가 -->

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
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

			<div class="container">

				<div class="header">
					<h2 style="display: inline">
						<a href="http://localhost:8089/checkmorning">checkmorning /</a>
					</h2>
					<h2 style="display: inline">
						<a href="http://localhost:8089/main">main /</a>
					</h2>
					<h2 style="display: inline">
						<a href="http://localhost:8089/admin/make-a-challenge">make-a-challenge
							/</a>
					</h2>
					<h2 style="display: inline">
						<a href="http://localhost:8089/admin/challenge-list">challenge-list</a>
					</h2>
					<h1></h1>
					<input class="inputsearch" id="aaaa" onkeyup="serchFunction();" type="text" size="20">
					<button class="btnsearch" id="bbbb" onclick="serchFunction();" type="button">검색</button>
				</div>
				<div class="section">
					<div class="containerflex">



						<c:forEach items="${challengelist }" var="dto">
							<div class="item">
								<div class="chimg">
									<img src="/image/${dto.chimg }" height="200px" width="auto">
								</div>
								<div class="chdetail">
									<div>챌린지 번호 : ${dto.chnum }</div>
									<div>챌린지 명 : ${dto.chname }</div>
									<div>
										기부조건 : ${dto.checknum } / ${dto.chdonate }
										<div>
											<progress value="${dto.checknum }" max="${dto.chdonate }"></progress>
										</div>
									</div>

									<div>개인성공조건 : ${dto.chsuccess }</div>
									<div>이미지 :${dto.chimg }</div>
									<form action="/challengedetail/${dto.chnum }" method="post">
										<input type="submit" value="${dto.chnum }번 상세페이지">
										<input type="hidden" name="chnumdetail" value="${dto.chnum }">
									</form>


								</div>
								<div class="chdetail2">

									<div>경험치 : ${dto.chexp}</div>

									<c:forEach items="${challcount }" var="dto2">

										<c:if test="${dto.chnum == dto2.chnum}">
											<div>
												최대모집 : ${dto2.nickname }/ ${dto.chmaxp}
												<div>
													<progress value="${dto2.nickname }" max="${dto.chmaxp}"></progress>
												</div>
											</div>
										</c:if>

									</c:forEach>
									<div>chsdate ${dto.chsdate}</div>
									<div>chedate ${dto.chedate}</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>

			</div>
			<%@ include file="/WEB-INF/views/main_footer.jsp" %>

	</body>

	</html>