<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 이미지</title>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/b81e22d1de.js"
	crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/main_header.jsp"%>
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
<script type="text/javascript">
	function removeCheck() {
		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		     document.deletecheck.submit();
		 }else{   //취소
		     return false;
		 }
	
		}
	</script>
</head>
<body>
	<img class="checktitle" src="img/checktitle.svg">
	<div class="containerflexbox">	
		<div class="chname">
			<br><br>
			<span class="rainbow1">&#x1F308</span> <h2>${chname}</h2> <span class="rainbow2"> &#x1F308 </span>
			<br><br>
		</div>
		
			<div class="containerflex">
				<div class="item">
					<div class="plus_btn">
						<a href="#" onclick="return false" id="newwin" type="button"> <span style="color: #94DAFF"> <i class="fa fa-solid fa-plus fa-8x"></i></span>
						</a>
					</div>
				</div>
				
	
					<c:forEach items="${checklist}" var="check">
					<div class="item">
						<div class="deletecheck">
							<form action="/deletecheck" method="post" id="deletecheck" name="deletecheck">
								<input type="hidden" id="checkid" name="checkid" value="${check.checkid}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button class="delete_btn" id="delete_btn" type="submit" onclick="removeCheck()">
									<span style="color: #94DAFF"> <i class="fa fa-solid fa-xmark fa-2x" ></i></span>
								</button>
							</form>	
						</div>
						<div class="img">
							<img class="imgin" src="/checkimage/${check.checkimg2}">
						</div>
							
							<div class="detail">
								<div class="detail_first">
									<b>${check.checktitle}</b>&nbsp;<small>${check.checktime}</small>
								</div>
								<div class="detail_second">
									${check.checkdesc}
								</div>
							</div>
				</div>
				</c:forEach>
				
				</div>
			</div>
	<%@ include file="/WEB-INF/views/main_footer.jsp"%>
</body>
</html>