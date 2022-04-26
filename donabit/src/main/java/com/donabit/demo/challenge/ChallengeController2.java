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
import org.springframework.web.servlet.ModelAndView;

import check.CheckService;
import joinlogin.MemberDTO;

@Controller
@RequestMapping("/admin")
public class ChallengeController2 {
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 service;
	
	@Autowired
	@Qualifier("checkservice")
	CheckService ckservice;
	
	@GetMapping("")
	public String admin(){
		return "redirect:/admin/board-enroll"; 
	}
		
	@GetMapping("/challenge-list")
	public ModelAndView challengelist() {
		return challengelist(1);
	}
	
	@PostMapping("/challenge-list")
	public ModelAndView challengelist(@RequestParam int page) {
		ModelAndView mv = new ModelAndView();
		List<Integer> challengingMemberCountList = new ArrayList<Integer>();
		List<Integer> successMemberCountList = new ArrayList<Integer>();
		List<Integer> checkCountList = new ArrayList<Integer>();
		int objPerPage = 3;
		int total = service.selectChallengeCount();
		int pageNum = (total % objPerPage == 0) ? total / objPerPage : total / objPerPage + 1;
		List<ChallengeDTO2> list = service.selectChallengePage((page - 1) * objPerPage, objPerPage);
		for(ChallengeDTO2 i : list) {
			int challengingMember = service.selectChallengingMemberCount(i.chnum);
			int successMember = service.selectSuccessMemberCount(i.chnum);
			int checkCount = service.selectCheckCount(i.chnum);
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
		
	@GetMapping("/make-a-challenge")
	public void makeachallenge() {}
	
	@PostMapping("/make-a-challenge")
	public ModelAndView makeachallenge(ChallengeDTO2 dto) {
		ModelAndView mv = new ModelAndView();
		service.insertChallenge(dto);
		mv.addObject("challenge", dto);
		mv.setViewName("redirect:/admin/challenge-list");
		return mv;
	}
	
	@PostMapping("/remove-challenge")
	public String removechallenge(@RequestParam int chnum) {
		service.deleteChallenge(chnum);
		return "redirect:/admin/challenge-list";
	}
	
	@GetMapping("/member-list")
	public ModelAndView memberlist() {
		return memberlist(0);
	}
	
	@PostMapping("/member-list")
	public ModelAndView memberlist(@RequestParam int chnum) {
		ModelAndView mv = new ModelAndView();
		List<Integer> challengingCountList = new ArrayList<Integer>();
		List<Integer> successCountList = new ArrayList<Integer>();
		List<Integer> checksCountList = new ArrayList<Integer>();
		List<Integer> reportCountList = new ArrayList<Integer>();
		List<ChallengeDTO2> chnameList = service.selectChallengeName();
		List<MemberDTO> list = service.selectMember();
		for(MemberDTO dto : list) {
			 challengingCountList.add(service.selectChallengingCountByNickname(dto.getNickname()));
			 successCountList.add(service.selectSuccessCountByNickname(dto.getNickname()));
			 checksCountList.add(service.selectCheckCountByNickname(dto.getNickname()));
			 reportCountList.add(service.selectReportCountByNickname(dto.getNickname()));
		}
		int memberCount = service.selectMemberCount();
		String chname = service.selectChallengeNameByNumber(chnum);
		int chmemberCount = service.selectChallengingMemberCount(chnum);
		List<ChallengingDTO> memberInfoByNumberList = service.selectMemberInfoByNumber(chnum);
		List<Integer> memberReportByNumber = new ArrayList<Integer>();
		List<Integer> memberChecksByNumber = new ArrayList<Integer>();

		for(ChallengingDTO i : memberInfoByNumberList) {
				memberReportByNumber.add(service.selectEachReportCountByNumber(Integer.toString(chnum), i.memberDTO.getNickname()));
				memberChecksByNumber.add(service.selectEachCheckCountByNumber(Integer.toString(chnum), i.memberDTO.getNickname()));
		}
		mv.addObject("list", list);
		mv.addObject("memberCount", memberCount);
		mv.addObject("challengingCount", challengingCountList);
		mv.addObject("successCount", successCountList);
		mv.addObject("checksCount", checksCountList);
		mv.addObject("reportCount", reportCountList);
		mv.addObject("chnameList", chnameList);
		mv.addObject("chname", chname);
		mv.addObject("chmemberCount", chmemberCount);
		mv.addObject("memberInfoByNumber", memberInfoByNumberList);
		mv.addObject("memberReportByNumber", memberReportByNumber);
		mv.addObject("memberChecksByNumber", memberChecksByNumber);
		mv.setViewName("/admin/member-list");
		return mv;
	}
	
	@GetMapping("/report")
	public ModelAndView reportlist() {
		ModelAndView mv = new ModelAndView();
		List<String> chnameList = new ArrayList<String>();
		List<ReportDTO> list = service.selectReportDto();
		for(ReportDTO i : list) {
			if(i.getCheckDTO() != null) {
				chnameList.add(service.selectChallengeNameByNumber(i.getCheckDTO().getChnum()));
			}
		mv.addObject("list", list);
		mv.addObject("chname", chnameList);
		mv.addObject("reportCount", service.selectReportCount());
		}
		mv.setViewName("/admin/report");
		return mv;
	}
	
	@PostMapping("/delete-report")
	public void deleteReport(@RequestParam int checkid, HttpServletResponse response) throws IOException {
		ckservice.deletetoggle(checkid);
		ckservice.deletecheck(checkid);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>history.back()</script>");
		out.flush();
	}
}
