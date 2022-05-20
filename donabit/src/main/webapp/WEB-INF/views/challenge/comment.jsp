<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <script>
        //댓글 목록 
        function commentList(checkid) {
            console.log(checkid + "리스트 아이디");
            $.ajax({
                url: '/commentlist',
                type: 'get',
                dataType: "json",
                data: { 'checkid': checkid },
                success: function (data) {
                    var a = '';
                    var b = '${ principal.memberdto.nickname}';
                    $.each(data, function (key, value) {
                        a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                        a += '<div class="commentInfo' + value.cno + '">작성자 : ' + value.nickname + '</div>';
                        if (b == value.nickname) {
                            a += '<a onclick="commentUpdate(' + value.cno + ',\'' + value.content + '\',\'' + value.checkid + '\');"> [수정] </a>';
                            a += '<a onclick="commentDelete(' + value.cno + ',\'' + value.checkid + '\');"> [삭제] </a>';
                        }
                        a += '<div class="commentContent' + value.cno + '"> <p> 내용 : ' + value.content + '</p>';
                        a += '</div></div>';
                        console.log(value.nickname);
                        console.log('${ principal.memberdto.nickname } 현재로그인');
                    });

                    $(".commentlist").html(a);
                }
            });
        }

        //댓글등록
        $(document).off("click").on("click", ".commentInsertBtn", function (event) {
            let no = $(this).attr('idx');
            let nickname = '${ principal.memberdto.nickname}';
            $.ajax({
                url: '/commentinsert',
                data: {
                    'nickname': nickname,
                    'content': $("#content" + no).val(),
                    'checkid': $(this).attr('checkid')
                },
                type: 'get',
                dataType: "json",
                success: function (data) {
                    commentList(data); //댓글 작성 후 댓글 목록 reload
                    //$('[name=content]').val('');
                }
            });
        });


        //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
        function commentUpdate(cno, content, checkid) {
            var a = '';
            a += '<div class="input-group">';
            a += '<input type="text" class="form-control" id="update' + cno + '" value="' + content + '" onchange="commentUpdateProc2(this.value)" />';
            a += '<span class="input-group-btn"><button  id="test"  class="commentUpdateBtn" type="button" onclick="commentUpdateProc(' + cno + ',' + checkid + ')">수정</button> </span> ';
            a += '</div>'
            $('.commentContent' + cno).html(a);
        }

        //onchange
        var val = '';
        function commentUpdateProc2(myval) {//수정글입
            console.log("==>" + myval);
            val = myval;
        }

        //댓글 수정
        function commentUpdateProc(cno, checkid) {
            console.log("==>강사 " + ":" + val);
            $.ajax({
                url: '/commentupdate',
                type: 'get',
                data: {
                    'content': val,
                    'checkid': checkid,
                    'cno': cno
                },
                success: function (data) {
                    commentList(data);
                }
            });
        }

        //댓글 삭제 
        function commentDelete(cno, checkid) {
            $.ajax({
                url: '/commentdelete',
                type: 'get',
                data: {
                    'checkid': checkid,
                    'cno': cno
                },
                success: function (data) {
                    commentList(data);
                }
            });
        }

    </script>