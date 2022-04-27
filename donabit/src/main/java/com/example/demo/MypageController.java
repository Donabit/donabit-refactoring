package com.example.demo;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import check.CheckService;
import donabit.challenge.ChallengeDTO;
import donabit.challenge.ChallengeService;
import joinlogin.PrincipalDetails;

@Controller
public class MypageController {
	@Autowired
	@Qualifier("challengeservice")
	ChallengeService service;

	@Autowired
	@Qualifier("checkservice")
	CheckService checkinservice;
	
	
	@RequestMapping("/mypage")
	public String view() {
		return "mypage";

	}

	@GetMapping("/mypage")
	public ModelAndView test(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		String nickname = userDetails.getMemberdto().getNickname();
		int[] exp = service.selectexp(nickname);
		int[] level = service.selectlevel();
		int levelresult = 0;
		int sum = Arrays.stream(exp).sum();
		System.out.println(sum + "= " + nickname + "경험치 총합계");
		// 경험치 구간이 level 1이하 일때
		if (sum <= level[0]) {
			levelresult = 1;
		}
		// 경험치가 구간이 level 1초과 일때
		for (int i = 0; i < level.length; i++) {
			System.out.println(level[i] + "=level배열");
			if (level[i] < sum) {
				if (sum <= level[i + 1]) {
					levelresult = i + 2;
				}
			}
		}
		System.out.println(levelresult + "=" + nickname + "의 레벨");
		List<ChallengeDTO> participate = checkinservice.mypagecheck(nickname);
		mv.addObject("participate", participate);
		mv.addObject("level", levelresult);
		mv.addObject("expsum", sum);
		mv.setViewName("mypage");
		return mv;

	}
}
