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
            <h2>${challenge.chnum}</h2>
            <h2>${challenge.chname}</h2>
            <h2>${challenge.chdesc}</h2>
            <h2>${challenge.chimg.originalFilename}</h2>
            <h2>${challenge.chsuccess}</h2>
            <h2>${challenge.chdonate}</h2>
            <h2>${challenge.chexp}</h2>
            <h2>${challenge.chmaxp}</h2>
            <h2>${challenge.chsdate}</h2>
            <h2>${challenge.chedate}</h2>
            <h2>${challenge.donateco}</h2>
            <h2>${challenge.donatepay}</h2>
        </div>
    </main>

</body>
</html>