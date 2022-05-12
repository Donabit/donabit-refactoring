<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- 버튼 -->
    <button class="trigger" idx="${status.index}">
        _________________팝업${status.index}</button>

    <!-- 팝업 될 레이어 -->
    <div class=" modal" id="modal${status.index}">
        <div class="modal-content">
            <span class="close-button" idx="${status.index}">&times;</span>
            <div class="modaldiv" style="overflow-y: scroll; height:200px;">${check.checktitle}<br>${status.index}
                = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스
                번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스
                번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스
                번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스
                번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스 번호<br>${status.index} = 인덱스


            </div>
        </div>
    </div>