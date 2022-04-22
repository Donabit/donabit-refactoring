<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="css/deleteview.css">
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
<div class="wrapper">
  <div class="title"><h1 style="font-size: 30px;"> 회원탈퇴 </h1></div>
<hr/>
<br>
  <form action="/deletemember" method="post" id="deleteForm" name="deleteForm">
  <input type="hidden" id="email" name="email" value="${principal.memberdto.email}">
                <h3>회원탈퇴를 하려면 비밀번호를 입력해주세요.</h3>
               <br>
                <div class="password"> 
                    <input type="password" id = "memberPw" name="memberPw" placeholder="비밀번호 입력" />
                </div>
                 <br>
				  <hr/>
				  <br>
				 <div class="buttons-wrapper">
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                <div class="buttons-left"><button type="button" id="deletemember" name="deletemember" class="btn-gradient small" >회원탈퇴</button></div>
                 <div class="buttons-right"><a href="/mypage"><button id="cancle" type="button" class="btn-gradient small">취소</button></a></div>
  		</div>
  		
    </form>

</div>
</body>
</html>