<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>    
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
<form action="memberupdate" method="post">
 회원아이디:<input type=text name=email value="${principal.memberdto.email}" readonly="readonly"><br>
 변경할 닉네임:<input type=text value="${principal.memberdto.nickname}" name=nickname ><br>
 변경할 휴대폰번호:<input type=text value="${principal.memberdto.phone}" name=phone ><br>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 <input type=submit value=회원정보수정  ><br>
 </form>
</body>
</html>