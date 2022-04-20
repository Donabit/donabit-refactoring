<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<script src="../jquery-3.6.0.min.js"></script>
<script type="text/javascript">

//spring security - ajax post 방식으로 요청시 추가
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
	xhr.setRequestHeader(header, token);
});

	$(document).ready(function(){
		
		$("#deletemember").on("click", function(){
			
			if($("#memberPw").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#memberPw").focus();
				return false;
			}

			
			$.ajax({
				url : "/pwcheck",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						alert("비밀번호를 확인해주세요.");
						return;
					}else{
						if(confirm("탈퇴하시겠습니까?")){
							//alert($("#email").val());
							
							
							$("#deleteForm").submit();
						}
						
					}
				}
			})
		});
		
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

  <form action="/deletemember" method="post" id="deleteForm" name="deleteForm">
  <input type="hidden" id="email" name="email" value="${principal.memberdto.email}">
                <p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "memberPw" name="memberPw" placeholder="비밀번호 입력" />
                </div>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                <button type="button" id="deletemember" name="deletemember" >회원탈퇴</button> <a href="/mypage">취소</a>
  
    </form>


</body>
</html>