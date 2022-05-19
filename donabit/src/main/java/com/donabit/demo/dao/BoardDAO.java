package com.donabit.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.donabit.demo.Criteria;
import com.donabit.demo.dto.BoardDTO;

@Mapper //dao 인식 어노테이션
@Repository("BoardDAO")
public interface BoardDAO {
	
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
   

}
