<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 로그인</title>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="stylesheet" type="text/css" href="css/loginform.css">
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>

<div class="title"><a href="/main">
<img src="/img/logo.png" height="150px"></a></div>

<div class="login0">
	<div class="login1">
		<form action="/loginProc" method="post">
		<h2><font color="#555555">로그인</font></h2>
		
<!-- 		<div id="btn_group">
		<button id="test_btn1">회원</button>
		<a href="/main">
			<button id="test_btn2">더 구경할래요</button>
		</a>
		</div> -->
		
		<div class="email">
			 
			<input type="text" class="form-control" placeholder="&nbsp 아이디 (E-mail)" id="email" name="email" required>
		</div>
				
		<div class="password">
			
			<input type="password" class="form-control" placeholder="&nbsp 비밀번호" id="password" name="password" required>
		</div>
		
		<!-- <div class="form-group form-check">
			<label class="form-check-label"> 
			<input class="form-check-input" type="checkbox" name="remember"> Remember me
			</label>
		</div> -->
		<br>
		<br>
		
		<div class="buttons-wrapper">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 	
		<div class="buttons-left"><button id="btn_submit" type=submit class="btn-gradient" >로그인</button> </div> <br>
		<div class="buttons-left"><a class="join_href" href="/joinform"><button id="join" type="button" class="btn-gradient">회원가입</button></a></div>
		</div>
	</form>
	</div>
	<div class="login2">
	<img src="../img/select.png" width=600px height=600px>
	</div>
	
</div>

<div class="loginf">
<h1><font color="#555555">Donabit Copyright © Donabit All Rights Reserved.</font></h1>
</div>

<%-- <div class="wrapper">
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
</div> --%>
</body>
</html>