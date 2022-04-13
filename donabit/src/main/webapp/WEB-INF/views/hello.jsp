<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미라클모닝 인증페이지</title>
<script src="resources/jquery-3.6.0.min.js"></script>

 <script src="mybatis_spring.js" defer></script>
<link rel="stylesheet" href="src/main/resources/css/test.css">


<script type="text/javascript">
	$(document).ready(function(){
		//jquery code
	});
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<table
            border="1"
            width="50%"
            height="200"
            cellspacing="5">
            <caption>1. 미라클 모닝</caption>
            
            <tbody>
                <tr align="center" bgcolor="white">
                 
                    <td>
                    <form method="post" enctype="multipart/form-data">
                    	<div class="button">
                    		<label for="choosefile">
                    			이미지 첨부
                    		</label>
                    	</div>
                    	<input type="file" id="choosefile" name="choosefile" accept="image/*" onchange="loadFile(this)">
                    </form>
                    </td>
                    <td>200원</td>
                    <td>400원</td>
                </tr>
                <tr align="center" bgcolor="white">
                 
                  <td>100원</td>
                  <td>200원</td>
                  <td>400원</td>
                </tr>
            </tbody>
        </table>
</body>
</html>
