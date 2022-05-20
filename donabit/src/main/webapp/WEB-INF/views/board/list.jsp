<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donabit 습관을 기부하세요</title>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="stylesheet" type="text/css" href="../css/main_header.css">
<link rel="stylesheet" href="../css/ch-community.css">
<link rel="stylesheet" type="text/css" href="../css/boardlist.css">
<script src="mybatis_spring.js" defer></script>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

<script src="../js/main_header.js" defer></script>

</head>

<!-- .upload_btn {
  opacity: 1.0;
}

.upload_btn:hover {
     opacity: 0.8;
}
 -->

<body>

		<%@ include file="/WEB-INF/views/main_header.jsp" %>
		<img id="coimg" src="../img/challenge/community.svg">
		
<section class="notice">
<div class="ptitle">
<div class="titleArea firstTitleArea">
<h2><font color="#555555">공지사항</font></h2>
</div>
<div class="secondt">
	<h1><font color="#555555">Donabit 최신 소식을 읽어보세요!</font></h1>
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
	
	    <div class="search_wrap">
        <div class="search_area">
             <select name="type">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>검색 조건 선택</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select> 
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button id="sbtn">검색</button>
        </div>
    </div>    
		
	    <div class="pageInfo_wrap">
       		<div class="pageInfo_area">
       			<ul id="pageInfo" class="pageInfo">
       		
       	<!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>
       		
        <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>

                
        <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>
                
                </ul>
                
        	</div>
		</div>
		
		
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
    </form>
    
    </div>
</div>
</section>
<br>
<br>
</body>

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
	    	 
	    $(".pageInfo a").on("click", function(e){
	    e.preventDefault();
	    
	    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	    moveForm.attr("action", "/board/list");
	    moveForm.submit();  
	});
	    
	    $(".search_area button").on("click", function(e){
	        e.preventDefault();
	        let val = $("input[name='keyword']").val();
	        moveForm.find("input[name='keyword']").val(val);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	});
	    
	    $(".search_area button").on("click", function(e){
	        e.preventDefault();
	        
	        let type = $(".search_area select").val();
	        let keyword = $(".search_area input[name='keyword']").val();
	        
	        if(!type){
	            alert("검색 종류를 선택하세요.");
	            return false;
	        }
	        
	        if(!keyword){
	            alert("키워드를 입력하세요.");
	            return false;
	        }        
	        
	        moveForm.find("input[name='type']").val(type);
	        moveForm.find("input[name='keyword']").val(keyword);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	 });
	    
</script>
</body>
<%@ include file="/WEB-INF/views/main_footer.jsp" %>
</html>