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
</head>

<body>
	<c:forEach items="${challengelist }" var="dto">
		<c:if test="${dto.chnum == chnumdetail}">
			<div>챌린지 번호 : ${dto.chnum }</div>
			<div>챌린지 명 : ${dto.chname }</div>
			<div>기부조건 : ${dto.checknum } / ${dto.chdonate }</div>
			<div>개인성공조건 : ${dto.chsuccess }</div>
			<div>이미지 :${dto.chimg }</div>
			<div>경험치 : ${dto.chexp}</div>
			<div>최대모집 : ${dto.chmaxp}</div>
			<div>chsdate ${dto.chsdate}</div>
			<div>chedate ${dto.chedate}</div>
		</c:if>
	</c:forEach>



</body>

</html>