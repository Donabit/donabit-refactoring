<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//location.href="http://localhost:8089/challenge"
	$(document).ready(function() {
	});
</script>
<script src="js/challenge.js" type="text/javascript"></script>
<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="css/challenge.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Source+Sans+Pro&display=swap');
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/main_header.jsp"%>
	<img id="challenge1" src="img/challenge/challenge11.svg">
	<div class="container">
		<div class="header"></div>
		<div class="section">
			<!-- 현재 시간을 가져옴 -->
			<c:set var="today" value="<%=new java.util.Date()%>" />
			<!-- 챌린지 리스트 -->
			<img class="titlesvg" src="img/challenge/title1.svg">
			<div class="containerflex">
				<c:forEach items="${challengelist }" var="dto">
					<!-- String을 date로 변환 -->
					<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
					<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
					<!-- 기부조건에 도달하지 않았을때 -->
					<c:if test="${dto.checknum != dto.chdonate}">
						<c:if test="${sdate < today}">
							<c:if test="${edate > today}">
								<div class="item">
									<div class="chimg">
										<img class="img" src="/image/${dto.chimg }">
									</div>
									<div class="chdetail">
										<div class="text1">${dto.chname }</div>
										<div class="text2">${dto.chsdate}~${dto.chedate}</div>
										<div class="text3">
											경험치
											<div class="text7">${dto.chexp} Point</div>
										</div>
										<div class="text4">
											성공조건
											<div class="text7">${dto.chsuccess} 회</div>
										</div>
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
									</div>
									<!-- chdetail -->
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
												</div>

												<fmt:parseNumber value="${dto2.nickname}" var="num" />
												<c:if test="${num < dto.chmaxp}">
													<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
														<input class="button" type="submit" value="상세보기"> <input type="hidden" name="chnumdetail" value="${dto.chnum }">
													</form>
												</c:if>
												<c:if test="${dto2.nickname == dto.chmaxp}">
													<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
														<input class="button2" type="submit" value="최대인원"> <input type="hidden" name="chnumdetail" value="${dto.chnum }">
													</form>
												</c:if>
											</c:if>
										</c:forEach>
									</div>
									<!-- chdetail2 -->
								</div>
								<!-- item -->
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<!-- containerflex -->
			<!-- ======================================================================== -->
			<img class="titlesvg" src="img/challenge/title2.svg">
			<div class="containerflex">
				<c:forEach items="${challengelist }" var="dto">
					<!-- String을 date로 변환 -->
					<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
					<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
					<!-- 기부조건에 도달하지 않았을때 -->
					<c:if test="${dto.checknum != dto.chdonate}">
						<c:if test="${sdate > today}">
							<div class="item">
								<div class="chimg">
									<img class="img" src="/image/${dto.chimg }">
								</div>
								<div class="chdetail">
									<div class="text1">${dto.chname }</div>
									<div class="text2">${dto.chsdate}~${dto.chedate}</div>
									<div class="text3">
										경험치
										<div class="text7">${dto.chexp}Point</div>
									</div>
									<div class="text4">
										성공조건
										<div class="text7">${dto.chsuccess }회</div>
									</div>
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
								</div>
								<!-- chdetail -->
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
											</div>

											<c:if test="${dto2.nickname < dto.chmaxp}">
												<form class="buttonout" action="">
													<input class="button" type="button" value="오픈예정">
												</form>
											</c:if>
											<c:if test="${dto2.nickname == dto.chmaxp}">
												<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
													<input class="button2" type="submit" value="최대인원"> <input type="hidden" name="chnumdetail" value="${dto.chnum }">
												</form>
											</c:if>
										</c:if>
									</c:forEach>
								</div>
								<!-- chdetail2 -->
							</div>
							<!-- item -->
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<!-- containerflex -->
			<!-- ======================================================================== -->
			<img class="titlesvg" src="img/challenge/title3.svg">
			<div class="containerflex">
				<c:forEach items="${challengelist }" var="dto">
					<!-- String을 date로 변환 -->
					<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
					<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
					<!-- 기부조건에 도달하지 않았을때 -->
					<c:if test="${dto.checknum == dto.chdonate}">
						<c:if test="${sdate < today}">
							<div class="item">
								<div class="chimg">
									<img class="img" src="/image/${dto.chimg }">
								</div>
								<div class="chdetail">
									<div class="text1">${dto.chname }</div>
									<div class="text2">${dto.chsdate}~${dto.chedate}</div>
									<div class="text3">
										경험치
										<div class="text7">${dto.chexp}Point</div>
									</div>
									<div class="text4">
										성공조건
										<div class="text7">${dto.chsuccess }회</div>
									</div>
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
								</div>
								<!-- chdetail -->
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
											</div>
											<c:if test="${dto2.nickname == dto.chmaxp}">
												<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
													<input class="button2" type="submit" value="최대인원"> <input type="hidden" name="chnumdetail" value="${dto.chnum }">
												</form>
											</c:if>
										</c:if>
									</c:forEach>
								</div>
								<!-- chdetail2 -->
							</div>
							<!-- item -->
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<!-- containerflex -->
			<hr>
			<!-- ======================================================================== -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/main_footer.jsp"%>

</body>

</html>