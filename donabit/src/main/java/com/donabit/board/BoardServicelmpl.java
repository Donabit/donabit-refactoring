package com.donabit.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("BoardService")
public class BoardServicelmpl implements BoardService {

	@Autowired
	@Qualifier("BoardDAO")
	public BoardDAO dao;
	
	/* 게시판 등록 */
	@Override
	public int enroll(BoardDTO dto) {
		
			return dao.enroll(dto);
			
	        }
	
	/* 게시판 목록 */
    @Override
    public List<BoardDTO> getList() {
        
        return dao.getList();
    }
    
    /* 게시물 조회 */
    @Override
    public BoardDTO getPage(int bno) {
         
        return dao.getPage(bno);
    }    
	
}
