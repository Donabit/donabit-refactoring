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
<c:if test="${result == 1}">
	<h1>비밀번호 수정 완료</h1>
	정보가 수정되었으니 다시 로그인해주셔야 합니다.
</c:if>

<a href="/logout"> 메인페이지로 </a>
</body>
</html>