package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.donabit.board.BoardService;
import com.donabit.demo.challenge.ChallengeService2;

import donabit.challenge.ChallengeDTO;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("BoardService")
	public BoardService service;
	
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 chservice;
	
	@GetMapping("/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> chlist = chservice.selectMainChallenge();
		mv.addObject("chlist", chlist);
		mv.addObject("list", service.getList());
		mv.setViewName("main");
		return mv;
	}
	
}
