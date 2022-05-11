package com.donabit.demo.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.donabit.demo.challenge.ChallengeService;
import com.donabit.demo.challenge.ControllerLibrary;
import com.donabit.demo.check.CheckService;
import com.donabit.demo.dto.ChallengeDTO2;
import com.donabit.demo.dto.ChallengingDTO;
import com.donabit.demo.dto.MemberDTO;
import com.donabit.demo.dto.ReportDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ChallengeService2 service;
	
	@Autowired
	@Qualifier("checkservice")
	CheckService ckservice;
	
	@Autowired
	ControllerLibrary lib;
	
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
		List<Integer> levelList = new ArrayList<Integer>();
		for(MemberDTO dto : list) {
			levelList.add(lib.calcLevel(dto.getNickname()));
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
			i.setLevel(lib.calcLevel(i.getNickname()));
			memberReportByNumber.add(service.selectEachReportCountByNumber(Integer.toString(chnum), i.getNickname()));
			memberChecksByNumber.add(service.selectEachCheckCountByNumber(Integer.toString(chnum), i.getNickname()));
		}
		mv.addObject("list", list);
		mv.addObject("levellist", levelList);
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
		List<ReportDTO> allReportList = service.selectReportDto();
		List<ReportDTO> resultList = new ArrayList<ReportDTO>();
		int reportCount = 0;
		for(ReportDTO i : allReportList) {
			if(i.getReport() >= 10) { // 신고횟수 10 이상인거만 새로운 List에 보관
				resultList.add(i);
				chnameList.add(service.selectChallengeNameByNumber(i.getChnum()));
			}
		}
		reportCount = resultList.size();
		mv.addObject("list", resultList);
		mv.addObject("chname", chnameList);
		mv.addObject("reportCount", reportCount);
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
