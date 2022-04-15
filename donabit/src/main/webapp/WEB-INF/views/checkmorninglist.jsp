<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 이미지</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
	  <h1> 인증 내역</h1>
	  <hr>
    <div class="containerflex">
		  <c:if test="${result == 1 }">
				<c:forEach items="${checklist}" var="check">
				  	<div class="item">
				  		<div class="img">
							<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
				  		</div>
				  		<div class="detail">
					 		${check.checktime}<br>
							${check.checktitle}<br>
							${check.checkdesc}
						</div>
				  	</div>
				</c:forEach>
		</c:if>		
		</div>
</body>
</html>
