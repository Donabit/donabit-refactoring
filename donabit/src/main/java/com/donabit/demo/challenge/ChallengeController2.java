package com.donabit.demo.challenge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import joinlogin.MemberDTO;

@Controller
public class ChallengeController2 {
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 service;
		
	@RequestMapping("/admin")
	public void adminchallege() {}
		
	@GetMapping("/admin/challenge-list")
	public ModelAndView challengelist() {
		return challengelist(1);
	}
	
	@PostMapping("/admin/challenge-list")
	public ModelAndView challengelist(@RequestParam int page) {
		ModelAndView mv = new ModelAndView();
		List<Integer> challengingMemberCountList = new ArrayList<Integer>();
		List<Integer> successMemberCountList = new ArrayList<Integer>();
		List<Integer> checkCountList = new ArrayList<Integer>();
		int objPerPage = 3;
		int total = service.selectChallengeCount();
		int pageNum = (total % objPerPage == 0) ? total / objPerPage : total / objPerPage + 1;
		List<ChallengeDTO2> list = service.selectChallenge((page - 1) * objPerPage, objPerPage);
		for(ChallengeDTO2 i : list) {
			int challengingMember = service.selectChallengingMemberCount(i.getChnum());
			int successMember = service.selectSuccessMemberCount(i.getChnum());
			int checkCount = service.selectCheckCount(i.getChnum());
			challengingMemberCountList.add(challengingMember);
			successMemberCountList.add(successMember);
			checkCountList.add(checkCount);
		}
		mv.addObject("pageNum", pageNum);
		mv.addObject("list", list);
		mv.addObject("challengingMember", challengingMemberCountList);
		mv.addObject("successMember", successMemberCountList);
		mv.addObject("checkCount", checkCountList);
		mv.setViewName("/admin/challenge-list");
		return mv;
	}
		
	@GetMapping("/admin/make-a-challenge")
	public void makeachallenge() {}
	
	@PostMapping("/admin/make-a-challenge")
	public ModelAndView makeachallenge(ChallengeDTO2 dto) {
		ModelAndView mv = new ModelAndView();
		service.insertChallenge(dto);
		mv.addObject("challenge", dto);
		mv.setViewName("redirect:/admin/challenge-list");
		return mv;
	}
	
	@PostMapping("/admin/remove-challenge")
	public String removechallenge(HttpServletResponse res, @RequestParam int chnum) throws IOException {
		service.deleteChallenge(chnum);
		return "redirect:/admin/challenge-list";
	}
	
	@GetMapping("/admin/member-list")
	public ModelAndView memberlist() {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> list = service.selectMember();
		
		return mv;
	}
	
	
}
