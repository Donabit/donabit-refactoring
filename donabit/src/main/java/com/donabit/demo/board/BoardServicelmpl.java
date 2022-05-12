package com.donabit.demo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.donabit.demo.Criteria;
import com.donabit.demo.dao.BoardDAO;
import com.donabit.demo.dto.BoardDTO;

@Service("BoardService")
public class BoardServicelmpl implements BoardService {

	@Autowired
	@Qualifier("BoardDAO")
	public BoardDAO dao;
	
	/* 게시물 등록 */
	@Override
	public int enroll(BoardDTO dto) {
		
			return dao.enroll(dto);
			
	        }
	
	/* 게시물 목록 */
    @Override
    public List<BoardDTO> getList() {
        
        return dao.getList();
    }
    
    /* 게시판 목록(페이징 적용) */
    @Override
    public List<BoardDTO> getListPaging(Criteria cri) {
        
        return dao.getListPaging(cri);
    }    
 
    
    /* 게시물 조회 */
    @Override
    public BoardDTO getPage(int bno) {
         
        return dao.getPage(bno);
    }
    
    /* 게시물 수정 */
    @Override
    public int modify(BoardDTO dto) {
        
        return dao.modify(dto);
    }
    
    /* 게시물 삭제 */
    @Override
    public int delete(int bno) {
        
        return dao.delete(bno);
    }    
    
	/* 공지사항 */
	/*
	 * @Override public List<BoardDTO> getNotice() {
	 * 
	 * return dao.getNotice(); }
	 */
	
}
