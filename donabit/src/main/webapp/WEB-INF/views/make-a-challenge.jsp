<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donabit 관리자 페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .admin_sidebar {
            float: left;
            height: 70em;
            width: 320px;
            background-color: darkgrey;
            
        }

        .admin_sidebar_list {
            padding: 1em;
        }

        .admin_sidebar_list:hover {
            background-color: dimgray;
        }

        .admin_main_container {
            padding: 2em;
            height: 66em;
            background-color: whitesmoke;
            overflow: hidden;
        }
        
        .admin_make_challenge_table {
            display: table;
            width: 100%;
        }
        
        .admin_make_challenge {
            display: table-row;
        }
        
        .admin_make_challenge_label {
            font-weight: 500;
            width: 14em;
        }
        
        .admin_make_challenge_label, .admin_make_challenge_input {
            display: table-cell;
            border-bottom: 1px solid lightgray;
            padding: 1em 1em 1em 0.5em;
            vertical-align: top;
        }

        .admin_make_challenge_info {
            font-size: small;
            color: gray;
            padding-left: 3em;
            vertical-align: top;
        }
        
        input[type=text], input[type=number], input[type=file] {
            width: 22em;
        }

		input[type=file] {
			display: block;
		}
		
        textarea {
            width: 22em;
            height: 5em;
        }

        input[type=date]:first-child {
            margin-right: 1em;
            width: 10em;
        }
        
        .radioBtns {
        	padding: 1em 1em 1em 0;
        }
        
        .radioLabel {
        	padding-left: 0.5em;
        }

        .admin_make_challenge_btn {
            padding: 0.8em 1.6em;
            margin: 2em 1em;
            border-radius: 0.5em;
            border: 0;
            cursor: pointer;
            box-shadow: 2px 2px rgb(176, 176, 176);
        }

        .admin_make_challenge_btn_container {
            text-align: center;
            border-radius: 1em;
        }

        .admin_make_challenge_btn:first-child {
            background-color: #FF85B3;
            color: white;
        }

        .admin_make_challenge_btn:first-child:hover {
            background-color: #ff5596;
        }

        .admin_make_challenge_btn:last-child:hover {
            background-color: lightgray;
        }

		#uploadImage {
			display: inline-block;
			background-color: whitesmoke;
			width: 18em;
			height: 10em;
		}
    </style>
