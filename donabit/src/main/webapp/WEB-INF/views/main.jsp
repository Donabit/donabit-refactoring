<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit Main</title>

<script src="resources/jquery-3.6.0.min.js"></script>
 <script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>

<%@ include file="/WEB-INF/views/main_header.jsp" %>
<%@ include file="/WEB-INF/views/main_body.jsp" %>
<%@ include file="/WEB-INF/views/main_footer.jsp" %>

</body>
</html>
