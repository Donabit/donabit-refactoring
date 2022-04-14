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


    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
    <main class="admin_main_container">
        <div class="admin_main_contents">
            <h2 class="admin_main_header">챌린지 리스트 &#x1F4CB</h2>
            <br>
            <hr style="border: 1px solid black;">
            <br>
            <div style="border: 1px solid black">
	            <img src="../img/logo_m.png" alt="이미지">
	            <div>챌린지명, 챌린지 설명, 기간(남은 일수)</div>
	            <div>참여 인원 : 00/00(00%), 완료 인원 : 00/00(00%), 달성률 00%, 기부처, 기부 금액</div>
	            <div>삭제 버튼</div>
            </div>

            
        </div>
    </main>
 
</body>
</html>