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
		
	});
	
	function fn_nickchk(){
	    $.ajax({
	      url : "/nickchk",
	      type : "post",
	      dataType : "json",
	      data : {"nickname" : $("#nickname").val()},
	      success : function(data){
	        if(data == 1){
	          alert("중복된 닉네임입니다.");
	        }else if(data == 0){
	          $("#nickchk").attr("value", "Y");
	          alert("사용가능한 닉네임입니다.");
	        }else {
	          alert("닉네임을 입력해주세요.");
	        }
	      }
	    })
	  };
	
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<form action="memberupdate" method="post">
 회원아이디:<input type=text name=email value="${principal.memberdto.email}" readonly="readonly"><br>
 변경할 닉네임:<input type=text value="${principal.memberdto.nickname}" id=nickname name=nickname >
 <button class="nickchk" type="button" id="nickchk" onclick="fn_nickchk();" value="N">중복확인</button>
 <br>
 변경할 휴대폰번호:<input type=text value="${principal.memberdto.phone}" name=phone ><br>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 <input type=submit value=회원정보수정  > &nbsp; <a href="/mypage">취소</a>
 </form>
</body>
</html>