</head>
<body>
    <ul class="admin_sidebar">
        <h1>로고</h1>
        <li class="admin_sidebar_list">챌린지 만들기</li>
        <li class="admin_sidebar_list">챌린지 리스트</li>
        <li class="admin_sidebar_list">회원 리스트</li>
        <li class="admin_sidebar_list">신고 내역</li>
        <li class="admin_sidebar_list">User Custom Challenge</li>
        <li class="admin_sidebar_list">CS(Chatbot)</li>
    </ul>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">챌린지 만들기 &#x1F6E0</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            <form class="admin_make_challenge_form" action="/adminresult" method="post" enctype="multipart/form-data">
                <div class="admin_make_challenge_table">
                    <div class="admin_make_challenge">
                        <label for="chname" class="admin_make_challenge_label">챌린지 이름</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="chname">
                            <span class="admin_make_challenge_info">(한글, 영문, 숫자 10자 이내로 작성해 주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chdesc" class="admin_make_challenge_label">챌린지 설명</label>
                        <div class="admin_make_challenge_input">
                            <textarea name="chdesc"></textarea>
                            <span class="admin_make_challenge_info">(100자 이내로 작성해 주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chimg" class="admin_make_challenge_label">챌린지 이미지</label>
                        <div class="admin_make_challenge_input">
                        	<img src="img/upload_default.png" alt="default image for upload" id="uploadImage">
                            <span class="admin_make_challenge_info">(이미지 파일만 업로드 가능합니다.)</span>
                            <input type="file" name="chimg" accept="image/*" id="uploadInput">
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chsdate" class="admin_make_challenge_label">챌린지 시작일/만료일</label>
                        <div class="admin_make_challenge_input">
                            <input type="date" name="chsdate" id="chsdate"><input type="date" name="chedate" id="chedate" disabled>
                            <span class="admin_make_challenge_info">(만료일은 시작일 입력시 활성화됩니다.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chexp" class="admin_make_challenge_label">챌린지 제공 경험치(1회)</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp10" value="10" checked><label for="chexp10" class="radioLabel">10exp</label></span>
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp15" value="15"><label for="chexp15" class="radioLabel">15exp</label></span>
                            <span class="radioBtns"><input type="radio" name="chexp" id="chexp20" value="20"><label for="chexp20" class="radioLabel">20exp</label></span>
                            <span class="admin_make_challenge_info">(개인별 챌린지가 1회 성공할 때 제공될 경험치를 선택해주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chsuccess" class="admin_make_challenge_label">챌린지 개인별 목표 횟수</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess30" value="30" checked><label for="chsuccess30" class="radioLabel">30회</label></span>
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess66" value="66"><label for="chsuccess66" class="radioLabel">66회</label></span>
                            <span class="radioBtns"><input type="radio" name="chsuccess" id="chsuccess100" value="100"><label for="chsuccess100" class="radioLabel">100회</label></span>
                            <span class="admin_make_challenge_info">(챌린지의 개인별 목표 횟수를 선택해 주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chmaxp" class="admin_make_challenge_label">챌린지 모집 인원</label>
                        <div class="admin_make_challenge_input">
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp20" value="20" checked><label for="chmaxp20" class="radioLabel">20명</label></span>
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp50" value="50"><label for="chmaxp50" class="radioLabel">50명</label></span>
                            <span class="radioBtns"><input type="radio" name="chmaxp" id="chmaxp100" value="100"><label for="chmaxp100" class="radioLabel">100명</label></span>
                            <span class="admin_make_challenge_info">(챌린지의 모집 인원을 선택해 주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="chdonate" class="admin_make_challenge_label">챌린지 전체 성공 횟수<br>(기부 조건)</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="chdonate" id="chdonate" value="600" readonly>
                            <span class="admin_make_challenge_info">(개인별 목표 횟수 및 모집 인원을 입력하면 자동으로 입력됩니다.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="donateco" class="admin_make_challenge_label">기부처</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="donateco">
                            <span class="admin_make_challenge_info">(법인명 또는 브랜드명을 입력해 주세요.)</span>
                        </div>
                    </div>
                    <div class="admin_make_challenge">
                        <label for="donatepay" class="admin_make_challenge_label">기부금액(원)</label>
                        <div class="admin_make_challenge_input">
                            <input type="text" name="donatepay">
                            <span class="admin_make_challenge_info">(숫자만 입력해 주세요.)</span>
                        </div>
                    </div>
                </div>
                <div class="admin_make_challenge_btn_container">
                    <button class="admin_make_challenge_btn" type="submit">만들기</button>
                    <button class="admin_make_challenge_btn" type="reset">취소</button>
                </div>

            </form>
        </div>
    </main>
    
    <script type="text/javascript">
    //이미지 업로드 미리보기
	const uploadInput = document.getElementById('uploadInput');
	uploadInput.addEventListener('change', (e) => {
    	const uploadImage = document.getElementById('uploadImage');
    	uploadImage.src = URL.createObjectURL(event.target.files[0]);
    	uploadImage.onload = function() {
    		URL.revokeObjectURL(uploadImage.src) 
    	}
   	});
	
	//달력 시작일 > 오늘, 만료일 > 시작일(활성화 포함)
	const chsdate = document.getElementById('chsdate');
	const chedate = document.getElementById('chedate');
		
	function getToday(){
		const date = new Date();
		const year = date.getFullYear();
		const month = ("0" + (1 + date.getMonth())).slice(-2);
		const day = ("0" + date.getDate()).slice(-2);
		return year + "-" + month + "-" + day;
	}

	chsdate.min = getToday();
	
	chsdate.addEventListener('change', (event) => {
		chedate.disabled = false;
		chedate.min = event.target.value;
	});
    
	//성공횟수 자동 입력
	const chmaxp = document.getElementsByName('chmaxp');
	const chsuccess = document.getElementsByName('chsuccess');
	const chdonate = document.getElementById('chdonate');
	
	chsuccess.forEach(sitem => sitem.addEventListener('click', function(sevent){
		chdonate.value = chmaxp[0].value * sevent.target.value;
		chmaxp.forEach(pitem => pitem.addEventListener('click', function(pevent){
			chdonate.value = sevent.target.value * pevent.target.value;			
		}))
	}))
	
	chmaxp.forEach(pitem => pitem.addEventListener('click', function(pevent){
		chdonate.value = chsuccess[0].value * pevent.target.value;
		chsuccess.forEach(sitem => sitem.addEventListener('click', function(sevent){
			chdonate.value = sevent.target.value * pevent.target.value;			
		}))
	}))

	
    </script>

</body>
</html>