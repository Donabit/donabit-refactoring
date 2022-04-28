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
		.admin_report_container {
			display: flex;
			flex-wrap: wrap;
			
		}
		
		.admin_report_list {
			width: 270px;
			height: auto;
			margin-right: 2em;
			margin-bottom: 2em;
			border: 1px solid dimgray;
		}
		
		.admin_report_list_imgcontainer {
			text-align: center;	
		}
		
		.admin_report_list_img {
			margin-top: 0.5em;
			width: 250px;
			height: 250px;
		}
		
		.admin_report_list_header, .admin_report_list_meta {
			margin-left: 0.5em;
		}
		
		.admin_report_list_header {
			margin-top: 0.5em;
		}
		
		.admin_sidebar_list:nth-child(5) {
			background-color: #B983FF;
		}

		a[href="report"] {
			color: black;
			font-weight: 600;
		}
		
		.admin_report_list_header {
			display: flex;
			justify-content: space-between;
		}
		
		#deleteBtn {
			margin-right: 0.7em;
			background-color: transparent;
			border: none;
			cursor: pointer;
		}
		
		#reportisZero{
			padding-top: 15em;
			margin: auto;
		}
		
    </style>
    <script src="https://kit.fontawesome.com/392c986039.js" crossorigin="anonymous"></script>    
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">신고 내역 &#x1F6A8</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            
            	<p class="admin_report_count">조회 결과 : <b>${reportCount}</b>개</p>
            	<br>
	            <div class="admin_report_container">
		            <c:if test="${reportCount == 0}">
		            	<h3 id="reportisZero">신고 내역이 없습니다.</h3>
		            </c:if>
	            	<c:if test="${reportCount > 0}">
			            <c:forEach items="${list}" var="dto" varStatus="status">
				            	<div class="admin_report_list">
				            		<form class="admin_report_list_header" action="delete-report" method="POST">
				            			<p class="admin_report_list_chname">챌린지명 : ${chname[0]}</p>
				            			<input type="hidden" name="checkid" value="${dto.checkid}" />
				            			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				            			<span><button id="deleteBtn" title="삭제하기" onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}"><i class="fa-solid fa-x"></i></button></span>
				            		</form>
				            		<div class="admin_report_list_imgcontainer">
				            			<img class="admin_report_list_img" src="/images/${dto.checkimg}" alt="인증이미지"/>
				            		</div>
				            		<div class="admin_report_list_meta">
				            			<p>글쓴이 : ${dto.nickname}</p>			            		
				            			<p>제목 : ${dto.checktitle}</p>
				            			<p>설명 : ${dto.checkdesc}</p>
				            			<span>${dto.checktime} / </span>
				            			<span>신고 횟수 : ${dto.report}</span>
				            		</div>
				            	</div>
			            </c:forEach>
		            </c:if>
	            </div>
            
            
		</div>
    </main>
 
</body>
</html>