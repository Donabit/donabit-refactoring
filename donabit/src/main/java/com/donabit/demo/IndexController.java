package com.donabit.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.donabit.demo.admin.ChallengeService2;
import com.donabit.demo.board.BoardService;
import com.donabit.demo.challenge.ControllerLibrary;
import com.donabit.demo.dto.MemberDTO;

@Controller
public class IndexController {
	
	@Autowired
	private BoardService bsservice;
	
	@Autowired
	private ChallengeService2 chservice;
	
	@Autowired
	private ControllerLibrary lib;
	
	@GetMapping("/start")
	public void start() {}
	
	@GetMapping("/tutorial") 
	public void tutorial() {}
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("chlist", chservice.selectMainChallenge());
		model.addAttribute("list", bsservice.getList());
		List<Integer> levellist = new ArrayList<Integer>();
		List<MemberDTO> ranklist = chservice.selectRanker();
		for(MemberDTO i : ranklist) {
			levellist.add(lib.calcLevel(i.getNickname()));
		}
		model.addAttribute("ranklist", ranklist);
		model.addAttribute("level", levellist);
	}
	
}
