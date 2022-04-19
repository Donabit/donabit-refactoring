package com.donabit.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper //dao 인식 어노테이션
@Repository("BoardDAO")
public interface BoardDAO {
	
    /* 게시판 등록 */
    public int enroll(BoardDTO dto);
    
    /* 게시판 목록 */
    public List<BoardDTO> getList();
    
    /* 게시물 조회 */
    public BoardDTO getPage(int bno);

}
