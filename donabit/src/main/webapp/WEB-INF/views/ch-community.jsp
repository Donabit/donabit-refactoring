<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>인증 커뮤니티</title>
		<script src="resources/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				//jquery code
			});
		</script>
		<link rel="stylesheet" href="css/ch-community.css">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<div class="containerflex">
			<c:forEach items="${checklist}" var="check">
				<div class="item">
					<div class="img">
						<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
					</div>
					<div class="detail">
						<div class="checkdesc" style= "overflow:hiddlen; word-break:break-all;">${check.checkdesc}</div>
						<div class="title">${check.checktitle}</div>
						<div><small>${check.checktime}</small></div>
						<div class="divbtn"> 
							<button id="like" type="button">좋아요</button>
							<button id="report" type="button">싫어요</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>

	</html>