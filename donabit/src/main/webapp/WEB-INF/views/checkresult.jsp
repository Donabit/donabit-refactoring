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
<div class="checkresult_container">
		<div class="header">1.미라클모닝</div>
		<div class="section">
			<div class="containerflex">
				<c:forEach items="${checklist}" var="dto">
					<div class="item">
						<div class="checkimg">
							${dto.checktitle}<br>
							${dto.checkdesc}<br>
							${dto.checkimg}<br>
						</div>

					</div>
				</c:forEach>
			</div>
		</div>
</div>
</body>
</html>
