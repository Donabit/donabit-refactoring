package com.donabit.demo.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.donabit.demo.dto.BoardDTO;
import com.donabit.demo.security.PrincipalDetails;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/board/list")
	public void boardListGET(Model model) {
		log.info("게시물 목록 페이지 진입");
		model.addAttribute("list", service.getList());
	}
	    
	@GetMapping("/admin/board-enroll") // 관리자 페이지에서 등록 가능
	public void boardEnrollGET(@AuthenticationPrincipal PrincipalDetails principaldetail, Model model) {
		log.info("게시물 등록 페이지 진입");
		model.addAttribute("nickname", principaldetail.getMemberdto().getNickname());
	}

	@GetMapping("/board/get")
	public void boardGetPageGET(int bno, Model model) {
		log.info("게시물 상세 페이지 : " + bno);
		model.addAttribute("pageInfo", service.getPage(bno));
	}
	
	@GetMapping("/board/modify")
	public void boardModifyGET(int bno, Model model) {
		log.info("게시물 수정 페이지 : " + bno);
		model.addAttribute("pageInfo", service.getPage(bno));
	}
	
	@PostMapping("/board/enroll")
	public String boardEnrollPOST(BoardDTO dto, RedirectAttributes rttr) {
		log.info("게시물 등록 : BoardDTO = " + dto);
    	service.enroll(dto);	    	
	    rttr.addFlashAttribute("result", "enroll");
	    return "redirect:/board/list";
	}

    @PostMapping("/board/modify")
    public String boardModifyPOST(BoardDTO dto, RedirectAttributes rttr) {
		log.info("게시물 수정 : BoardDTO = " + dto);
        service.modify(dto);
        rttr.addFlashAttribute("result", "modify");
        return "redirect:/board/list";
    }
	    
    @PostMapping("/board/delete")
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
    	log.info("게시물 삭제 : " + bno);
        service.delete(bno);
        rttr.addFlashAttribute("result", "delete");
        return "redirect:/board/list";
    }
	
}
