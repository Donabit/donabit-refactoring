<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
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
		
		.admin_sidebar_list:nth-child(4) {
			background-color: #94DAFF;
		}

		a[href="member-list"] {
			color: black;
			font-weight: 600;
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
            	<c:if test="${param.chnum > 0}">
	            	<span class="admin_member_result">챌린지명 : <b>${chname}</b> / </span>            	
            	</c:if>
            	
				<c:choose>
					<c:when test="${param.chnum == 0 || empty param}">
		            	<span class="admin_member_result">조회 결과 : <b>${memberCount}</b>명</span>
					</c:when>
					<c:otherwise>
		            	<span class="admin_member_result">조회 결과 : <b>${chmemberCount}</b>명</span>
					</c:otherwise>
				</c:choose>

	            <form class="admin_member_searchbar_orderby" action="/admin/member-list" method="POST">
	            	<select name="chnum" onchange="this.form.submit()">
	            		<option>== 챌린지별 조회하기 ==</option>
	            		<option value="0">전체 조회</option>
	            		<c:forEach items="${chnameList}" var="namelist">
	            			<option value="${namelist.chnum}">${namelist.chname}</option>
	            		</c:forEach>
	            	</select>
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	            </form>
            </div>
				<div class="admin_member_table">
					<div class="admin_member_table_row">
						<div class="admin_member_table_cell">닉네임</div>
						<div class="admin_member_table_cell">이메일</div>
						<c:choose>
							<c:when test="${param.chnum == 0 || empty param}">
				            	<div class="admin_member_table_cell">참여중 챌린지 수</div>
								<div class="admin_member_table_cell">완료 챌린지 수</div>
							</c:when>
							<c:otherwise>
				            	<div class="admin_member_table_cell">참여중/완료</div>
							</c:otherwise>
						</c:choose>
						<div class="admin_member_table_cell">인증 횟수</div>
						<div class="admin_member_table_cell">누적 신고 횟수</div>
						<div class="admin_member_table_cell">레벨</div>
						<c:choose>
							<c:when test="${param.chnum == 0 || empty param}">
				            	<div class="admin_member_table_cell">권한</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						
						
					</div>
					
					
					<c:choose>
						<c:when test="${param.chnum == 0 || empty param}">
							<c:forEach items="${list}" var="dto" varStatus="status">
								<div class="admin_member_table_row">
									<div class="admin_member_table_cell">${dto.nickname}</div>
									<div class="admin_member_table_cell">${dto.email}</div>
					            	<div class="admin_member_table_cell">${challengingCount[status.index]}</div>
									<div class="admin_member_table_cell">${successCount[status.index]}</div>
									<div class="admin_member_table_cell">${checksCount[status.index]}</div>
									<div class="admin_member_table_cell">${reportCount[status.index]}</div>
									<div class="admin_member_table_cell">${levellist[status.index]}</div>
									<div class="admin_member_table_cell">${dto.auth}</div>	
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${memberInfoByNumber}" var="memberInfo" varStatus="infoStatus">
								<div class="admin_member_table_row">
									<div class="admin_member_table_cell">${memberInfo.nickname}</div>
									<div class="admin_member_table_cell">${memberInfo.email}</div>
									<div class="admin_member_table_cell">
										<c:if test="${memberInfo.personalpf == 0}">
											참여중
										</c:if>
										<c:if test="${memberInfo.personalpf == 1}">
											완료
										</c:if>
									</div>
									<div class="admin_member_table_cell">${memberChecksByNumber[infoStatus.index]}</div>
									<div class="admin_member_table_cell">${memberReportByNumber[infoStatus.index]}</div>
									<div class="admin_member_table_cell">${memberInfo.level}</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
 
    </main>
 
</body>
</html>