<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ include file="/WEB-INF/views/main_header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>게시물 조회 페이지</title>

<script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="../css/boardmodify.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>

<body>
<section class="notice">
<div class="ptitle">
<h3>Donabit Notice</h3>
</div>

<div class="wrapper">
	<form id="modifyForm" action="/board/modify" method="post">
	
	<div class="btitle">
		<dl>
		<dt class="tname">제목</dt>
		<dd style="width:80%"><input type=text name="title" value='${pageInfo.title}' ></dd>
		</dl>
	</div>
	<div class="bwriter">
	<dl>
		<dt class="tname">작성자</dt>
		<dd style="width:80%"><input type=text name="writer" readonly="readonly" value='${pageInfo.writer}' ></dd>
	</dl>
	</div>
	<div class="binfo">
		<dl>
		<dt class="tname">번호</dt>
		<dd><input name="bno" readonly="readonly" value='${pageInfo.bno}' ></dd>
		</dl>
		<dl>
		<dt class="tname">등록일</dt>
		<dd><input name="regdater" readonly="readonly" value='${pageInfo.regdate}' ></dd>
		</dl>
	</div>
	<div class="bcontents">
	
		<textarea rows="3" name="content">${pageInfo.content}</textarea>
	
	</div>
	

	
	<div class="buttons-wrapper">
		
		<!-- <div class="buttons-first"><button class="btn-gradient small" onclick="history.back()">목록</button></div> -->

		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="list" />
        <div class="buttons-second"><button class="btn-gradient small" id="modify_btn">수정</button></div>
        
		</form>
        
        <form id="deleteForm" action="/board/delete" method="post">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <input name="bno" readonly="readonly" type="hidden" value='${pageInfo.bno}' >
	        <div class="buttons-third"><button class="btn-gradient small" id="delete_btn">삭제</button></div>
        </form>
     	
     </div>
        
        
        <!-- <a class="btn" id="cancel_btn">수정 취소</a> -->
    
    
    
	<form id="infoForm" action="/board/modify" method="get">
	<input type="hidden" id="bno" name="bno" value='${pageInfo.bno}'>
	</form>
	
</div>
</section>	
	
<!-- 	<form action="/modfiy" method="GET"> 
	
		<input type="text" name="bno">
		<input type="submit" value="전송">
		
		<button type="submit"></button>
		
	</form> -->
	 
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
	/* $("#cancel_btn").on("click", function(e){
    form.attr("action", "/board/get");
    form.submit();
});  */ 
	
	/* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        dForm.submit();
    });
	
</script>

</body>
<%@ include file="/WEB-INF/views/main_footer.jsp" %>
</html>
