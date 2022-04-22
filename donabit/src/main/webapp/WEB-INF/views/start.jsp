<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>

<script src="resources/jquery-3.6.0.min.js"></script>
<script src="mybatis_spring.js" defer></script>

<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<style>	
	.movewrap {position:absolute;top:70%;left:50%;transform:translate(-50%,-50%);}
	
	
	.movewrap {max-width:1200px;width:100%;}
	.movewrap > div {padding-bottom:40%;width:100%;}

	.moving {
		position:absolute;top:0;left:0;
		width:100%;height:100%;
		background:url('/img/backg.png') 0 center / 2500px repeat-x;
		animation: moveright 10s linear infinite;
	}

	@keyframes moveright {
		0% {background-position:0% center;}
		100% {background-position:-2500px center;}
	}

	.rideicon {position:absolute;top:70%;left:50%;transform:translate(-50%,-50%);transition:all 5s;width:20%;}
	.rideicon img {width:100%;}
	.rideicon .tire01 {position:absolute;bottom:3%;left:10%;width:26%;z-index:-1;}
	.rideicon .tire02 {position:absolute;bottom:3%;right:.2%;width:26%;z-index:-1;}
	.tire-rotate {animation: tire-rotate 1s linear infinite;}
	@keyframes tire-rotate {
	  0% {transform: rotate(0);}
	  100% {transform: rotate(360deg);}
		
	}
	
	div.start {
		position:absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: 60%;
	  }
	  
</style>
</head>
<body>

<div class="start">
	<button type="button" onclick="location.href='/main' ">GAME START</button>
		</div>

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
		</div>
		</div>
</body>

</html>
