package com.donabit.demo.board;

import java.util.List;

import com.donabit.demo.Criteria;
import com.donabit.demo.dto.BoardDTO;

public interface BoardService {
	
    /* 게시물 등록 */
    public int enroll(BoardDTO dto);

    /* 게시물 목록 */
    public List<BoardDTO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
    
    /* 게시물 조회 */
    public BoardDTO getPage(int bno);
    
    /* 게시물 수정 */
    public int modify(BoardDTO dto);
    
    /* 게시물 삭제 */
    public int delete(int bno);
    
    /* 공지사항 */
	/* public List<BoardDTO> getNotice(); */
    
}
