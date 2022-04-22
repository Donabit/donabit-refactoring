<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="stylesheet" type="text/css" href="css/loginform.css">
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<div class="wrapper">
<div class="title"><h1 style="font-size: 30px;"> 로그인 </h1></div>
<hr/>
<br>

	<form action="/loginProc" method="post">
		<div class="email">
			 
			<input type="text" class="form-control" placeholder="아이디(E-mail)" id="email" name="email" required>
		</div>
				
		<div class="password">
			
			<input type="password" class="form-control" placeholder="비밀번호" id="password" name="password" required>
		</div>
		
		<!-- <div class="form-group form-check">
			<label class="form-check-label"> 
			<input class="form-check-input" type="checkbox" name="remember"> Remember me
			</label>
		</div> -->
		<br>
		<hr/>
		<br>
		
		<div class="buttons-wrapper">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		
		
		<div class="buttons-left"><a href="/joinform"><button id="join" type="button" class="btn-gradient small">회원가입</button></a></div>
		<div class="buttons-right"><button id="btn_submit" type=submit class="btn-gradient small" >로그인</button> </div>
		</div>
	</form>
	
	
	
</div>
</body>
</html>