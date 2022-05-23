<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- 버튼 -->
    <br>
    <img class="trigger" idx="${status.index}" checkid="${check.checkid}" src="img/challenge/sns.svg" width="30px">

    <!-- 팝업 될 레이어 -->
    <div class="modal" id="modal${status.index}">
        <div class="modal-content">
            <!-- 닫기버튼 -->
            <div class="close-button" idx="${status.index}"><i class="fa-solid fa-xmark"></i></div>
            <!-- 인증사진 + 댓글 -->
            <div class="modalimgcomment">
                <!-- 이미지 -->
                <div class="modalimgout">
                    <img class="modalimg" src="/checkimage/${check.checkimg2}"><br>
                </div>
                <!-- 댓글 -->
                <div class="modalcomment">
                    <!-- 댓글리스트 -->
                    <div class="commentlistout">
                        <div class="commentlist"></div>
                    </div>
                </div>
                <!-- 댓글작성 -->
                <!-- 로그인을 했을때 -->
                <c:if test="${!empty principal.memberdto.nickname}">
                    <div class="input-group">
                        <!-- 댓글작성 -->
                        <input type="text" class="content" id="content${status.index}" name="content"
                            placeholder="댓글 달기 ... " autocomplete="off" maxlength='200'>
                        <!-- 댓글등록 -->
                        <span class="input-group-btn">
                            <button class="commentInsertBtn" type="button" checkid="${check.checkid}"
                                idx="${status.index}">등록</button>
                        </span>
                    </div>


                </c:if>
                <!-- 로그인을 안 했을때 -->
                <c:if test="${empty principal.memberdto.nickname}">
                    <div class="input-group">
                        <!-- 댓글작성 -->
                        <input type="text" class="form-control" id="content" name="content"
                            placeholder="댓글을 작성하려면 로그인 해주세요" autocomplete="off" readonly>
                        <!-- 댓글등록 -->
                        <span class="input-group-btn">
                            <button class="commentLoginBtn" type="button"
                                onclick="location.href='http://localhost:8089/loginform' ">로그인</button>
                        </span>
                    </div>
                </c:if>

            </div>
        </div>
        <%@ include file="/WEB-INF/views/challenge/comment.jsp" %>
    </div>