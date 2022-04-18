<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미라클모닝 인증페이지</title>
<script src="resources/jquery-3.6.0.min.js"></script>

 <script src="mybatis_spring.js" defer></script>
<link rel="stylesheet" href="css/check.css">


<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<div class="check_container">
				<form action="/checkmorninglist" method="post" enctype="multipart/form-data">		
				<input type=hidden name="chnum" value="2">
				
				<div class=check>
					<label for=nickname class=check_label>닉네임</label>
					<div class="check_input">
						<input type=text id=nickname name="nickname"> <br>
					</div>
				</div>
					
				<div class=check>
					<label for=checknum class=check_label>체크번호</label>
					<div class="check_input">
						<input type=text id=checknum name="checknum" > <br>
					</div>
				</div>
					
				<div class=check>
					<label for=checktitle class=check_label>제목</label>
					<div class="check_input">
						<input type=text id=checktitle name="checktitle"> <br>
					</div>
				</div>
					
				<div class=check>
					<label for=checkdesc class=check_label>설명</label>
					<div class="check_input">
						<textarea id=checkdesc name="checkdesc" ></textarea>
					</div>
				</div>
					
				<div class=check>
					<div class="check_label">
						<label for=checkimg class=check_label>이미지</label>
					</div>
					<div class="check_input">
						<input type=file id=checkimg name="checkimg" accept="image/*" onchange="loadFile(this)"><br>
					</div>
				</div>
					
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<button class=upload_btn type=submit>업로드</button>	
			
							
				</form>
			</div>
</body>
</html>
