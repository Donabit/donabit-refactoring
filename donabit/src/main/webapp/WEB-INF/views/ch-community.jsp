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
				$(document).on("click", ".likebeforebtn", function (event) {
					  let no = $(this).attr('idx');
				      console.log(no);
					$.ajax({
						url: "/likesbefore", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid"+no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list[no].checkid);
							var checkid = list[no].checkid;
							$('#likebefore'+no).remove();				
							$("#likeafterbtn"+no).prepend("<i id='likeafter"+ no +"' class='fa-solid fa-heart' style='color:rgb(255, 65, 65)'></i>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//likesbefore ajax
					$.ajax({
						url: "/totallikebefore", // 호출할 주소
						data: {'checkid': $("#checkid"+no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totallike'+ no).remove();					
							$('#likes'+no).append("<div id='totallike"+ no +"'>좋아요 수 " + list +"</div>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totallikebefore ajax
				});// likebeforebtn
				
			 	$(document).on("click", ".likeafterbtn", function (event) {
					  let no = $(this).attr('idx');
				      console.log(no);
					$.ajax({
						url: "/likesafter", // 호출할 주소
						data: { 'nickname': $("#nickname").val(), 'checkid': $("#checkid"+no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							console.log(list);
							var checkid = list[no].checkid;
							
							$("#likeafter"+ no).remove();
							$("#likebeforebtn"+no).prepend("<i id='likebefore" + no + "' class='fa-regular fa-heart' style='color:rgb(255, 65, 65)'></i>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});// ajax 
					$.ajax({
						url: "/totallikeafter", // 호출할 주소
						data: {'checkid': $("#checkid"+no).val() }, // 넘길 데이터
						type: 'get',
						dataType: "text", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
						success: function (list) { // 결과 받기
							$('#totallike'+ no).remove();					
							$('#likes'+no).append("<div id='totallike"+ no +"'>좋아요 수 " + list +"</div>");
						},// success
						error: function (jqXHR) {
							alert("failed");
						}// error
					});//totallikebefore ajax
				});// afterforebtn 

			});// ready
		</script>
		<link rel="stylesheet" href="css/ch-community.css">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
		 <div id="test">
		 ad
		</div>
			<div class="containerflex">
				<c:forEach items="${checklist}" var="check" varStatus="status">
					<div class="item">
						<div class="chimg">
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
								
								<!-- 좋아요 -->
								<div id='likes${status.index}'>
									<!-- 로그인은 하지 않은 좋아요 상태 -->
									<c:if test="${empty principal.memberdto.nickname}">
										<i class="fa-solid fa-heart" style="color:rgb(255, 65, 65)">로그인x</i>
									</c:if>
									<!-- 좋아요 누른상태 -->
									<div class="likeafterbtn" id="likeafterbtn${status.index}" idx="${status.index}">
										<c:if test="${toggle[status.index] == 1}">
											<i id="likeafter${status.index}" class="fa-solid fa-heart" style="color:rgb(255, 65, 65)"></i>
										</c:if>	
									</div>
									<!-- 좋아요 해제상태 -->
									<div class="likebeforebtn" id="likebeforebtn${status.index}" idx="${status.index}">
										<c:if test="${toggle[status.index] == 0}">
											<i id="likebefore${status.index}" class="fa-regular fa-heart" style="color:rgb(255, 65, 65)"></i>
										</c:if>	
									</div>
									<!-- 좋아요 수 -->
									<div id="totallike${status.index}">
											좋아요 수 ${totallike[status.index]}
									</div>
								</div>
								<input type="hidden" id="nickname" name="nickname" value="${principal.memberdto.nickname}">
								<input type="hidden" idx= "${status.index}" id="checkid${status.index}"
												name="checkid" value="${check.checkid}">
								<button id="report" type="button">신고</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		
	</body>

	</html>