<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/main_header.jsp"%>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="../js/make-a-challenge.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/makepc.css">
</head>
<body>
<img class="mypagetitle" src="img/checktitle.svg">
<hr>
<div class="container">
	<div class="leftbox">
		<div class="profilebox">
			<div class="profile-wrapper">
				<c:choose>
					<c:when test="${principal.memberdto.avatar eq 'slime' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/slime1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/slime2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
								<img class=profileimg src="/img/slime3.jpg">
							</c:when>
							<c:otherwise>
								<img class=profileimg src="/img/slime3.jpg">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${principal.memberdto.avatar eq 'human' }">
						<c:choose>
							<c:when test="${level eq '1'}">
								<img class=profileimg src="/img/human1.jpg">
							</c:when>
							<c:when test="${level eq '2'}">
								<img class=profileimg src="/img/human2.jpg">
							</c:when>
							<c:when test="${level eq '3'}">
								<img class=profileimg src="/img/human3.jpg">
							</c:when>
							<c:otherwise>
								<img class=profileimg src="/img/human3.jpg">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<img class=profileimg src="/img/select.png">
					</c:otherwise>
				</c:choose>

				<div class="nick-level-exp">
					<div class="nickname">${principal.memberdto.nickname}</div>
					<div class="level">Level : ${level}</div>
					<div class="exp">Exp : ${expsum}</div>
				</div>
			</div>

			<div class="listContainer">
					<div class="listContainerText"><a href="/makepc" class="setting"> 챌린지 만들기 </a></div>
					<div class="listContainerText"><a href="/updateform" class="setting"> 회원정보 수정하기 </a></div> 
					<div class="listContainerText"><a href="/passwordmodifyform" class="setting"> 비밀번호 변경하기 </a></div>
					<div class="listContainerText"><a href="/deleteview" class="setting"> 회원 탈퇴하기 </a></div>
			</div>
		</div>
	</div>
	
	<div class="rightbox">
		 <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">챌린지 만들기</h2>
            <br>
            <hr style="border: 1px solid darkgray;">
            <br>
            <form class="admin_make_challenge_form" action="/makepc" method="post" enctype="multipart/form-data">
                <div class="admin_make_challenge_table">
                		<input type="hidden" id=nickname name="nickname" value="${principal.memberdto.nickname}"> 
                    <div class="admin_make_challenge">
                        <label for="chname" class="admin_make_challenge_label">챌린지 이름</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="chname" pattern="^[a-zA-Z0-9가-힣\s]+$" maxlength="10" placeholder="한글, 영문, 숫자 10자 이내로 작성해 주세요." >
                            <!--  <span class="admin_make_challenge_info">(한글, 영문, 숫자 10자 이내로 작성해 주세요.)</span> -->
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chdesc" class="admin_make_challenge_label">챌린지 설명</label>
                        <div class="admin_make_challenge_input">
                            <textarea name="chdesc" id="chdesc" placeholder="100자 이내로 작성해 주세요."></textarea>
                            <!-- <span class="admin_make_challenge_info" >(100자 이내로 작성해 주세요.)</span> -->
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chimg" class="admin_make_challenge_label">챌린지 이미지</label>
                        <div class="admin_make_challenge_input">
                        	<img src="../img/upload_default.png" alt="default image for upload" id="uploadImage">
                            <div class="admin_make_challenge_info">(이미지 파일만 업로드 가능합니다.)</div>
                            <br>
                            <input type="file" name="chimg" accept="image/*" id="uploadInput">
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chsdate" class="admin_make_challenge_label">챌린지 시작일/만료일</label>
                        <div class="admin_make_challenge_input">
                            <input type="date" name="chsdate" id="chsdate"><input type="date" name="chedate" id="chedate" disabled>
                            <div class="admin_make_challenge_info">(만료일은 시작일 입력시 활성화됩니다.)</div>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chexp" class="admin_make_challenge_label">챌린지 제공 경험치(1회)</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp10" value="10" checked><label for="chexp10" class="radioLabel">10exp</label></span>
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp15" value="15"><label for="chexp15" class="radioLabel">15exp</label></span>
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp20" value="20"><label for="chexp20" class="radioLabel">20exp</label></span>
                            <div class="admin_make_challenge_info">(개인별 챌린지가 1회 성공할 때 제공될 경험치를 선택해주세요.)</div>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chsuccess" class="admin_make_challenge_label">챌린지 개인별 목표 횟수</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess30" value="30" checked><label for="chsuccess30" class="radioLabel">30회</label></span>
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess66" value="66"><label for="chsuccess66" class="radioLabel">66회</label></span>
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess100" value="100"><label for="chsuccess100" class="radioLabel">100회</label></span>
                            <div class="admin_make_challenge_info">(챌린지의 개인별 목표 횟수를 선택해 주세요.)</div>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chmaxp" class="admin_make_challenge_label">챌린지 모집 인원</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp20" value="20" checked><label for="chmaxp20" class="radioLabel">20명</label></span>
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp50" value="50"><label for="chmaxp50" class="radioLabel">50명</label></span>
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp100" value="100"><label for="chmaxp100" class="radioLabel">100명</label></span>
                            <div class="admin_make_challenge_info">(챌린지의 모집 인원을 선택해 주세요.)</div>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chdonate" class="admin_make_challenge_label">챌린지 전체 성공 횟수<br>(기부 조건)</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="chdonate" id="chdonate" value="600" readonly>
                           	<div class="admin_make_challenge_info">(개인별 목표 횟수 및 모집 인원을 입력하면 자동으로 입력됩니다.)</div>
                        </div>
                    </div>
                </div>
                <div class="admin_make_challenge_btn_container">
                    <button class="admin_make_challenge_btn" type="submit" onclick="if(!confirm('챌린지를 개설하시겠습니까?')){return false;}">만들기</button>
                    <button class="admin_make_challenge_btn" type="reset" onclick="history.back()">취소</button>
                </div>

                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </main>
	</div> <!-- rightbox end -->
</div>
					

			<script>
				new Swiper('.swiper-container', {

					slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
					spaceBetween : 30, // 슬라이드간 간격
					slidesPerGroup : 3,

					// 그룹수가 맞지 않을 경우 빈칸으로 메우기
					loopFillGroupWithBlank : true,

					loop : true, // 반복

					pagination : { // 페이징
						el : '.swiper-pagination',
						clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
					},
					navigation : { // 네비게이션
						nextEl : '.swiper-button-next', // 다음 버튼 클래스명
						prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
					},
				});
			</script>
</body>
</html>