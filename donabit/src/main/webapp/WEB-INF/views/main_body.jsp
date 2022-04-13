<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="js/slider.js" defer></script>


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

<div class="grid-init grid">
  <div class="box-init box">챌린지 1</div>
  <div class="box-init box">챌린지 2</div> 
  <div class="box-init box">챌린지 3</div> 
  <div class="box-init box">챌린지 4</div> 
  <div class="box-init box">챌린지 5</div> 
  <div class="box-init box">챌린지 6</div> 
</div>
	
	<div class ="carousel_second">
	carousel_second
	</div>
	
</body>
</html>
