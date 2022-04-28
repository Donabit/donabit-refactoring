<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donabit 관리자 페이지</title>
    <style>
		.page_num_container {
			margin: 1em auto;
			text-align: center;
		}
		
		.page_num {
			display: inline-block;
			width: 1em;
			height: 1em;
			padding: 0.5em;
			background-color: lightgray;
			border-radius: 50%;
			color: dimgray;
		}
		
		.page_num:hover {
			color: black;
			background-color: #99FFCD;
		}

		.admin_challenge_list {
			display: flex;
			border-bottom: 1px solid black;
			padding: 1em 0 1em 0;		
		}
		
		.admin_challenge_list h3 {
			font-weight: 500;
		}
		
		.admin_challenge_list li {
			padding-bottom: 1em;
		}
		
		.admin_challenge_list p {
			padding-top: 0.5em;
		}
		
		.admin_challenge_list_img {
			padding-right: 2em;
		}
		
		.admin_challenge_list_info {
			flex: 1;
			text-align: left;
			list-style-type: '- ';
		}
		
		.admin_challenge_container {
			height: 720px;
		}
		
		.admin_sidebar_list:nth-child(3) {
			background-color: #99FFCD;
		}

		a[href="challenge-list"] {
			color: black;
			font-weight: 600;
		}
		
		#page_num_<c:out value='${param.page}'/> {
			color: black;
			background-color: #99FFCD;
		}
		
		.deleteBtns {
			cursor: pointer;
			font-size: 1em;
			background-color: whitesmoke;
			border: none;
			margin-right: 1em;
		}
		
		.deleteBtns:hover {
			color: red;
		}
		
    </style>
    <script type="text/javascript">
       	function goPost(page) {
			let form = document.createElement('form');
    		let input = document.createElement('input');
    		input.type = 'hidden';
    		input.name = 'page';
    		input.value = page;
    		
    		let inputToken = document.createElement('input');
    		inputToken.type = 'hidden';
    		inputToken.name = '${_csrf.parameterName}';
    		inputToken.value = '${_csrf.token}';

    		form.appendChild(input);
    		form.appendChild(inputToken);
    		form.action = "/admin/challenge-list";
    		form.method = "POST";
    		document.body.appendChild(form);
    		form.submit();
	    }
		
       	
       	function confirmRemove(chname, chnum, chmember){
       		let result = confirm("정말로 삭제하시겠습니까? 챌린지명: " + chname);
       		if(result == true){
       			if(chmember >= 1){
       				alert('참여 인원이 1명 이상일 경우, 삭제할 수 없습니다.');
       				return;
       			}
       			let form = document.createElement('form');
       			let input = document.createElement('input');
       			input.type = 'hidden';
       			input.name = 'chnum';
       			input.value = chnum;
       			
       			let inputToken = document.createElement('input');
        		inputToken.type = 'hidden';
        		inputToken.name = '${_csrf.parameterName}';
        		inputToken.value = '${_csrf.token}';
        		
        		form.appendChild(input);
        		form.appendChild(inputToken);
       			form.action = "/admin/remove-challenge";
        		form.method = "POST";
        		document.body.appendChild(form);
        		form.submit();
       		} else {
       			alert('취소되었습니다.');
       		}
       	}

       	onload = function(){
	      	if("<c:out value='${param.page}'/>" == ""){
	      		const page_num_1 = document.getElementById("page_num_1");
	      		page_num_1.style.backgroundColor = "#99FFCD";
	      		page_num_1.style.color = "black";
	      	}
       	}
    </script>
	<script src="https://kit.fontawesome.com/392c986039.js" crossorigin="anonymous"></script></head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">챌린지 리스트 &#x1F4CB</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>

            <div class="admin_challenge_container">
           	<c:forEach items="${list}" var="dto" varStatus="status">
       			<form class="admin_challenge_list" action="javascript:confirmRemove('${dto.chname}', ${dto.chnum}, ${challengingMember[status.index]})">
					<div class="admin_challenge_list_img">
						<img src="/images/${dto.chimgname}" alt="challenge image" width="320px" height="200px">
					</div>
					<ul class="admin_challenge_list_info">
						<li>
							<h3>챌린지명 : ${dto.chname}</h3>
						</li>
						<li>
							<h3>챌린지 설명</h3>
							<p>${dto.chdesc}</p>
						</li>
					</ul>
					<ul class="admin_challenge_list_info">
						<li>
							<h3>참여 인원 : ${challengingMember[status.index]}/${dto.chmaxp}</h3>
						</li>
						<li>
							<h3>완료 인원 : ${successMember[status.index]}/${dto.chmaxp}</h3>
						</li>	
						<li>
							<h3>달성률 : <fmt:formatNumber value="${checkCount[status.index] / dto.chmaxp}" type="percent"/></h3>
						</li>
						<li>
							<h3>기부처 : ${dto.donateco}</h3>
						</li>
						<li>
							<h3>기부 금액 : <fmt:formatNumber value="${dto.donatepay}" pattern="###,###"/>원</h3>
						</li>
					</ul>
					<div class="admin_challenge_list_x">
						<button class="deleteBtns" id="deleteBtn" title="삭제하기"><i class="fa-solid fa-x"></i></button>
					</div>
				</form>
			</c:forEach>
 			</div>
	        <div class="page_num_container">
	        	<c:forEach begin="1" end="${pageNum}" var="i">
	        		<a href="javascript:goPost('${i}')"><span class="page_num" id="page_num_${i}">${i}</span></a>
	        	</c:forEach>
	        </div>
        </div>
    </main>
 
</body>
</html>