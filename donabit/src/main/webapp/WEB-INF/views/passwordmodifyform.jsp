<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>비밀번호수정</title>
<link rel="stylesheet" type="text/css" href="css/passwordmodifyform.css">
<script type="text/javascript">

//spring security - ajax post 방식으로 요청시 추가
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
	xhr.setRequestHeader(header, token);
});

	$(document).ready(function(){
		
		$("#passwordmodify").on("click", function(){
			//alert($("#memberPw").val());
			if($("#memberPw").val()==""){
				alert("현재 비밀번호를 입력해주세요");
				$("#memberPw").focus();
				return false;
			}
			
			if($("#password").val()==""){
				alert("변경할 비밀번호를 입력해주세요");
				$("#password").focus();
				return false;
			}
			
			if($("#password2").val()==""){
				alert("변경할 비밀번호확인을 입력해주세요");
				$("#password2").focus();
				return false;
			}
			
			if ($("#password").val() != $("#password2").val()) {
				alert("변경비밀번호가 일치하지 않습니다.");
				$("#password2").focus();
				return false;
				
			}
			
			$.ajax({
				url : "/pwcheck",
				type : "POST",
				dataType : "json",
				data : $("#passwordmodifyForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						alert("비밀번호를 확인해주세요.");
						return;
					}else{
						if(confirm("변경하시겠습니까?")){
							$("#passwordmodifyForm").submit();
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
<div class="wrapper">
  <div class="title"><h1 style="font-size: 30px;"> 비밀번호변경 </h1></div>
<hr/>
<br>
<form action="passwordmodify" method="post" id="passwordmodifyForm" name="passwordmodifyForm">
 
<div class="email">
 <h5>회원아이디</h5><input type=text name=email value="${principal.memberdto.email}" readonly="readonly"><br>
</div>
<div class="password"> 
 <h5>기존 비밀번호</h5><input type=password id=memberPw name=memberPw required><br>
 </div>
 <div class="password"> 
 <h5>변경할 비밀번호</h5><input type=password id=password name=password ><br>
 </div>
<div class="password">  
 <h5>변경할 비밀번호 확인</h5><input type=password id=password2 name=password2 ><br>
 </div>
 
  <br>
  <hr/>
  <br>
 <div class="buttons-wrapper">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 

 <div class="buttons-left"><button type="button" id="passwordmodify" name="passwordmodify" class="btn-gradient small">수정하기</button> </div>
 <div class="buttons-right"><a href="/mypage"><button id="cancle" type="button" class="btn-gradient small">취소</button></a></div>
 </div>
 
 </form>
 
 </div>
</body>
</html>

