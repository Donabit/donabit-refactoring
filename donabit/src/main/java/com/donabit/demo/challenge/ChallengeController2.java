package com.donabit.demo.challenge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChallengeController2 {
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 service;
	
	
	@RequestMapping("/admin")
	public void adminchallege() {}
	
	@RequestMapping("/make-a-challenge")
	public void makeachallenge() {}
	
	@PostMapping("/adminresult")
	public ModelAndView adminresult(ChallengeDTO2 dto) {
		ModelAndView mv = new ModelAndView();
		service.insertChallenge(dto);
		mv.addObject("challenge", dto);
		mv.setViewName("adminresult");
		return mv;
	}
}
