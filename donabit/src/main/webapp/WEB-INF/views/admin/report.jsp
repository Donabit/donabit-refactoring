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
		}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">신고 내역 &#x1F6A8</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            
	            <div class="admin_report_container">
		            <c:forEach items="${list}" var="dto" varStatus="status">
			            	<div class="admin_report_list">
			            		<div class="admin_report_list_header">
			            			<p>챌린지명 : ${chname[0]}</p>
			            		</div>
			            		<div class="admin_report_list_imgcontainer">
			            			<img class="admin_report_list_img" src="/images/${dto.checkDTO.checkimg2}" alt="인증이미지"/>
			            		</div>
			            		<div class="admin_report_list_meta">
			            			<p>글쓴이 : ${dto.checkDTO.nickname}</p>			            		
			            			<p>제목 : ${dto.checkDTO.checktitle}</p>
			            			<p>설명 : ${dto.checkDTO.checkdesc}</p>
			            			<span>${dto.checkDTO.checktime} / </span>
			            			<span>신고 횟수 : ${dto.report}</span>
			            		</div>
			            	</div>
		            </c:forEach>
	            </div>
            
            
		</div>
    </main>
 
</body>
</html>