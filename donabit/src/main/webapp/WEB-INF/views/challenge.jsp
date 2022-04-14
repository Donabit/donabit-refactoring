<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 추가 -->

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(function() {

		});
	});
</script>
<link rel="stylesheet" href="css/challenge.css">
<script src="js/challenge.js" type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container">
		<div class="header">
			<h2 style="display: inline">
				<a href="http://localhost:8089/morningcheck">morningcheck /</a>
			</h2>
			<h2 style="display: inline">
				<a href="http://localhost:8089/main">main /</a>
			</h2>
			<h2 style="display: inline">
				<a href="http://localhost:8089/admin">admin</a>
			</h2>
			<h2 style="display: inline">
				<a href="http://localhost:8089/make-a-challenge">admin</a>
			</h2>
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
							<form action="/challengedetail/${dto.chnum }" method="get">
								<input type="submit" value="${dto.chnum }번 상세페이지"> <input
									type="hidden" name="chnumdetail" value="${dto.chnum }">
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
</body>

</html>