<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>

	<style>	
	.movewrap {position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);}
	.movewrap {max-width:3000px;width:100%; height:1200px;}
	.movewrap > div {width:100%;}

	.moving {
		position:absolute;top:0%;left:0%;
		width:100%;height:100%;
		background:url('/img/start.png') 0 center / 3000px repeat-x;
		animation: moveright 10s linear infinite;
	}

	@keyframes moveright {
		0% {background-position:0% center;}
		100% {background-position:-3000px center;}
	}

	.rideicon {position:absolute;top:70%;left:50%;transform:translate(-50%,-50%);transition:all 5s;width:20%;}
	.rideicon img {width:100%;}
	.rideicon .tire01 {position:absolute;bottom:4%;left:15.5%;width:22%;z-index:1;}
	.rideicon .tire02 {position:absolute;bottom:4%;right:15%;width:22%;z-index:1;}
	.tire-rotate {animation: tire-rotate 1s linear infinite;}
	@keyframes tire-rotate {
	  0% {transform: rotate(0);}
	  100% {transform: rotate(360deg);}
		
	}
	
.btn-img {
		position:absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: 45%;
		width: auto;
		height: auto;
		max-width: 2000px;
		max-height: 400px;
	  }
	  
</style>
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
		
	<a href="/main" target="_blank"><img class="btn-img" src="img/game.png"></a>
		
		</div>
		</div>
</body>

</html>
