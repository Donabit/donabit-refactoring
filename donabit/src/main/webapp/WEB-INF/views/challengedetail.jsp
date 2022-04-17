<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<!--  spring security - ajax post 방식으로 요청시 추가-->
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">
		<title>Donabit 챌린지상세</title>
		<link rel="stylesheet" href="../css/challengedetail.css">
		<link rel="stylesheet" type="text/css" href="../css/main_header.css">
		<link rel="stylesheet" type="text/css" href="../css/main_footer.css">
		<script src="js/challenge.js" type="text/javascript"></script>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<script src="../jquery-3.6.0.min.js"></script>
		<style>
		</style>
		<script type="text/javascript">
		
			//spring security - ajax post 방식으로 요청시 추가
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
			});
		
			
			$(document).ready(function () {
				$(document).on("click", "#participatebtn", function() {
				//$("#participatebtn").click(function () {
					$.ajax({
						url: "/participate", // 호출할 주소
						data: { 'chnumajax': $("#chnumajax").val(), 'nicknameajax':$("#nicknameajax").val() }, // 넘길 데이터
						type: 'post',
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
							$("#participate").prepend("<button id ='cancelbtn' type='button'>참여취소</button>");
							$("#divprog").prepend("<progress id='recruitprog2' value='"+ nickname2 +"' max='"+ chmaxp +"'></progress>");
							$("#recruitdiv").prepend("<div id = recruitdivin2 >최대모집 : "+ nickname2 +"/ "+ chmaxp +"</div>");
							$("#zzz").load("/challengedetail.jsp");
							alert("참여완료");
								
							},// success
							error: function (jqXHR) {
								alert("failed");
							}// error
						});// ajax
					});//participatebtn click
				
					
				$(document).on("click", "#cancelbtn", function() {
					$.ajax({
						url: "/cancel", // 호출할 주소
						data: { 'chnumajax': $("#chnumajax").val(), 'nicknameajax':$("#nicknameajax").val() }, // 넘길 데이터
						type: 'post',
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
							$("#participate").prepend("<button id='participatebtn' type='button'>참여하기</button>");
							if(nickname2 == null){
							$("#recruitdiv").prepend("<div id = recruitdivin >최대모집 : 0/ "+ chmaxp +"</div>");
							}else{
								$("#recruitdiv").prepend("<div id = recruitdivin >최대모집 : "+ nickname2 +"/ "+ chmaxp +"</div>");
							}
							$("#divprog").prepend("<progress id='recruitprog' value='"+ nickname2 +"' max='"+ chmaxp +"'></progress>");
							$("#participate").prepend("<input type='hidden' id='chnumajax' name='chnumajax' value='"+ chnum +"'>");
							// 
							alert("취소완료");
							},// success
							error: function (jqXHR) {
								alert("failed");
							}// error
						});// ajax
					});// cancelbtn click
					
				});// ready
				
				
				
		</script>
		
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<c:forEach items="${challengelist }" var="dto">
				<c:if test="${dto.chnum == chnumdetail}">
					<div class="container">
						<div class="head"></div>
						<div class="img">
							<img src="/image/${dto.chimg }" height="100%" width="auto">
						</div>
						<div class="info">
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
							<div>경험치 : ${dto.chexp}</div>
							<c:forEach items="${challcount }" var="dto2">

								<c:if test="${dto.chnum == dto2.chnum}">
									<div>
										<div id = recruitdiv >
											<div id = recruitdivin >최대모집 : ${dto2.nickname }/ ${dto.chmaxp}</div>
										</div>
										<div id=divprog>
											<progress id="recruitprog" value="${dto2.nickname }" max="${dto.chmaxp}"></progress>
										</div>
									</div>
								</c:if>

							</c:forEach>
							<div>chsdate ${dto.chsdate}</div>
							<div>chedate ${dto.chedate}</div>

						</div>
						<div class="description">${dto.chdesc }</div>
						
				
						<div class="button" id="divbutton">
						<div id="participate">
							<button id="participatebtn" type="button">참여하기</button>
							<input type="hidden" id="chnumajax" name="chnumajax" value="${dto.chnum}">
							<!-- 추후 session -->
							<input type="hidden" id="nicknameajax" name="nicknameajax" value="ccc">
						</div>
						</div>
						<div class="footer"></div>

					</div>
					<%@ include file="/WEB-INF/views/main_footer.jsp" %>
				</c:if>
			</c:forEach>

	</html>