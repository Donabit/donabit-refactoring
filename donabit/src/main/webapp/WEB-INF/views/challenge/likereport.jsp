<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
			<span class="likeafterbtn" id="likeafterbtn${status.index}" idx="${status.index}">
				<c:if test="${toggle[status.index] == 1}">
					<img id="likeafter${status.index}" src="img/like11.png" width="25px">
				</c:if>
			</span>
			<!-- 좋아요 해제상태 -->
			<span class="likebeforebtn" id="likebeforebtn${status.index}" idx="${status.index}">
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
			<span class="singoafterbtn" id="singoafterbtn${status.index}" idx="${status.index}">
				<c:if test="${singo[status.index] == 1}">
					<img id="singoafter${status.index}" src="img/singo11.png" width="30px">
				</c:if>
			</span>
			<!-- 신고 전 -->
			<span class="singobeforebtn" id="singobeforebtn${status.index}" idx="${status.index}">
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
		<input type="hidden" id="nickname" name="nickname" value="${principal.memberdto.nickname}">
		<input type="hidden" idx="${status.index}" id="checkid${status.index}" name="checkid" value="${check.checkid}">
	</div> <!-- 좋아요, 신고 버튼 -->