<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
			padding: 1em;
		}
		
		.page_num:hover {
			color: olive;
		}

		.admin_challenge_list {
			display: flex;		
		}
		
		.admin_challenge_list_info {
			flex: 1 1 200px;
			padding: 1em;
		}
		
    </style>
    <script type="text/javascript">
       	function goPost(page) {
			let form = document.createElement('form');
    		let input = document.createElement('input');
    		input.type = 'hidden';
    		input.name = 'page';
    		input.value = page;
    		
    		form.appendChild(input);
    		form.action = "/admin/challenge-list";
    		form.method = "POST";
    		document.body.appendChild(form);
    		form.submit();
	    }
		
       	
       	function confirmRemove(chname, chnum){
       		let result = confirm("정말로 삭제하시겠습니까? 챌린지명: " + chname);
       		if(result == true){
       			let form = document.createElement('form');
       			let input = document.createElement('input');
       			input.type = 'hidden';
       			input.name = 'chnum';
       			input.value = chnum;
       			
        		form.appendChild(input);
       			form.action = "/admin/remove-challenge";
        		form.method = "POST";
        		document.body.appendChild(form);
        		form.submit();
       		} else {
       			alert('취소되었습니다.');
       		}
       	}

    </script>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">챌린지 리스트 &#x1F4CB</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            </div>
           	<c:forEach items="${list}" var="dto" varStatus="status">
       			<form class="admin_challenge_list" style="border: 1px solid black" action="javascript:confirmRemove('${dto.chname}', ${dto.chnum})">
					<div class="admin_challenge_list_info">
						<img src="/images/${dto.chimgname}" alt="challenge image" width="320px" height="200px">
					</div>
					<div class="admin_challenge_list_info">
						<h3>챌린지명 : ${dto.chname}</h3>
						<h3>챌린지 설명</h3>
						<p>${dto.chdesc}</p>
					</div>
					<div class="admin_challenge_list_info">
						<h3>참여 인원 : ${challengingMember[status.index]}/${dto.chmaxp}</h3>
						<h3>완료 인원 : ${successMember[status.index]}/${dto.chmaxp}</h3>
						<h3>달성률 : <fmt:formatNumber value="${checkCount[status.index] / dto.chmaxp}" type="percent"/></h3>
						<h3>기부처 : ${dto.donateco}</h3>
						<h3>기부 금액 : <fmt:formatNumber value="${dto.donatepay}" pattern="###,###"/></h3>
					</div>
					<div class="admin_challenge_list_info">
						<button id="deleteBtn">삭제하기</button>
					</div>
				</form>
			</c:forEach>
 
        <div class="page_num_container">
        	<c:forEach begin="1" end="${pageNum}" var="i">
        		<a href="javascript:goPost('${i}')"><span class="page_num">${i}</span></a>
        	</c:forEach>
        </div>
    </main>
 
</body>
</html>