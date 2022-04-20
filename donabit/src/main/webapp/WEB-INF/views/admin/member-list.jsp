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
		.admin_member_table {
			display: table;
			width: 100%;
			border-collapse: collapse;
		}
		
		.admin_member_table_row {
			display: table-row;
		}
		
		.admin_member_table_row:first-child {
			font-weight: 600;
			background-color: lightgray;
		}
		
		.admin_member_table_cell {
			display: table-cell;
			border: 1px solid black;
			text-align: center;
			padding: 0.5em;
		}
		
		
		.admin_member_searchbar_orderby {
			float: right;
			margin-bottom: 1em;
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
            <div class="admin_member_searchbar">
            	<span class="admin_member_result">조회 결과 : </span>
            	<span class="admin_member_result"><b>${memberCount}</b>명 </span>
	            <form class="admin_member_searchbar_orderby">
	            	<label for="orderby">챌린지별 조회 : </label>
	            	<select name="orderby">
	            		<option value="">전체 조회</option>
	            		<c:forEach items="${chnameList}" var="namelist">
	            			<option value="${namelist.chnum}">${namelist.chname}</option>
	            		</c:forEach>
	            	</select>
	            	<button type="submit">검색</button>
	            </form>
            </div>
				<div class="admin_member_table">
					<div class="admin_member_table_row">
						<div class="admin_member_table_cell">닉네임</div>
						<div class="admin_member_table_cell">이메일</div>
						<div class="admin_member_table_cell">참여중 챌린지 수</div>
						<div class="admin_member_table_cell">완료 챌린지 수</div>
						<div class="admin_member_table_cell">인증 횟수</div>
						<div class="admin_member_table_cell">누적 신고 횟수</div>
						<div class="admin_member_table_cell">레벨</div>
						<div class="admin_member_table_cell">권한</div>
					</div>
		           	<c:forEach items="${list}" var="dto" varStatus="status">
						<div class="admin_member_table_row">
							<div class="admin_member_table_cell">${dto.nickname}</div>
							<div class="admin_member_table_cell">${dto.email}</div>
							<div class="admin_member_table_cell">${challengingCount[status.index]}</div>
							<div class="admin_member_table_cell">${successCount[status.index]}</div>
							<div class="admin_member_table_cell">${checksCount[status.index]}</div>
							<div class="admin_member_table_cell">신고444</div>
							<div class="admin_member_table_cell">${dto.level}</div>
							<div class="admin_member_table_cell">${dto.auth}</div>
						</div>
					</c:forEach>
				</div>
 
        <div class="page_num_container">
        	<c:forEach begin="1" end="${pageNum}" var="i">
        		<a href="javascript:goPost('${i}')"><span class="page_num">${i}</span></a>
        	</c:forEach>
        </div>
    </main>
 
</body>
</html>