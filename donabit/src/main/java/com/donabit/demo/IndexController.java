package com.donabit.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.donabit.demo.admin.ChallengeService2;
import com.donabit.demo.board.BoardService;

@Controller
public class IndexController {
	
	@Autowired
	private BoardService bsservice;
	
	@Autowired
	private ChallengeService2 chservice;
	
	@GetMapping("/start")
	public void start() {}
	
	@GetMapping("/tutorial") 
	public void tutorial() {}
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("chlist", chservice.selectMainChallenge());
		model.addAttribute("list", bsservice.getList());
	}
	
}
