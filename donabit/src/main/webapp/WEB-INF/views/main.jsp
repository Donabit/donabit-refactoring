<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>

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

<%@ include file="/WEB-INF/views/main_header.jsp" %>

<div class="carousel-container">
  <div class="carousel-slide">
    <img src="img/main_img_1.png" id="lastClone">
    <img src="img/main_img_1.png">
    <img src="img/main_img_2.png">
    <img src="img/main_img_1.png" id="firstClone">
  </div>
  <button id="prevBtn"><i class="fa-solid fa-angle-left"></i></button>
  <button id="nextBtn"><i class="fa-solid fa-angle-right"></i></button>
</div>
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

<section class = Ch001>

<div class="Ch_container_1">
  <div class="Ch1"></div>
  챌린지 명:
  <br>
  참여 인원:
  <div class="Ch2"></div>
  챌린지 명:
  <br>
  참여 인원:
  <div class="Ch3"></div>
  챌린지 명:
  <br>
  참여 인원:
</div>

</section>

<section class = Ch002>

<div class="Ch_container_2">
  <div class="Ch4"></div>
  챌린지 명:
  <br>
  참여 인원:
  <div class="Ch5"></div>
  챌린지 명:
  <br>
  참여 인원:
  <div class="Ch6"></div>
  챌린지 명:
  <br>
  참여 인원:
</div>

</section>

<section class = notice>

<h1 class = notice>Recent Our Notice</h1><a class = more href="board/list">더보기</a>
<hr class = "four">

<div class = notice_body_table>
		<c:forEach items="${list}" var="list" end = "4">
		<c:set var="regdate" value="${list.regdate}"/>

			
			<div class = notice_body_row>   
                <a class= notice_body_cell href='board/get?bno=${list.bno}'> ${list.title} </a>
				<span class = notice_body_cell> ${list.writer} </span>
				<span class = notice_body_cell> ${fn:substring(regdate, 0, 10) } </span>
			</div>
			
			
			
			

        	</c:forEach>
        </div>
        

</section>

<section class=ads>

<h1 class=ads>Many hands make light work</h1>
<p class=ads>저희가 추구하는 방향성이 궁금하신가요?<br>
튜토리얼을 통해 누구나 실천할 수 있는 선한 영향력을 확인해보세요</p>
<br>
<button class=tuto type="button" onclick="location.href='tutorial.jsp'">튜토리얼!</button>

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
			<img src="img/logo_8.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_9.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_10.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_11.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_12.png" height="100" width="250" alt="" />
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
			<img src="img/logo_8.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_1.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_9.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_10.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_11.png" height="100" width="250" alt="" />
		</div>
		<div class="slide">
			<img src="img/logo_12.png" height="100" width="250" alt="" />
		</div>

	</div>
</div>

<%@ include file="/WEB-INF/views/main_footer.jsp" %>

<!-- Tocplus 15.1 -->
<script type="text/javascript">
tocplusTop=1150;
tocplusLeft=5;
tocplusMinimizedImage='http://kr07.tocplus007.com/img/minimized_ko.gif';
tocplusHAlign='right';
tocplusWidth=180;
tocplusHeight=220;
tocplusUserName='회원';
tocplusFrameColor='#FF85B3';
tocplusFloatingWindow=true;
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%"+"3Cscript src='" + tocplusHost + "kr07.tocplus007.com/chatLoader.do?userId=donabit' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
</script>
<!-- End of Tocplus -->

</body>
</html>
