<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 이미지</title>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/b81e22d1de.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/main_header.jsp" %>
</head>
<body>
    <div class="containerflex">
    	<div class="item">
    		<div class= "plusbutton">
    		<a href="/checkmorningform?chnum=${param.chnum}">
		  		<span style="color:#94DAFF">
		  			<i class="fa fa-solid fa-plus fa-8x"></i>
		  		</span>
    		</a>
    		</div>
    	</div>
				<c:forEach items="${checklist}" var="check">
				  	<div class="item">
				  		<div class="img">
							<img src="/checkimage/${check.checkimg2}" height="300px" width="300px"><br>
				  		</div>
				  		<div class="detail">
							<b>${check.checktitle}</b>
							${check.checkdesc} <br>
							<small>${check.checktime}</small>
						</div>
				  	</div>
				</c:forEach>	
		</div>
</body>
</html>