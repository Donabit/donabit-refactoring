<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>회원가입 페이지</title>
<script src="../jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//spring security - ajax post 방식으로 요청시 추가
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
	xhr.setRequestHeader(header, token);
});

	$(document).ready(function(){
		
		 $("#submit").on("click", function(){
		     
		      if($("#password").val() != $("#password2").val()){
		          alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		          $("#password").focus();
		          return false; 
		      }
		      
		      if($("input[name='checked_email']").val()==''){
		          alert('이메일중복 확인을 해주세요.');
		          $("input[name='checked_email']").eq(0).focus();
		          return false;
		      	}
		      
		      if($("input[name='checked_nick']").val()==''){
		          alert('닉네임중복 확인을 해주세요.');
		          $("input[name='checked_nick']").eq(0).focus();
		          return false;
		      	}
		     
		    });
		  })
		  
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
		          $("input[name=checked_nick]").val('y');
		        }else {
		          alert("닉네임을 입력해주세요.");
		        }
		      }
		    })
		  };
		  
		function fn_emailchk(){
		    $.ajax({
		      url : "/emailchk",
		      type : "post",
		      dataType : "json",
		      data : {"email" : $("#email").val()},
		      success : function(data){
		        if(data == 1){
		          alert("중복된 이메일입니다.");
		        }else if(data == 0){
		          $("#emailchk").attr("value", "Y");
		          alert("사용가능한 이메일입니다.");
		          $("input[name=checked_email]").val('y');
		        }else {
		          alert("이메일을 입력해주세요.");
		        }
		      }
		    })
		  };


		  
		
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<h1> Join Us !! </h1>
<hr/>
<form action="/joinresult" method="post">
<input type="hidden" name="checked_email" value="">
<input type="hidden" name="checked_nick" value="">
 아이디(이메일 형식):<input type=text id=email name=email required>
  <button class="emailchk" type="button" id="emailchk" onclick="fn_emailchk();" value="N">중복확인</button>  
 <br>
 닉네임:<input type=text id=nickname name=nickname required>
 <button class="nickchk" type="button" id="nickchk" onclick="fn_nickchk();" value="N">중복확인</button>
 <br>
 비밀번호:<input type=password id=password name=password required><br>
 비밀번호 확인:<input type=password id=password2 name=password2 required><br>
 휴대폰번호:<input type=text name=phone ><br>
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 <input type=submit id="submit" value=회원가입 > &nbsp; <a href="/main">취소</a>
 </form>
 
</body>
</html>