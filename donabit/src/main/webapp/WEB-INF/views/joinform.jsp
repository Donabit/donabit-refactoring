<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/main_header.jsp" %>     
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="css/joinform.css">
<script type="text/javascript">
//spring security - ajax post 방식으로 요청시 추가
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function (e, xhr, options) {
	xhr.setRequestHeader(header, token);
});

	$(document).ready(function(){
		
		 $("#btn_submit").on("click", function(){
			 
			 if(!$("#email_id").val()){
				   alert("이메일을 입력해주세요.");
			        $("#email_id").focus();
			        return false;
			      } 
			 if(!$("#email_domain").val()){
			        alert("이메일 도메인을 입력해주세요.");
			        $("#email_domain").focus();
			        return false;
			      } 
			 if(!$("#nickname").val()){
			        alert("닉네임을 입력해주세요.");
			        $("#nickname").focus();
			        return false;
			      } 
		     
		      if($("#password").val() != $("#password2").val()){
		          alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		          $("#password").focus();
		          return false; 
		      }
		      
		      if(!$("input[name='checked_email']").val()){
		          alert('이메일중복 확인을 해주세요.');
		          $("input[name='checked_email']").eq(0).focus();
		          return false;
		      	}
		      
		      if(!$("input[name='checked_nick']").val()){
		          alert('닉네임중복 확인을 해주세요.');
		          $("input[name='checked_nick']").eq(0).focus();
		          return false;
		      	}
		      
		     
		     
		    });
		  })
		  
		  		//이메일 직접입력
		function selectEmail(ele){ 
			var $ele = $(ele); 
			var $email_domain = $('input[name=email_domain]'); 
			// '1'인 경우 직접입력 
			if($ele.val() == "1"){ 
				$email_domain.attr('readonly', false); 
				$email_domain.val(''); 
			} else {
				$email_domain.attr('readonly', true); 
				$email_domain.val($ele.val()); 
				
			} 
		}
		
		//이메일 db로 합치기
		
		
	 function emailmerge() {
		
		var email_id =$("#email_id").val();
		var email_domain =$("#email_domain").val();
		var email ="";
		 
		  email = email_id+"@"+email_domain;
		  $("#email").val(email);  
		  
		  
		 };
		  
		  function fn_nickchk(){
		    $.ajax({
		      url : "/nickchk",
		      type : "post",
		      dataType : "json",
		      data : {"nickname" : $("#nickname").val()},
		      success : function(data){
		    	  if(!$("#nickname").val()){
		    		  alert("닉네임을 입력해주세요.");
		    		  return false;
		    	  } else {
			        if(data == 1){
			          alert("중복된 닉네임입니다.");
			        }else if(data == 0){
			          $("#nickchk").attr("value", "Y");
			          alert("사용가능한 닉네임입니다.");
			          $("input[name=checked_nick]").val('y');
			        }		         
		        }
		      }
		    })
		  };
		  
		function fn_emailchk(){
			emailmerge();
		    $.ajax({
		      url : "/emailchk",
		      type : "post",
		      dataType : "json",
		      data : {"email" : $("#email").val()},
		      success : function(data){
		    	  if(!$("#email_id").val()){
		    		  alert("이메일을 입력해주세요.");
		    		  return false;
		    	  } else{
			        if(data == 1){
			          alert("중복된 이메일입니다.");
			        }else if(data == 0){
			          $("#emailchk").attr("value", "Y");
			          alert("사용가능한 이메일입니다.");
			          $("input[name=checked_email]").val('y');
			        }
		          
		        }
		      }
		    })
		  };

		  $(function(){
		      //직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
		                //직접입력을 누를 때 나타남
				if($("#selbox").val() == "direct") {
					$("#selboxDirect").show();
				}  else {
					$("#selboxDirect").hide();
				}
			}) 
		});	
			
		  
		
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<div class="container">
	<form action="/joinresult" method="post">
	<input type="hidden" name="checked_email" value="">
	<input type="hidden" name="checked_nick" value="">
	
	<div class="email">
	<div class="emailtitle">이메일</div>
	<input type="text" id="email_id" title="이메일 아이디" placeholder="아이디(E-mail)" maxlength="18" value="" required /> @ 
	<input type="text" id="email_domain" name="email_domain" title="이메일 도메인" placeholder="이메일 도메인" value="" maxlength="18" required/>
	<select name="select_email" onChange="selectEmail(this)">
	    <option value="">-선택-</option>
	    <option value="naver.com">naver.com</option>
	    <option value="gmail.com">gmail.com</option>
	    <option value="daum.net">daum.net</option>
	    <option value="nate.com">nate.com</option>
	    <option value="1">직접입력</option>
	</select>
	  <input type="hidden" id="email" name="email" >
	    
	  <button name="emailchk" type="button" id="emailchk" onclick="fn_emailchk();" value="N" class="btn-gradient mini">중복확인</button>  
	 
	</div>
	
	 <div class="nickname">
	 <div class="nicknametitle">닉네임</div>
	 <input type=text id=nickname name=nickname placeholder="닉네임" required>
	 <button name="nickchk" type="button" id="nickchk" onclick="fn_nickchk();" value="N" class="btn-gradient">중복확인</button>
	 </div>
	
	<div class="password"> 
	<div class="passwordtitle">비밀번호</div>
	<input type=password id=password name=password placeholder="비밀번호" required><br>
	<input type=password id=password2 name=password2 placeholder="비밀번호확인" required><br>
	</div>
	
	<div class="phone">
	<div class="phonetitle">휴대폰번호</div>
	<input type=text name=phone placeholder="휴대폰번호(선택입력)"><br>
	</div>
	
	<div class="avatarbox">
	<div class="avatartitle">아바타선택</div>
	<input type = "radio" name ="avatar" value = "human" required> 사람 </input>
	<img src="/img/human1.jpg" width=200px height=200px>
	<input type = "radio" name ="avatar" value = "slime" required> 슬라임 </input>
	<img src="/img/slime1.jpg" width=200px height=200px>
	</div>
	<br>
	
	<br>
	<div class="buttons-wrapper">
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	 <div class="buttons-left"><button id="btn_submit" type=submit class="btn_submit" >회원가입</button> </div>
	 <div class="buttons-right"><a href="/main"><button id="btn_cancel" type="button" class="btn_cancel">취&nbsp&nbsp&nbsp&nbsp&nbsp소</button></a></div>
	</div> 
	 
	 </form>
 
 </div>
</body>
</html>