package com.donabit.demo.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.donabit.demo.admin.ChallengeService2;
import com.donabit.demo.challenge.ChallengeService;
import com.donabit.demo.challenge.ControllerLibrary;
import com.donabit.demo.check.CheckService;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.ChallengeDTO2;
import com.donabit.demo.dto.ChallengingDTO;
import com.donabit.demo.dto.CheckDTO;
import com.donabit.demo.security.PrincipalDetails;

@Controller
public class MypageController {
	@Autowired
	@Qualifier("challengeservice")
	ChallengeService service;

	@Autowired
	@Qualifier("checkservice")
	CheckService checkinservice;

	@Autowired
	ControllerLibrary lib;
	
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 challengeservice2;
	
	@RequestMapping("/mypage")
	public String view() {
		return "mypage";

	}

	@GetMapping("/mypage")
	public ModelAndView test(@AuthenticationPrincipal PrincipalDetails principaldetail) {
		ModelAndView mv = new ModelAndView();
		String nickname = principaldetail.getMemberdto().getNickname();
		System.out.println(lib.calcLevel(nickname) + "=" + nickname + "의 레벨");
		List<ChallengeDTO> participate = checkinservice.mypagecheck(nickname);
		List<ChallengeDTO> makepc = checkinservice.mypagempccheck(nickname);
		List<ChallengeDTO> badge = service.selectbadge(nickname);
		
		int selectmychallengecount = service.selectMyChallengeCount(nickname);
		int mydonatecount = service.myDonateCount(nickname);
		
		mv.addObject("mychallengecount", selectmychallengecount);
		mv.addObject("mydonate", mydonatecount);
		
		mv.addObject("participate", participate);
		mv.addObject("makepc", makepc);
		mv.addObject("badge", badge);
		mv.addObject("level", lib.calcLevel(nickname));
		mv.addObject("expsum", lib.sumExp(nickname));
		mv.setViewName("mypage");
		return mv;

	}
	
	@GetMapping("/makepc")
	public void makepersonalchallenge() {}
	
	@PostMapping("/makepc")
	public String makepesonalchallengeinsert(ChallengeDTO2 dto, @AuthenticationPrincipal PrincipalDetails principaldetail) throws IOException {
		String nickname = principaldetail.getMemberdto().getNickname();
		challengeservice2.insertChallenge(dto);
		int result = checkinservice.selectMaxchnum(nickname);
		service.insertChallengingAjax(Integer.toString(result), nickname);
		return "redirect:/mypage"; 
	}
	 
}
