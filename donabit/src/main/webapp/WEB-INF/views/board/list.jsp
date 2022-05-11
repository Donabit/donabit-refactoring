<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
 <%@ include file="/WEB-INF/views/main_header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 페이지</title>

<script src="mybatis_spring.js" defer></script>
 
<link rel="stylesheet" type="text/css" href="../css/boardlist.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

  
</head>

<section class="notice">
<div class="ptitle">
<div class="ncontainer">
	<h3>Donabit Notice</h3>
</div>
</div>

<div class="table_wrap">
	<!-- <a href="/board/enroll" class="top_btn">게시판 등록</a> -->
	<div class="ncontainer">
	<table class="board-table">
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${list}" var="list">
            <tr>
                <td>${list.bno}</td>
                <td>    
                    <a class="move" href='${list.bno}'>
        				${list.title}
    				</a>
                </td>

                <td>${list.writer}</td>
                <td>${list.regdate}</td>
                
            </tr>
        </c:forEach>
      </tbody>  
	</table>
	<form id="moveForm" method="get">    
    </form>
    </div>
</div>
</section>
<br>
<br>

<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
        }
        
        if(result === "enroll"){
            alert("등록이 완료되었습니다.");
        }
        
        if(result === "modify"){
            alert("수정이 완료되었습니다.");
        }
        
        if(result === "delete"){
            alert("삭제가 완료되었습니다.");
        }
        
    }    
    
});

	let moveForm = $("#moveForm");

		$(".move").on("click", function(e){
   		e.preventDefault();
    
    	moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
    	moveForm.attr("action", "/board/get");
    	moveForm.submit();
	});
</script>
</body>
<%@ include file="/WEB-INF/views/main_footer.jsp" %>
</html>