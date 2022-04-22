package com.donabit.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

public class BoardController {
	@Autowired
	@Qualifier("BoardService")
	public BoardService service;
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	/* 게시물 목록 페이지 접속 */
	@GetMapping("/board/list")
	 // => @RequestMapping(value="list", method=RequestMethod.GET)
	    public void boardListGET(Model model) {
	        
	        log.info("게시물 목록 페이지 진입");
	        
	        model.addAttribute("list", service.getList());
	        
	    }
	    
	    @GetMapping("board/enroll")
	 // => @RequestMapping(value="enroll", method=RequestMethod.GET)
	    public void boardEnrollGET() {
	        
	        log.info("게시물 등록 페이지 진입");
	        
	    }
	    
	    @PostMapping("board/enroll")
	    public String boardEnrollPOST(BoardDTO dto, RedirectAttributes rttr) {
	
	    	log.info("BoardDTO : " + dto);
	    	
	    	service.enroll(dto);
	    	
	    	log.info("BoardDTO : " + dto);
	    	
	    	rttr.addFlashAttribute("result", "enrol success");
	    	
	    	return "redirect:/board/list";
	    	
	    }
	    
	    /* 게시물 조회 */
	    @GetMapping("board/get")
	    public void boardGetPageGET(int bno, Model model) {
	        
	        model.addAttribute("pageInfo", service.getPage(bno));
	        
	    }
	    
	    /* 수정 페이지 이동 */
	    @GetMapping("board/modify")
	    public void boardModifyGET(int bno, Model model) {
	        
	        model.addAttribute("pageInfo", service.getPage(bno));
	        
	    }
	    
	    /* 페이지 수정 */
	    @PostMapping("board/modify")
	    public String boardModifyPOST(BoardDTO dto, RedirectAttributes rttr) {
	        
	        service.modify(dto);
	        
	        rttr.addFlashAttribute("result", "modify success");
	        
	        return "redirect:/board/list";
	        
	    }
	    
	    /* 페이지 삭제 */
	    @PostMapping("board/delete")
	    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
	        
	        service.delete(bno);
	        
	        rttr.addFlashAttribute("result", "delete success");
	        
	        return "redirect:/board/list";
	    }
	    
		/* 공지사항 끌어오기 */
		@GetMapping("/main")
		 // => @RequestMapping(value="list", method=RequestMethod.GET)
		    public void NoticeListGET(Model model) {
		        
		        log.info("게시물 목록 페이지 진입");
		        
		        model.addAttribute("list", service.getList());
		        
		    }
	
}
