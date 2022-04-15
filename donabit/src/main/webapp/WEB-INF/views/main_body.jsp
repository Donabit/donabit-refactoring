<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="0.1"> -->
<title>Donabit Main</title>

<script src="https://kit.fontawesome.com/c0080566c1.js" crossorigin="anonymous"></script>

<script src="resources/jquery-3.6.0.min.js"></script>
<script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="css/main_body.css">

<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});	
</script>

<script>
jQuery(function($) {

	window.onresize = function(){
		document.location.reload();
    };
});
</script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="js/slider.js" defer></script>
<script src="js/type.js" defer></script>

</head>

<body>

<div class="carousel-container">
  <div class="carousel-slide">
    <img src="img/3.png" id="lastClone">
    <img src="img/1.png">
    <img src="img/2.png">
    <img src="img/3.png">
    <img src="img/1.png" id="firstClone">
  </div>
  <button id="prevBtn"><i class="fa-solid fa-angle-left"></i></button>
  <button id="nextBtn"><i class="fa-solid fa-angle-right"></i></button>
</div>

<br>
<hr class="two">

<section class = motto>

<div class = div_motto>

<p class="result1" style="font-size: 40px; "></p>
<br>
<br>
<br>
<p class="result2" style="font-size: 40px; "></p>

</div>

</section>

<hr class="three">
<br>

<section class = ch1>

	<div class="parent">
        <div class="first"><img src="img/ch_1.png"></div>
        <div class="d-text"><p>첫 번째 챌린지</p></div>
        
        <div class="second"><img src="img/ch_1.png"></div>
        <div class="third">세 번째 챌린지</div>
    </div>
    
</section>

<section class = ch2>

	<div class="parent">
        <div class="fourth">네 번째 챌린지</div>
        <div class="fifth">다섯 번째 챌린지</div>
        <div class="sixth">여섯 번째 챌린지</div>
    </div>1

</section>

<hr class = "four">
<br>

<section class = notice>

<h1 class = notice>공지사항 구현중</h1>

</section>
	
<div class="slider">
	<div class="slide-track">
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_2.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_3.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_4.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_5.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_6.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_7.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_2.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_3.png" height="100" width="250" alt="" />
		</div>
	</div>
</div>
	
</body>
</html>
