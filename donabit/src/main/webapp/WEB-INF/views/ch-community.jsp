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
				/* 좋아요 클릭시 이벤트 */
				$(document).on("click", ".likebeforebtn", function (event) {
					let no = $(this).attr('idx');
					console.log(no);
					/* 좋아요 아이콘 ajax */
					$.ajax({
						url: "/likesbefore", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list[no].checkid);
							var checkid = list[no].checkid;
							$('#likebefore' + no).remove();
							$("#likeafterbtn" + no).prepend("<img id='likeafter" + no + "' src = 'img/like11.png' width = '25px'>");

						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//likesbefore ajax

					/* 좋아요 수 ajax */
					$.ajax({
						url: "/totallikebefore", // 호출할 주소
						data: { 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totallike' + no).remove();
							$('#likes' + no).append("<span class='likesu' id='totallike" + no + "'>" + list + "</span>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totallikebefore ajax
				});// likebeforebtn

				/* 좋아요 해제시 이벤트 */
				$(document).on("click", ".likeafterbtn", function (event) {
					let no = $(this).attr('idx');
					console.log(no);
					/* 좋아요 아이콘 ajax */
					$.ajax({
						url: "/likesafter", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list);
							var checkid = list[no].checkid;

							$("#likeafter" + no).remove();
							$("#likebeforebtn" + no).prepend("<img id='likebefore" + no + "' src = 'img/like22.png' width = '25px'>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});// ajax 

					/* 좋아요 수 ajax */
					$.ajax({
						url: "/totallikeafter", // 호출할 주소
						data: { 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totallike' + no).remove();
							$('#likes' + no).append("<span class='likesu' id='totallike" + no + "'>" + list + "</span>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totallikebefore ajax
				});// likeafterbtn 
				/* ====================================================================================== */
				/* 신고 클릭시 이벤트 */
				$(document).on("click", ".singobeforebtn", function (event) {
					let no = $(this).attr('idx');
					console.log(no);
					/* 신고 아이콘 ajax */
					$.ajax({
						url: "/singobefore", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list[no].checkid);
							var checkid = list[no].checkid;
							$('#singobefore' + no).remove();
							$("#singoafterbtn" + no).prepend("<img id='singoafter" + no + "' src = 'img/singo11.png' width = '30px'>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//likesbefore ajax

					/* 신고 수 ajax */
					$.ajax({
						url: "/totalsingobefore", // 호출할 주소
						data: { 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totalsingo' + no).remove();
							$('#singo' + no).append("<span class='singosu' id='totalsingo" + no + "'>" + list + "</span>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totalsingobefore ajax
				});// singobeforebtn

				/* 신고 해제시 이벤트 */
				$(document).on("click", ".singoafterbtn", function (event) {
					let no = $(this).attr('idx');
					console.log(no);
					/* 신고 아이콘 ajax */
					$.ajax({
						url: "/singoafter", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list);
							var checkid = list[no].checkid;

							$("#singoafter" + no).remove();
							$("#singobeforebtn" + no).prepend("<img id='singobefore" + no + "' src = 'img/singo22.png' width = '30px'>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});// ajax 

					/* 신고 수 ajax */
					$.ajax({
						url: "/totalsingoafter", // 호출할 주소
						data: { 'checkid': $("#checkid" + no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totalsingo' + no).remove();
							$('#singo' + no).append("<span class='singosu' id='totalsingo" + no + "'>" + list + "</span>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totalsingobefore ajax */
				});// singoafterbtn 
			});// ready
		</script>
		<link rel="stylesheet" href="css/ch-community.css">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<img id="coimg" src="img/challenge/community.svg">
			<div class="container">
				<div class="containerflex">
					<c:forEach items="${checklist}" var="check" varStatus="status" end="19">
						<div class="item">
							<div class="nicknameout">
								<div class="box" style="background: #ffffff;">
									<img class="avatar" src="img/challenge/avatar.jpg" width="25px">
								</div>
								<div class="nickname"> ${check.nickname }</div>
							</div>
							<div class="chimg">
								<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
							</div>
							<div class="detail">
								<div class="title">${check.checktitle}</div>
								<div class="checkdesc">
									${check.checkdesc}
								</div>
								<div class="time">
									${check.checktime}
								</div>
								<div class="divbtn">
									<!-- 좋아요 -->
									<span id='likes${status.index}'>
										<!-- 로그인은 하지 않은 좋아요 상태 -->
										<span class="btn1">
											<c:if test="${empty principal.memberdto.nickname}">
												<img src="img/like11.png" width="25px">
											</c:if>
										</span>
										<!-- 좋아요 누른상태 -->
										<span class="likeafterbtn" id="likeafterbtn${status.index}"
											idx="${status.index}">
											<c:if test="${toggle[status.index] == 1}">
												<img id="likeafter${status.index}" src="img/like11.png" width="25px">
											</c:if>
										</span>
										<!-- 좋아요 해제상태 -->
										<span class="likebeforebtn" id="likebeforebtn${status.index}"
											idx="${status.index}">
											<c:if test="${toggle[status.index] == 0}">
												<img id="likebefore${status.index}" src="img/like22.png" width="25px">
											</c:if>
										</span>
										<!-- 좋아요 수 -->
										<span class="likesu" id="totallike${status.index}">
											${totallike[status.index]}
										</span>
									</span>
									<!--------------------------------------------------->
									<!-- 신고 -->
									<span id='singo${status.index}'>
										<!-- 로그인은 하지 않은 신고 상태 -->
										<span class="btn2">
											<c:if test="${empty principal.memberdto.nickname}">
												<img src="img/singo11.png" width="30px">
											</c:if>
										</span>
										<!-- 신고 후 -->
										<span class="singoafterbtn" id="singoafterbtn${status.index}"
											idx="${status.index}">
											<c:if test="${singo[status.index] == 1}">
												<img id="singoafter${status.index}" src="img/singo11.png" width="30px">
											</c:if>
										</span>
										<!-- 신고 전 -->
										<span class="singobeforebtn" id="singobeforebtn${status.index}"
											idx="${status.index}">
											<c:if test="${singo[status.index] == 0}">
												<img id="singobefore${status.index}" src="img/singo22.png" width="30px">
											</c:if>
										</span>

										<!-- 신고 수 -->
										<span class="singosu" id="totalsingo${status.index}">
											${totalsingo[status.index]}
										</span>

										<!-- <img src = "img/aa.png" width = "27px"> -->
									</span>


									<!--------------------------------------------------->
									<input type="hidden" id="nickname" name="nickname"
										value="${principal.memberdto.nickname}">
									<input type="hidden" idx="${status.index}" id="checkid${status.index}"
										name="checkid" value="${check.checkid}">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		<%@ include file="/WEB-INF/views/main_footer.jsp" %>
	</body>

	</html>