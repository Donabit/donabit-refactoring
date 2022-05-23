<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Donabit 습관을 기부하세요</title>
		<script src="jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			//location.href="http://localhost:8089/challenge"
			$(document).ready(function () {
			});
		</script>
		<script src="js/challenge.js" type="text/javascript"></script>
		<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
		<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<link rel="stylesheet" href="css/challenge.css">
				<style>
					@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Source+Sans+Pro&display=swap');
				</style>
				<script src="https://kit.fontawesome.com/392c986039.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<img id="challenge1" src="img/challenge/challenge11.svg">
			<div class="container">
				<div class="header"></div>
				<div class="section">
					<!-- 현재 시간을 가져옴 -->
					<c:set var="today" value="<%=new java.util.Date()%>" />
					<!-- 챌린지 리스트 -->
					<div class="filter_bar">
						<ul class="filter_bar_list">
							<li class="filter_bar_list_item">
								<a class="filter_bar_anchor" href="/challenge?order=ing">진행중</a>
							</li>
							<li class="filter_bar_list_item">
								<a class="filter_bar_anchor" href="/challenge?order=coming">오픈예정</a>
							</li>
							<li class="filter_bar_list_item">
								<a class="filter_bar_anchor" href="/challenge?order=end">완료</a>
							</li>
						</ul>
					</div>
					<form class="search_bar_keyword" action="/challenge">
						<input type="text" name="keyword" placeholder=" 챌린지명 자동완성" list="challenge-name"
							value="${param.keyword}" />
						<datalist id="challenge-name">
							<c:forEach items="${chnamelist}" var="list">
								<option value="${list.chname}">
							</c:forEach>
						</datalist>
						<input type="hidden" name="order" value="${param.order}" />
						<button id="search_btn" type="submit">검색</button>
					</form>
					<div class="containerflex">
						<c:forEach items="${challengelist }" var="dto">
							<div class="item">
								<div class="chimg">
									<img class="img" src="/image/${dto.chimg }">
								</div>
								<div class="chdetail">
									<div class="text1">
										<span>${dto.chname}</span>
										<c:if test="${dto.nickname == null}">
											<!-- 공식챌린지 -->
											<span>
												<i class="fa-solid fa-circle-check tooltip" id="admin_challenge">
													<span class="tooltiptext tooltip-top">공식 챌린지</span>
												</i>
											</span>
										</c:if>
									</div>
									<div class="text2">${dto.chsdate}~${dto.chedate}</div>
									<div class="text3">
										경험치
										<div class="text7">${dto.chexp} Point</div>
									</div>
									<div class="text4">
										성공조건
										<div class="text7">${dto.chsuccess} 회</div>
									</div>
									<c:if test="${dto.nickname == null}">
										<!-- 공식챌린지 -->
										<div class="text5">
											기부금액
											<div class="text7">
												<fmt:formatNumber value="${dto.donatepay}" pattern="#,###" />
												원
											</div>
										</div>
										<div class="text6">
											후원기업
											<div class="text7">${dto.donateco}</div>
										</div>
									</c:if>
									<c:if test="${dto.nickname != null}">
										<div class="text5">
											만든이
											<div class="text7">
												${dto.nickname}
											</div>
										</div>
									</c:if>
								</div>
								<!-- chdetail -->
								<div class="chdetail2">

									<div>
										기부조건 : ${dto.checknum } / ${dto.chdonate }
										<div>
											<progress value="${dto.checknum }" max="${dto.chdonate }"></progress>
										</div>
									</div>
									<div>
										최대모집 : ${dto.count }/ ${dto.chmaxp}
										<div>
											<progress value="${dto.count}" max="${dto.chmaxp}"></progress>
										</div>
									</div>

									<fmt:parseNumber value="${dto.count}" var="num" />
									<c:if test="${num < dto.chmaxp}">
										<div class="buttonout">
											<a href="/challenge/${dto.chnum}">
												<button class="button">상세보기</button>
											</a>
										</div>
									</c:if>
									<c:if test="${dto.count == dto.chmaxp}">
										<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
											<input class="button2" type="submit" value="최대인원">
											<input type="hidden" name="chnumdetail" value="${dto.chnum }">
										</form>
									</c:if>
								</div>
								<!-- chdetail2 -->
							</div>
						</c:forEach>
					</div>
					<div class="moreBtn_container">
						<button id="moreBtn">더보기</button>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/main_footer.jsp" %>

	</body>
	<script type="text/javascript">
		let lastNumber = $(".item").length;
		let objCount = 6;
		if (lastNumber < objCount) {
			$(".moreBtn_container").remove();
		}
		console.log(lastNumber);
		console.log("${param.order}");
		console.log("${param.keyword}");
		console.log("${param.mo}");


		let pageNum = 1;
		$("#moreBtn").on("click", function () {
			pageNum++;

			$.ajax({
				url: "/moreChallenge.do", // 호출할 주소
				data: {
					'order': "${param.order}",
					'keyword': "${param.keyword}",
					'pageNum': pageNum
				}, // 넘길 데이터
				type: 'get',
				dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
				success: function (list) { // 결과 받기
					console.log(list);
					let length = list.length;
					if (length < objCount) {
						$(".moreBtn_container").remove();
					}
					for (let i = 0; i < length; i++) {
						let result = "";
						result += "<div class='item'>";
						result += "<div class='chimg'>"
							+ "<img class='img' src='/image/" + list[i].chimg + "'></div>";
						result += "<div class='chdetail'>"
							+ "<div class='text1'><span>" + list[i].chname + "</span>";
						if (list[i].nickname == null) {
							result += "<span><i class='fa-solid fa-circle-check tooltip' id='admin_challenge'>"
								+ "<span class='tooltiptext tooltip-top'>공식 챌린지</span></i></span>";
						}
						result += "</div>"
							+ "<div class='text2'>" + list[i].chsdate + "~" + list[i].chedate + "</div>"
							+ "<div class='text3'>경험치<div class='text7'>" + list[i].chexp + " Point</div></div>";
						result += "<div class='text4'>성공조건	<div class='text7'>" + list[i].chsuccess + " 회</div></div>";
						result += "<div class='text5'>기부금액	<div class='text7'>" + list[i].donatepay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원</div></div>";
						result += "<div class='text6'>후원기업	<div class='text7'>" + list[i].donateco + "</div></div>";
						result += "</div>";
						result += "<div class='chdetail2'>"
							+ "<div>기부조건 : " + list[i].checknum + " / " + list[i].chdonate + "<div><progress value='" + list[i].checknum + "' max='" + list[i].chdonate + "'></progress></div></div>";
						result += "<div>최대모집 : " + list[i].count + " / " + list[i].chmaxp + "<div><progress value='" + list[i].count + "' max='" + list[i].chmaxp + "'></progress></div></div>";
						if (list[i].count == list[i].chmaxp) {
							result += "<div class='buttonout'><a href='/challenge/" + list[i].chnum + "'><button class='button2'>최대인원</button></a></div>"
						} else {
							result += "<div class='buttonout'><a href='/challenge/" + list[i].chnum + "'><button class='button'>상세보기</button></a></div>"
						}
						result += "</div>";

						$('.containerflex').append(result);
					}
				},// success
				error: function (jqXHR) {
					alert("failed");
				}// error
			});//totallikebefore ajax
		});

		console.log(lastNumber);

	</script>

	</html>