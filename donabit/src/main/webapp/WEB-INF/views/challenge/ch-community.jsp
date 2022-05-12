<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">
		<title>Donabit 습관을 기부하세요</title>
		<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
		<script src="../jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				//팝업창 열기
				$('.trigger').click(function () {
					var idx = $(this).attr("idx");
					document.getElementById('modal' + idx).classList.toggle("show-modal");
					$('body').css({ overflow: 'hidden' });
				});
				//팝업창 닫기
				$('.close-button').click(function () {
					var idx = $(this).attr("idx");
					document.getElementById('modal' + idx).classList.toggle("show-modal");
					$('body').css({ overflow: 'visible' });
				});
			});
		</script>
		<script type="text/javascript">
			//spring security - ajax post 방식으로 요청시 추가
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function (e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});

			$(document)
				.ready(
					function () {
						/* 좋아요 클릭시 이벤트 */
						$(document)
							.on(
								"click",
								".likebeforebtn",
								function (event) {
									let no = $(this).attr('idx');
									console.log(no);
									/* 좋아요 아이콘 ajax */
									$
										.ajax({
											url: "/likesbefore", // 호출할 주소
											data: {
												'nickname': $(
													"#nickname")
													.val(),
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												console
													.log(list[no].checkid);
												var checkid = list[no].checkid;
												$(
													'#likebefore'
													+ no)
													.remove();
												$(
													"#likeafterbtn"
													+ no)
													.prepend(
														"<img id='likeafter" + no + "' src = 'img/like11.png' width = '25px'>");

											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});//likesbefore ajax

									/* 좋아요 수 ajax */
									$
										.ajax({
											url: "/totallikebefore", // 호출할 주소
											data: {
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												$('#totallike' + no)
													.remove();
												$('#likes' + no)
													.append(
														"<span class='likesu' id='totallike" + no + "'>"
														+ list
														+ "</span>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});//totallikebefore ajax
								});// likebeforebtn

						/* 좋아요 해제시 이벤트 */
						$(document)
							.on(
								"click",
								".likeafterbtn",
								function (event) {
									let no = $(this).attr('idx');
									console.log(no);
									/* 좋아요 아이콘 ajax */
									$
										.ajax({
											url: "/likesafter", // 호출할 주소
											data: {
												'nickname': $(
													"#nickname")
													.val(),
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												console.log(list);
												var checkid = list[no].checkid;

												$("#likeafter" + no)
													.remove();
												$(
													"#likebeforebtn"
													+ no)
													.prepend(
														"<img id='likebefore" + no + "' src = 'img/like22.png' width = '25px'>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});// ajax 

									/* 좋아요 수 ajax */
									$
										.ajax({
											url: "/totallikeafter", // 호출할 주소
											data: {
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												$('#totallike' + no)
													.remove();
												$('#likes' + no)
													.append(
														"<span class='likesu' id='totallike" + no + "'>"
														+ list
														+ "</span>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});//totallikebefore ajax
								});// likeafterbtn 
						/* ====================================================================================== */
						/* 신고 클릭시 이벤트 */
						$(document)
							.on(
								"click",
								".singobeforebtn",
								function (event) {
									let no = $(this).attr('idx');
									console.log(no);
									/* 신고 아이콘 ajax */
									$
										.ajax({
											url: "/singobefore", // 호출할 주소
											data: {
												'nickname': $(
													"#nickname")
													.val(),
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												console
													.log(list[no].checkid);
												var checkid = list[no].checkid;
												$(
													'#singobefore'
													+ no)
													.remove();
												$(
													"#singoafterbtn"
													+ no)
													.prepend(
														"<img id='singoafter" + no + "' src = 'img/singo11.png' width = '30px'>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});//likesbefore ajax

									/* 신고 수 ajax */
									$
										.ajax({
											url: "/totalsingobefore", // 호출할 주소
											data: {
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												$(
													'#totalsingo'
													+ no)
													.remove();
												$('#singo' + no)
													.append(
														"<span class='singosu' id='totalsingo" + no + "'>"
														+ list
														+ "</span>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});//totalsingobefore ajax
								});// singobeforebtn

						/* 신고 해제시 이벤트 */
						$(document)
							.on(
								"click",
								".singoafterbtn",
								function (event) {
									let no = $(this).attr('idx');
									console.log(no);
									/* 신고 아이콘 ajax */
									$
										.ajax({
											url: "/singoafter", // 호출할 주소
											data: {
												'nickname': $(
													"#nickname")
													.val(),
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												console.log(list);
												var checkid = list[no].checkid;

												$(
													"#singoafter"
													+ no)
													.remove();
												$(
													"#singobeforebtn"
													+ no)
													.prepend(
														"<img id='singobefore" + no + "' src = 'img/singo22.png' width = '30px'>");
											},// success
											error: function (jqXHR) {
												alert("failed");
											}// error
										});// ajax 

									/* 신고 수 ajax */
									$
										.ajax({
											url: "/totalsingoafter", // 호출할 주소
											data: {
												'checkid': $(
													"#checkid"
													+ no)
													.val()
											}, // 넘길 데이터
											type: 'get',
											dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
											success: function (list) { // 결과 받기
												$(
													'#totalsingo'
													+ no)
													.remove();
												$('#singo' + no)
													.append(
														"<span class='singosu' id='totalsingo" + no + "'>"
														+ list
														+ "</span>");
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
				<script src="js/ch-community.js" type="text/javascript"></script>
				<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<img id="coimg" src="img/challenge/community.svg">
			<div class="container">
				<div class="containerflex">
					<c:forEach items="${checklist}" var="check" varStatus="status">
						<div class="item">
							<!-- 닉네임 -->
							<div class="nicknameout">
								<div class="box" style="background: #ffffff;">
									<img class="avatar" src="img/challenge/avatar.jpg" width="25px">
								</div>
								<div class="nickname">${check.nickname }</div>
							</div>
							<!-- 인증 이미지 -->
							<div class="chimg">
								<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
							</div>
							<!-- detail -->
							<div class="detail">
								<!-- detail / 제목 -->
								<div class="title">${check.checktitle}</div>
								<!-- detail / 설명 -->
								<div class="checkdesc">${check.checkdesc}</div>
								<!-- detail / 시간 -->
								<div class="time">${check.checktime}</div>
								<!-- detail / 좋아요, 신고 버튼 -->
								<%@ include file="/WEB-INF/views/challenge/likereport.jsp" %>
									<!-- 팝업창 -->
									<%@ include file="/WEB-INF/views/challenge/popup.jsp" %>

							</div>
							<!-- detail -->
						</div>
						<!-- item -->
					</c:forEach>
				</div>
			</div>



			<%@ include file="/WEB-INF/views/main_footer.jsp" %>
	</body>

	</html>