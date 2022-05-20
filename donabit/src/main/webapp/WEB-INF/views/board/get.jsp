<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="stylesheet" type="text/css" href="../css/main_header.css">
<link rel="stylesheet" href="../css/ch-community.css">
<link rel="stylesheet" type="text/css" href="../css/boardget.css">
<script src="mybatis_spring.js" defer></script>

<script src="../js/main_header.js" defer></script>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>

<body>

		<%@ include file="/WEB-INF/views/main_header.jsp" %>
		<img id="coimg" src="../img/challenge/community.svg">
		
<section class="notice">
<div class="ptitle">

<div class="titleArea firstTitleArea">
<h2><font color="#555555">공지사항</font></h2>
</div>

<div class="ncontainer">
	<h1><font color="#555555">Donabit 최신 소식을 읽어보세요!</font></h1>
</div>

</div>

<div class="wrapper">

	<div class="btitle">
		<dl>
		<dt class="tname">제목</dt>
		<dd style="width:80%"><input type=text name="title" readonly="readonly" value='${pageInfo.title}' ></dd>
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
	
		<textarea rows="3" name="content" readonly="readonly">${pageInfo.content}</textarea>
	
	</div>
	
	<div class="buttons-wrapper">
		<div class="buttons-left"><button class="btn-gradient small" id="list_btn">목록</button></div> 
		
		
		<!-- <a class="btn" id="list_btn">목록</a> -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="buttons-right"><button class="btn-gradient small" id="modify_btn">수정하기</button></div>
		</sec:authorize>
		
	</div>
    
	<form id="infoForm" action="/board/modify" method="get">
	<input type="hidden" id="bno" name="bno" value='${pageInfo.bno}'>
	</form>
</div>
	
</section>
	
	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
</script>

</body>
<%@ include file="/WEB-INF/views/main_footer.jsp" %>
</html>
