<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">
		<title>인증 커뮤니티</title>
		<script src="../jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			//spring security - ajax post 방식으로 요청시 추가
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function (e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});

			$(document).ready(function () {
				$(document).on("click", ".btn", function (event) {
					  let no = $(this).attr('idx');
				      console.log(no);
					$.ajax({
						url: "/likes", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid"+no).val() }, // 넘길 데이터
						type: 'post',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list);
							alert("좋아요 클릭");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});// ajax 

				});

			});
		</script>
		<link rel="stylesheet" href="css/ch-community.css">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<div class="containerflex">
				<c:forEach items="${checklist}" var="check" varStatus="status">
					<div class="item">
						<div class="img">
							<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
						</div>
						<div class="detail">
							<div class="title">${check.checktitle}</div>
							<div class="checkdesc">${check.checkdesc}</div>
							<div class="divbtn">
								<span>
									<div>${principal.memberdto.nickname}로그인</div>
									<div>${check.checkid } checkid</div>
									<small>${check.checktime}</small>
								</span>
								<c:if test="${empty principal.memberdto.nickname}">
									<i class="fa-solid fa-heart" style="color:rgb(255, 65, 65)">로그인x</i>
								</c:if>
								<c:set var="flg" value="true"/>
								<c:forEach items="${toggle}" var="toggle">
									<c:if test="${flg}">
										<c:choose>
										<c:when test="${toggle.checkid == check.checkid}">
											<i class="fa-solid fa-heart" style="color:rgb(255, 65, 65)">내가누른 좋아요</i>
										</c:when>
										<c:otherwise>
										
										<div class="btn" idx="${status.index}">
												<i class="fa-regular fa-heart" style="color:rgb(255, 65, 65)">내가안누른 좋아요</i>
											</div>
											<input type="hidden" id="nickname" name="nickname"
												value="${principal.memberdto.nickname}">
											<input type="hidden" idx= "${status.index}" id="checkid${status.index}"
												name="checkid" value="${check.checkid}">
												
											<c:set var="flg" value="false"/>
										</c:otherwise>
									</c:choose>
									</c:if>
								
								</c:forEach>



								<button id="report" type="button">신고</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

	</body>

	</html>