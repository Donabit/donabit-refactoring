<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미라클모닝 인증페이지</title>
<script src="../js/check.js" defer></script>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/main_header.jsp" %>
</head>
<body>
	<div class="check_container">
				<form action="/checkmorningform" method="post" enctype="multipart/form-data">		
				
				<input type=hidden name="chnum" value="${param.chnum}">
				<input type=hidden id=nickname name="nickname" value="${principal.memberdto.nickname}"> 
				<input type=hidden id=checknum name="checknum" value="${result}">
				
				<div class=check>
					<label for=checktitle class=check_label>제목</label>
					<div class="check_input">
						<input type=text id=checktitle name="checktitle" maxlength='15' placeholder="최대 15글자(공백포함)"> <br>
					</div>
				</div>
					
				<div class=check>
					<label for=checkdesc class=check_label>설명</label>
					<div class="check_input">
						<textarea id=checkdesc name="checkdesc" maxlength='65'  placeholder="최대 65글자(공백포함)" ></textarea>
					</div>
				</div>
					
				<div class=check>
					<div class="check_label">
						<label for=checkimg class=check_label>이미지</label>
					</div>
					<div class="check_input">
						<img src="../img/upload_default.png" alt="default image for upload" id="uploadImage"><br>
						<small>(이미지 파일만 업로드 가능합니다)</small><br>
						<input type=file id=uploadInput name="checkimg" accept="image/*">
					</div>
				</div>
					
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<button class=upload_btn type=submit>업로드</button>	
			
							
				</form>
			</div>
</body>
</html>
