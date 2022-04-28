<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shorcut icon" type="image/x-icon" sizes="32x32" href="/img/favicon-32x32.png">
<meta charset="UTF-8">
<title>Donabit 관리자 페이지</title>
<style>
	.admin_main_container {
	    padding: 2em;
	    height: 66em;
	    background-color: whitesmoke;
	    overflow: hidden;
	}

	.admin_sidebar_list:nth-child(1){
		background-color: #FF85B3;
	}
	
	a[href="board-enroll"] {
		color: black;
		font-weight: 600;
	}
	
	.input_table {
		display: table;
		width: 100%;
	}
	
	.input_row {
		display: table-row;
		align-items: top;
	}
	
	.input_cell {
		display: table-cell;
		border-bottom: 1px solid lightgray;
	    padding: 1em 1em 1em 0.5em;
	    vertical-align: top;
	}
	
	input {
		width: 22em;
	}
	
	textarea {
		width: 22em;
		resize: none;
	}
	
	label {
		font-weight: 500;
		width: 14em;
	}
	
	button {
		padding: 0.8em 1.6em;
	    margin: 2em 1em;
	    border-radius: 0.5em;
	    border: 0;
	    cursor: pointer;
	    box-shadow: 2px 2px rgb(176, 176, 176);
	}
	
	button:first-child {
	    background-color: #FF85B3;
	    color: white;
	}
	
	button:first-child:hover {
	    background-color: #EC7BA5;
	}
	
	button:last-child:hover {
	    background-color: lightgray;
	}
	
	.btn {
		margin-top: 1em;
    	text-align: center;
	}
	
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>
	<main class="admin_main_container">
        <h2 class="admin_main_header">공지사항 등록 &#x1F4E2 </h2> 
        <br>
        <hr style="border: 1px solid black;">
        <br>
		<form action="/board/enroll" method="post">
		    <div class="input_table">
			    <div class="input_row">
			        <label class="input_cell" for="title">제목</label>
			        <div class="input_cell">
			        	<input name="title" />
			        </div>
			    </div>
			    <div class="input_row">
			        <label class="input_cell" for="writer">작성자</label>
			        <div class="input_cell">
			        	<input name="writer" value="${nickname}" />
			        </div>
			    </div>
			    <div class="input_row">
			        <label class="input_cell" for="content">내용</label>
			        <div class="input_cell">
			        	<textarea rows="6" name="content"></textarea>
			        </div>
			    </div>
		    </div>
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    <div class="btn">
			    <button type="submit">등록</button>
			    <button type="reset">취소</button>
		    </div>
		</form>
	</main>
</body>
</html>