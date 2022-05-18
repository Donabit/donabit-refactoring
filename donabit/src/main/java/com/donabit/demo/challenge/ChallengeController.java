package com.donabit.demo.challenge;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.donabit.demo.Criteria;
import com.donabit.demo.admin.ChallengeService2;
import com.donabit.demo.check.CheckService;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.security.PrincipalDetails;

@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService service;
	
	@Autowired
	ChallengeService2 chservice;
	
	@Autowired
	CheckService service2;
	
	@Autowired
	ControllerLibrary lib;
	
	//챌린지리스트 페이지
	@RequestMapping("/challenge")
	public ModelAndView challengelist() throws ParseException { // Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> list = service.challengelist();
		List<ChallengeDTO> list2 = service.challcount();
		/*
		 * SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); Date date =
		 * formatter.parse("2022-04-24"); for(ChallengeDTO data: list) {
		 * System.out.println(data.getChedate()); } System.out.println(date);
		 */
		mv.addObject("challengelist", list); 
		mv.addObject("challcount", list2);
		mv.setViewName("/challenge/challenge"); 
		return mv; 
	}
	
	//챌린지리스트에서 챌린지상세페이지 클릭 시 각 chnum 별로 넘어감
	@GetMapping("challenge/{chnum}")
	public ModelAndView challengelistdatail(@RequestParam int chnumdetail, @AuthenticationPrincipal PrincipalDetails principaldetail) {
		ModelAndView mv = new ModelAndView();
		//닉네임 세션 가져오기
		if(principaldetail != null) {
			String nickname = principaldetail.getMemberdto().getNickname();
			System.out.println(nickname +"가 로그인 중");
			int result = service.challnickname(nickname, chnumdetail);
			System.out.println(result +" = " + nickname + "(이)가 해당챌린지에 참여하고 있는다면 1 아니면 0");
			mv.addObject("challnickname", result);
			mv.addObject("nickname", nickname);
		}else {
			int result = 2; //로그아웃 상태
			System.out.println("로그아웃 상태");
			mv.addObject("challnickname", result);
		}
		List<ChallengeDTO> list = service.challengelist();
		List<ChallengeDTO> list2 = service.challcount();
		mv.addObject("challengelist", list);
		mv.addObject("challcount", list2);
		mv.addObject("chnumdetail", chnumdetail);
		mv.setViewName("/challenge/challengedetail");
		return mv;
	}

	//챌린지 상세페이지에서 ajax 요청(참여하기)
	@GetMapping("participate")
	@ResponseBody
	public List<ChallengeDTO> chnumajax(String chnumajax, String nickname) {
		System.out.println(nickname+"(이)가 "+ chnumajax + "번 챌린지에 참여신청");
		service.insertChallengingAjax(chnumajax, nickname);
		List<ChallengeDTO> list = service.challengedetaillist(chnumajax, nickname);
		return list;
	}
	
	//챌린지 상세페이지에서 ajax 요청(취소하기)
	@GetMapping("cancel")
	@ResponseBody
	public List<ChallengeDTO> chnumajax2(String chnumajax, String nickname) {
		System.out.println(nickname+"(이)가 "+ chnumajax + "번 챌린지에 참여취소");
		service.deleteChallengingAjax(chnumajax, nickname);
		List<ChallengeDTO> list = service.challengedetaillist2(chnumajax);
		return list;
	}
	
	//////////////////////////////////좋아요//////////////////////////////////////
	//좋아요 클릭 ajax
	@GetMapping("likesbefore")
	@ResponseBody
	public List<ChallengeDTO> likesbefore(String nickname, String checkid) {
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 좋아요를 누름");
		service.insertlikes(nickname, checkid);
		MoreObject mo = new MoreObject();
		List<ChallengeDTO> list = service.checklist2("totallikes", null, mo);
		return list;
	}
	
	//좋아요 해제 ajax
	@GetMapping("likesafter")
	@ResponseBody
	public List<ChallengeDTO> likesafter(String nickname, String checkid) {
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 좋아요를 해제");
		service.deletelikes(nickname, checkid);
		Criteria cri = new Criteria();
		MoreObject mo = new MoreObject();
		List<ChallengeDTO> list = service.checklist2("totallikes", null, mo);
		return list;
	}
	
	//좋아요 수 before ajax
	@GetMapping("totallikebefore")
	@ResponseBody
	public int totallikebefore(String checkid) {
		int totallike = service.totallike(checkid) + 1;
		System.out.println("좋아요 수 " + totallike +"개");
		return totallike;
	}
		
	//좋아요 수 after ajax
	@GetMapping("totallikeafter")
	@ResponseBody
	public int totallikeafter(String checkid) {
		int totallike = service.totallike(checkid) - 1;
		System.out.println("좋아요 수 " + totallike +"개");
		return totallike;
	}
	/////////////////////////////////////////////////////////////////////
	//신고 클릭 ajax
	@GetMapping("singobefore")
	@ResponseBody
	public List<ChallengeDTO> singobefore(String nickname, String checkid) {
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 신고를 누름");
		service.insertsingo(nickname, checkid);
		Criteria cri = new Criteria();
		MoreObject mo = new MoreObject();
		List<ChallengeDTO> list2 = service.checklist2("totallikes", null, mo);
		return list2;
	}
	
	
	//신고 해제 ajax
	
	@GetMapping("singoafter")
	@ResponseBody 
	public List<ChallengeDTO> singoafter(String nickname, String checkid) { 
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 신고 해제");
		service.deletesingo(nickname, checkid);
		Criteria cri = new Criteria();
		MoreObject mo = new MoreObject();
		List<ChallengeDTO> list2 = service.checklist2("totallikes", null, mo);
		return list2; 
	}
	 
	
	//신고 수 before ajax
	@GetMapping("totalsingobefore")
	@ResponseBody
	public int totalsingobefore(String checkid) {
		System.out.println(checkid);
		int totalsingo = service.totalsingo(checkid) + 1;
		System.out.println(totalsingo +"좋아요 개수");
		return totalsingo;
	}
	
	//좋아요 수 after ajax
		@GetMapping("totalsingoafter")
		@ResponseBody
		public int totalsingoafter(String checkid) {
			System.out.println(checkid);
			int totalsingo = service.totalsingo(checkid) - 1;
			System.out.println(totalsingo +"좋아요 개수");
			return totalsingo;
		}
		
		
