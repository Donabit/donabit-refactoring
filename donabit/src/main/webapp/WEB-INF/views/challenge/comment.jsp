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
                        a += '<div class="commentArea" >';
                        a += '<div class="box2"><img class="avatar1" src="img/${check.avatar}${level[status.index]}.jpg" width="25px"></div>';
                        a += '<div class="upde">'
                        a += '<span float: left; id="conickname" class="commentInfo' + value.cno + '"> ' + value.nickname + '</span>';
                        if (b == value.nickname) {
                            a += '<a class="update" onclick="commentUpdate(' + value.cno + ',\'' + value.content + '\',\'' + value.checkid + '\');"> [수정] </a>';
                            a += '<a class="delete" onclick="commentDelete(' + value.cno + ',\'' + value.checkid + '\');"> [삭제] </a>';
                        }
                        a += '</div>'
                        a += '<div  id="commentContentid" class="commentContent' + value.cno + '"> <p class="contenttext">  ' + value.content + '</p>';
                        a += '</div></div>';
                    });

                    $(".commentlist").html(a);
                }
            });
        }

        //댓글등록
        $(document).off("click").on("click", ".commentInsertBtn", function (event) {
            let no = $(this).attr('idx');
            let nickname = '${principal.memberdto.nickname}';
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
            a += '<input type="text" class="updateinput"  id="update' + cno + ' " onchange="commentUpdateProc2(this.value)" />';
            a += '<span class="input-group-btn"><button class="commentUpdateBtn" type="button" onclick="commentUpdateProc(' + cno + ',' + checkid + ')">수정</button> </span> ';
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