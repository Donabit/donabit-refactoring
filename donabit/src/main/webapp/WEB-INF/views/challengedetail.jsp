<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="jquery-3.6.0.min.js"></script>
		<style>
		</style>
		<script type="text/javascript">
			$(document).ready(function () {
				$(function () {

				});
			});
		</script>
		<link rel="stylesheet" href="../css/challengedetail.css">
		<script src="js/challenge.js" type="text/javascript"></script>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	</head>

	<body>
<%@ include file="/WEB-INF/views/main_header.jsp" %>
		<c:forEach items="${challengelist }" var="dto">
			<c:if test="${dto.chnum == chnumdetail}">
				<div class="container">
					<div class="head">헤더</div>
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
					<div class="description">설명</div>
					<div class="button">
						<form>
							<input type="button" value="기부하기" onclick="donate()">
						</form>
					</div>
					<div class="footer"></div>
				</div>
			</c:if>
		</c:forEach>

	</html>