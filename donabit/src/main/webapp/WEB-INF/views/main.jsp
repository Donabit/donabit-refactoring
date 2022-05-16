<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file="/WEB-INF/views/main_header.jsp" %>
	<head>
		<script src="https://kit.fontawesome.com/c0080566c1.js" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="css/main_body.css">
		<script src="js/slider.js" defer></script>
		<script src="js/type.js" defer></script>
	</head>
	<body>
		<section id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/main_img_1.png" class="d-block w-100" alt="Danabit_MainImg_Character" height="400px">
				</div>
				<div class="carousel-item">
					<img src="img/main_img_2.png" class="d-block w-100" alt="Donabit_MainImg_Textlogo" height="400px">
				</div>
		<!-- 		<div class="carousel-item">
					<img src="..." class="d-block w-100" alt="...">
				</div> -->
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</section>
	
	<!-- <div class="carousel-container">
	  <div class="carousel-slide">
	    <img src="img/main_img_1.png" id="lastClone">
	    <img src="img/main_img_1.png">
	    <img src="img/main_img_2.png">
	    <img src="img/main_img_1.png" id="firstClone">
	  </div>
	  <button id="prevBtn"><i class="fa-solid fa-angle-left"></i></button>
	  <button id="nextBtn"><i class="fa-solid fa-angle-right"></i></button>
	</div> -->
	
	<main>
		<section class="main_contents challenge_list">
		<p class="contents_header">인기 챌린지</p>
		<div class="Ch_container_1">
		  <c:forEach items="${chlist}" var="dto" end="7">
		  	<div style="cursor: pointer;" onclick="location.href='/challenge/${dto.chnum}?chnumdetail=${dto.chnum}'">
				<img src="/images/${dto.chimg}" class="Ch1" width="250px" height="250px" />
				<p class="main_challenge_info"><b>챌린지 명 :</b> ${dto.chname}</p>
			  	<p class="main_challenge_info"><b>참여 인원 :</b> ${dto.nickname} / ${dto.chmaxp}</p>
			</div>
		  </c:forEach>
		</div>
	
		</section>
		<section class="motto">
			<div class="main_contents motto_bar">
				<div class = div_motto>
					<p class="result1"></p>
					<p class="result2"></p>
				</div>
			</div>	
		</section>
		<section class="main_contents ranking_notice">
			<div class="ranking_container">
				<p class="contents_header">레벨</p>
				<ul class="ranking_list">
					<c:forEach items="${ranklist}" var="ranklist" varStatus="status">
						<li>
							<span>${ranklist.avatar}</span>
							<span>${ranklist.nickname}</span>
							<span>${ranklist.expsum}</span>
							<span>${level[status.index]}</span>
						</li>	
					</c:forEach>
				</ul>
			</div>
			<div class="notice_container">
				<p class="contents_header">공지사항</p>
					<c:forEach items="${list}" var="list" end = "4">
						<div class = notice_body_row>   
	                		<a class= notice_body_cell href='board/get?bno=${list.bno}'>${list.title}</a>
							<span class = notice_body_cell> ${list.writer} </span>
							<span class = notice_body_cell> ${fn:substring(list.regdate, 0, 10) } </span>
						</div>
	        	</c:forEach>
			</div>
		</section>
		<section class=ads>
			<div>
			<p class="contents_header">튜토리얼</p>
				<br>
					<div class="ads">
						<p>저희가 추구하는 방향성이 궁금하신가요?</p>
						<br>
						<p>튜토리얼을 통해 누구나 실천할 수 있는 선한 영향력을 확인해보세요</p>
					</div>
				<br>
				<br>
				<button class=tuto type="button" onclick="location.href='/tutorial'">튜토리얼!</button>
			</div>
			<div>
			<img id="tutorial_img" src="https://cdn.pixabay.com/photo/2018/05/12/11/37/team-3393037_1280.jpg" alt="튜토리얼 이미지"/>
			</div>
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
	</main>
	<%@ include file="/WEB-INF/views/main_footer.jsp" %>

	</body>
</html>
