package com.donabit.board;

import java.util.List;

public interface BoardService {
	
    /* 게시물 등록 */
    public int enroll(BoardDTO dto);

    /* 게시물 목록 */
    public List<BoardDTO> getList();
    
    /* 게시물 조회 */
    public BoardDTO getPage(int bno);
    
    /* 게시물 수정 */
    public int modify(BoardDTO dto);
    
    /* 게시물 삭제 */
    public int delete(int bno);
    
    /* 공지사항 */
	/* public List<BoardDTO> getNotice(); */
    
}
