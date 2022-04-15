<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<div class="container">
	<form action="/loginform" method="post">
		<div class="form-group">
			<label for="email">Email</label> 
			<input type="text" class="form-control" placeholder="Enter email" id="email" name="email">
		</div>
				
		<div class="form-group">
			<label for="password">Password</label> 
			<input type="password" class="form-control" placeholder="Enter password" id="password" name="password">
		</div>
		
		<div class="form-group form-check">
			<label class="form-check-label"> 
			<input class="form-check-input" type="checkbox" name="remember"> Remember me
			</label>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<button class="btn btn-primary">로그인</button>
	</form>
	
	<a href="/joinform">회원가입</a>
	
</div>
</body>
</html>