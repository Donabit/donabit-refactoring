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
		.page_num_container {
			margin: 1em auto;
			text-align: center;
		}
		
		.page_num {
			padding: 1em;
		}

		.admin_challenge_list {
			display: flex;		
		}
		
		.admin_challenge_list_info {
			flex: 1 1 200px;
			padding: 1em;
		}
		
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">회원 리스트 &#x1F64B</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            </div>
           	<c:forEach items="${list}" var="dto">
				<form class="admin_challenge_list" style="border: 1px solid black" action="remove-challenge" method="post">
					<div class="admin_challenge_list_info">
						<img src="/images/${dto.chimgname}" alt="challenge image" width="320px" height="200px">
					</div>
					<div class="admin_challenge_list_info">
						<input type="hidden" name="chnum" value="${dto.chnum}">
						<h3>챌린지명 : ${dto.chname}</h3>
						<h3>챌린지 설명</h3>
						<p>${dto.chdesc}</p>
					</div>
					<div class="admin_challenge_list_info">
						<h3>참여 인원 : 00/${dto.chmaxp}</h3>
						<h3>완료 인원 : 00/${dto.chmaxp}</h3>
						<h3>달성률 : 00%</h3>
						<h3>기부처 : ${dto.donateco}</h3>
						<h3>기부 금액 : <fmt:formatNumber value="${dto.donatepay}" pattern="###,###"/></h3>
					</div>
					<div class="admin_challenge_list_info">
						<button type="submit">삭제하기</button>
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