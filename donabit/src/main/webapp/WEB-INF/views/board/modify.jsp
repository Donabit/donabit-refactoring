<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>게시물 조회 페이지</title>

<script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="#.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>

<!-- <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}

#delete_btn{
    background-color: #f3e3e7;
}
</style>
 -->

<body>
<h1>조회 페이지</h1>
	<form id="modifyForm" action="/board/modify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='${pageInfo.bno}' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" value='${pageInfo.title}' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content">${pageInfo.content}</textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='${pageInfo.writer}' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='${pageInfo.regdate}' >
	</div>
	
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a>

		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <a class="btn" id="modify_btn">수정 완료</a>
        
    	</div>
		</form>
        
        <form id="deleteForm" action="/board/delete" method="post">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <input name="bno" readonly="readonly" type="hidden" value='${pageInfo.bno}' >
	        <a class="btn" id="delete_btn">삭제</a>
        </form>
        
        
        
        <a class="btn" id="cancel_btn">수정 취소</a>
    
	<form id="infoForm" action="/board/modify" method="get">
	<input type="hidden" id="bno" name="bno" value='${pageInfo.bno}'>
	</form>
	
	
	<form action="/modfiy" method="GET"> 
	
		<input type="text" name="bno">
		<input type="submit" value="전송">
		
		<button type="submit"></button>
		
	</form>
	 
<script>

	let form = $("#infoForm");        // 게시물 이동 form (리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 게시물 데이터 수정 form
	let dForm = $("#deleteForm");

	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
    form.find("#bno").remove();
    form.attr("action", "/board/list");
    form.submit();
});

	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
    mForm.submit();
});

	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
    form.attr("action", "/board/get");
    form.submit();
});  
	
	/* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        dForm.submit();
    });
	
</script>

</body>
</html>