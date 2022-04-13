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

        .sidebar {
            float: left;
            height: 70em;
            width: 320px;
            background-color: darkgrey;
            
        }

        .sidebar_list {
            padding: 1em;
        }

        .sidebar_list:hover {
            background-color: dimgray;
        }

        .admin_container {
            height: 70em;
            background-color: whitesmoke;
        }

    </style>
</head>
<body>
    <ul class="sidebar">
        <h1>로고</h1>
        <li class="sidebar_list">챌린지 만들기</li>
        <li class="sidebar_list">챌린지 리스트</li>
        <li class="sidebar_list">회원 리스트</li>
        <li class="sidebar_list">신고 내역</li>
        <li class="sidebar_list">User Custom Challenge</li>
        <li class="sidebar_list">CS(Chatbot)</li>
    </ul>
    <main class="admin_container">
        <div class="admin_contents">
            <h2>챌린지 만들기</h2>
            <hr>
            <form action="/adminresult" method="post" enctype="multipart/form-data">
                챌린지 이름 : <input type="text" name="chname"> <br>
                챌린지 설명 : <textarea name="chdesc"></textarea> <br>
                챌린지 이미지 : <input type="file" name="chimg"> <br>
                챌린지 개인챌린지 성공 조건 : <input type="number" name="chsuccess"> 횟수<br>
                챌린지 기부 조건 : <input type="number" name="chdonate"> 횟수<br>
                챌린지 경험치 : <input type="number" name="chexp"> <br>
                챌린지 최대 모집 인원 : <input type="number" name="chmaxp"> <br>
                챌린지 시작일 : <input type="date" name="chsdate"> <br>
                챌린지 만료일 : <input type="date" name="chedate"> <br>
                기부처 : <input type="text" name="donateco"> <br>
                기부금액 : <input type="text" name="donatepay"> <br>
                <input type="submit">
            </form>
        </div>
    </main>

</body>
</html>