//	//정렬
//	@GetMapping("likeslist")	
//	public ModelAndView likeslist() {
//		ModelAndView mv = new ModelAndView(); 
//		List<ChallengeDTO> likeslist = service.likeslist();
//		
//		mv.addObject("likeslist", likeslist);
//		mv.setViewName("/challenge/ch-community"); // 뷰 이름 지정, jsp 이름
//		return mv; // jsp 보냄
//		
//	}
		
//	//정렬 order로 받아 넘기기
//	@GetMapping("/checkcommunity")	
//	public ModelAndView checkmorninglistorder(Authentication authentication, String order) {
//		return checkmorninglist(authentication, order);
//		
//	}	
	@GetMapping("/moreCommunity.do")
	@ResponseBody
	public List<ChallengeDTO> moreList(String order, String keyword, int pageNum){
		MoreObject mo2 = new MoreObject(pageNum, 8);
		List<ChallengeDTO> list = new ArrayList<ChallengeDTO>(); 
		
		if(order == null || order.equals("checktime") || order.equals("")) { //초기화면(/checkcommunity)
			list = service.checklist2(null, keyword, mo2);
		} else {
			list = service.checklist2(order, keyword, mo2);
		}
		
		for(ChallengeDTO i : list) {
			i.setLevel2(lib.calcLevel(i.getNickname()));
		}
		
		
		return list;
	}
		
	@Transactional	
	@GetMapping("/checkcommunity")
	public ModelAndView checkmorninglist(Authentication authentication, String order, String keyword, @Param("mo") MoreObject mo) { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> list = new ArrayList<ChallengeDTO>();
		List<Integer> levelList = new ArrayList<Integer>();	
		
		if(order == null || order.equals("checktime") || order.equals("")) { //초기화면(/checkcommunity)
			list = service.checklist2(null, keyword, mo);
		} else {
			list = service.checklist2(order, keyword, mo);
		}
		
		//레벨 부여
		for(ChallengeDTO i : list) {
			levelList.add(lib.calcLevel(i.getNickname()));
		}
	
		/////////////////정렬끝
		
		List<Integer> mylikeresult = new ArrayList<Integer>();
		List<Integer> totallike = new ArrayList<Integer>();
		List<Integer> singoresult = new ArrayList<Integer>();
		List<Integer> totalsingo = new ArrayList<Integer>();
		
		//if문 내부는 로그인을 한 상태일때
		if(authentication != null) {
			//닉네임 세션 가져오기
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			String nickname = userDetails.getMemberdto().getNickname();
			System.out.println(nickname);
			//좋아요가 있다면 1 아니면 0 => 리스트에 저장
			for(ChallengeDTO data: list) {
				mylikeresult.add(service.selecttoggle(nickname, data.getCheckid()));
				System.out.println(nickname + "가 로그인 중/" + data.getCheckid() +"=챌린지인증고유번호");
			}
			//좋아요 콘솔창 출력테스트
			for(Integer i : mylikeresult) { 
			    System.out.println(nickname+"가  "+i+"= 하트누려면 1/ 아니면0");
			}
			//////////////////////////////////////////////////////////////////////////////////////
			//신고가 있다면 1 아니면 0 => 리스트에 저장
			for(ChallengeDTO data: list) {
				singoresult.add(service.selectsingo(nickname, data.getCheckid()));
				System.out.println(nickname + "가 로그인 중/" + data.getCheckid() +"=챌린지인증고유번호");
			}
			mv.addObject("singo", singoresult);
			mv.addObject("toggle", mylikeresult);
		}
		
		for(ChallengeDTO data: list) {
			totallike.add(service.totallike(data.getCheckid()));
		}
		for(Integer i : totallike) { 
		    System.out.println(i+"= 각 인증게시물의 전체 좋아요 수");
		}
		for(ChallengeDTO data: list) {
			totalsingo.add(service.totalsingo(data.getCheckid()));
		}
		for(Integer i : totalsingo) { 
		    System.out.println(i+"= 각 인증게시물의 전체 신고 수");
		}
		
		//자동완성용 chname 전체조회
		mv.addObject("chnamelist", chservice.selectChallengeName());
		mv.addObject("level", levelList);
		mv.addObject("totalsingo", totalsingo);
		mv.addObject("totallike", totallike);
		mv.addObject("checklist", list);
		mv.setViewName("/challenge/ch-community"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}
}