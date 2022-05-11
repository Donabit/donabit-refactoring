<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Donabit 습관을 기부하세요</title>
		<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
		<script src="https://kit.fontawesome.com/c0080566c1.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="css/start.css">
	</head>
	<body>
		<div class="movewrap">
			<div>
				<div class="moving">
					<!-- 오토바이/시작/ -->
					<div class="rideicon">
						<img src="/img/ride.png">
						<img src="/img/tire.png" class="tire01 tire-rotate">
						<img src="/img/tire.png" class="tire02 tire-rotate">
					</div>
					<!-- /끝/오토바이 -->
				</div>
				<a href="/main"><img class="btn-img" src="img/game.png"></a>
				<nav class="mmenu">
		   			<input type="checkbox" href="#" class="mmenu-open" name="mmenu-open" id="mmenu-open" />
		   			<label class="mmenu-open-button" for="mmenu-open">
				    	<span class="lines line-1"></span>
				    	<span class="lines line-2"></span>
				    	<span class="lines line-3"></span>
				  	</label>
				   	<a href="/loginform" class="mmenu-item blue"> <i class="fa fa-user"></i> </a>
				   	<a href="/tutorial" class="mmenu-item green"> <i class="fa fa-question"></i> </a>
				   	<a href="/challenge" class="mmenu-item orange"> <i class="fa fa-award"></i> </a>
				   	<a href="/checkcommunity" class="mmenu-item red"> <i class="fa fa-comments"></i> </a>
				   	<a href="/board/list" class="mmenu-item purple"> <i class="fa fa-bell"></i> </a>
				   	<a href="/joinform" class="mmenu-item lightblue"> <i class="fa fa-right-to-bracket"></i> </a>
				</nav>
			</div>
		</div>
	</body>
</html>
