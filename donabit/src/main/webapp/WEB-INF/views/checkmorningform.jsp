<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미라클모닝 인증페이지</title>
<script src="../js/check.js" defer></script>
<link rel="stylesheet" href="css/check.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--  <script type="text/javascript">
            function reload(event){
            		event.form.submit();
          			close();
		           /*  window.open("about:blank", "_self").close(); //자식창 close
		            this.window.opener.location.reload(); //새로고침 */
          	};
       
</script> -->
</head>
<body>
	<div class="check_container">
				<form action="/checkmorningform" method="post" enctype="multipart/form-data" id="checkmorningform">		
				
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
				 <button class=upload_btn id="clickme" type="submit" >업로드</button>
				<!-- <a href="#"  class=upload_btn id="clickme" onclick="document.getElementById('checkmorningform').submit();"> 업로드 </a> -->
			
							
				</form>
			</div>
</body>
</html>
