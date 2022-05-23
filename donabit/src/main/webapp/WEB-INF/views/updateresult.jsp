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
 <style>
     body {
        text-align: center;
        padding: 40px 0;
        background: #b6edeb;
      }
        h1 {
          color: #2AC1BC;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-size:18px;
          margin: 0;
        }
      i {
        color: #2AC1BC;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
   
button.success{
  position:relative;
  background:#2AC1BC;
  color:#fff;
  border:none;
  height:40px;
  font-size:1.2em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
   opacity: 1.0;
}
button.success:hover{
  background:#fff;
  color:#1AAB8A;
   opacity: 0.8;
}
 button.success:before,button.success:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button.success:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button.success:hover:before,button.success:hover:after{
  width:100%;
  transition:800ms ease all;
} 
   
</style>

<body>
<c:if test="${result == 1}">
	<div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #b6edeb; margin:0 auto;">
        <i class="checkmark">✓</i>
      </div>
        <h1> Success ! </h1> 
        <p>정보가 정상적으로 수정되었습니다!<br/>다시 로그인 해주세요.</p>
    <br>
    <a href="/logout"><button id="button" type="button" class="success">로그인하러 가기</button></a>
    </div>
   
</c:if>

</body>
</html>