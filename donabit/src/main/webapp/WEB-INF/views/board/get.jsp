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
 
<link rel="stylesheet" type="text/css" href="../css/boardget.css">

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

	<div class="btitle">
		<dl>
		<dt class="tname">제목</dt>
		<dd style="width:400px"><input type=text name="title" readonly="readonly" value='${pageInfo.title}' ></dd>
		</dl>
	</div>
	<div class="bwriter">
	<dl>
		<dt class="tname">작성자</dt>
		<dd style="width:400px"><input type=text name="writer" readonly="readonly" value='${pageInfo.writer}' ></dd>
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
