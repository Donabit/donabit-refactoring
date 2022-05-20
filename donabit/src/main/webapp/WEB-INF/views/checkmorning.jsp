<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/b81e22d1de.js"
	crossorigin="anonymous"></script>

<script>
	window.onload = function() {
		document.getElementById("newwin").onclick = function() {
			var windowW = 450; // 창의 가로 길이
			var windowH = 600; // 창의 세로 길이
			var left = Math.ceil((window.screen.width - windowW) / 2);
			var top = Math.ceil((window.screen.height - windowH) / 2);

			window.open(
					"/checkmorningform?chnum=<c:out value='${param.chnum}'/>",
					"", "top=" + top + ", left=" + left + ", height=" + windowH
							+ ", width=" + windowW);
		}
	};
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/main_header.jsp"%>
	<img class="checktitle" src="img/checktitle.svg">
	<div class="containerflexbox">	
		<div class="chname">
			<br>
			<div>
				<span class="rainbow1">&#x1F308</span> <span class="betweenrainbow">${chname}</span> <span class="rainbow2"> &#x1F308 </span>
			</div>
			<br>
		</div>
			<div class="listcontainerout">
			<div class="listcontainer">
				<div class="item">
					<div class="plus_btn">
						<a href="#" onclick="return false" id="newwin" type="button"> <span style="color: #2AC1BC"> <i class="fa fa-solid fa-plus fa-8x"></i></span>
						</a>
					</div>
				</div>
				
	
					<c:forEach items="${checklist}" var="check">
					<div class="item">
						<div class="deletecheck">
							<form action="/deletecheck" method="post" id="deletecheck" name="deletecheck">
								<input type="hidden" id="checkid" name="checkid" value="${check.checkid}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
								<button class="delete_btn" id="delete_btn" type="submit" onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}">
									<span style="color: white"> <i class="fa fa-solid fa-xmark fa-2x" ></i></span>
								</button>
								
							</form>	
						</div>
						<div class="img">
							<img class="imgin" src="/checkimage/${check.checkimg2}">
						</div>
							
							<div class="detail">
								<div class="detail_first">
									<small>${check.checktime}</small><br>
									<b>${check.checktitle}</b>
								</div>
								<div class="detail_second">
									${check.checkdesc}
								</div>
							</div>
				</div>
				</c:forEach>
				
				</div>
			</div>
		<footer>
			<%@ include file="/WEB-INF/views/main_footer.jsp"%>
		</footer>
</body>
</html>