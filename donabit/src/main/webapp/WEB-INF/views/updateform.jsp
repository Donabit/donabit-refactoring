<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main_header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="css/updateform.css">
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
	  
	  $(function(){ 

		  $(".question").click(function(){
		    $(".modal").fadeIn();
		  });
		  
		  $(".modal_content").click(function(){
		    $(".modal").fadeOut();
		  });
		  
		});
	
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<div class="wrapper">
  <div class="title"><h1 style="font-size: 30px;"> 회원정보수정 </h1></div>
<hr/>
<br>
<form action="memberupdate" method="post">

<div class="email">
 <h5>회원아이디</h5><input type=text name=email value="${principal.memberdto.email}" readonly="readonly"><br>
</div>

 <div class="nickname">
 <h5>변경할 닉네임</h5><input type=text value="${principal.memberdto.nickname}" id=nickname name=nickname >
 <button name="nickchk" type="button" id="nickchk" onclick="fn_nickchk();" value="N" class="btn-gradient mini">중복확인</button>
 </div>
 <div class="phone">
 <h5>변경할 휴대폰번호</h5><input type=text value="${principal.memberdto.phone}" name=phone ><br>
 </div>
 <div class="avatar">
<div class=quest>
 <div class=stext><h5>아바타 타입선택</h5></div>
 <div class="question">
 <img class=icon src="/img/question.jpg">	
 </div>
 
 <div class="modal">
  <div class="modal_content" 
       title="클릭하면 창이 닫힙니다.">
    <img src="/img/select1.png">
  </div>
</div>
 
 </div>
 <input type="radio" id=avatar1 name="avatar" value="human"><label for="avatar1">인간</label>
 <input type="radio" id=avatar2 name="avatar" value="slime"><label for="avatar2">슬라임</label>
 </div>
 <br>
  <hr/>
  <br>
 <div class="buttons-wrapper">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
 <div class="buttons-left"><button id="btn_submit" type=submit class="btn-gradient small" >수정하기</button> </div>
 <div class="buttons-right"><a href="/mypage"><button id="cancle" type="button" class="btn-gradient small">취소</button></a></div>
 </div>
 
 </form>
 </div>
</body>
</html>