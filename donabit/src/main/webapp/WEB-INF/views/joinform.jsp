<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<h1> Join Us !! </h1>
<hr/>
<form action="/joinresult" method="post">
 아이디(이메일 형식):<input type=text name=email ><br>
 닉네임:<input type=text name=nickname ><br>
 암호:<input type=password name=password ><br>
 휴대폰번호:<input type=text name=phone ><br>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 <input type=submit value=회원가입  ><br>
 </form>
 
</body>
</html>