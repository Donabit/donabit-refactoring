package com.example.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.donabit.board.BoardVO;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/board/*")
public class TestController {
	
	private static final Logger log = LoggerFactory.getLogger(TestController.class);

	 @GetMapping("/list")
	 // => @RequestMapping(value="list", method=RequestMethod.GET)
	    public void boardListGET() {
	        
	        log.info("게시판 목록 페이지 진입");
	        
	    }
	    
	    @GetMapping("/enroll")
	 // => @RequestMapping(value="enroll", method=RequestMethod.GET)
	    public void boardEnrollGET() {
	        
	        log.info("게시판 등록 페이지 진입");
	        
	    }
	    
	    /* 게시판 등록 */
	    @PostMapping("/enroll")
	    public void boardEnrollPOST(BoardVO board) {
	        
	        log.info("BoardVO : " + board);
	        
	    }
	    
	    
	
}
