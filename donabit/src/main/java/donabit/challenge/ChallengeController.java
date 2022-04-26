package donabit.challenge;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import check.CheckService;
import joinlogin.PrincipalDetails;

@Controller
public class ChallengeController {
	@Autowired
	@Qualifier("challengeservice")
	ChallengeService service;
	
	@Autowired
	@Qualifier("checkservice")
	CheckService service2;
	
	

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
		mv.setViewName("challenge"); 
		return mv; 
	}
	
	@GetMapping("/test")
	public ModelAndView test(Authentication authentication){
		ModelAndView mv = new ModelAndView();
		PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		String nickname = userDetails.getMemberdto().getNickname();
		int[] exp = service.selectexp(nickname);
		int[] level = service.selectlevel();
		int levelresult = 0;
		int sum = Arrays.stream(exp).sum();
		System.out.println(sum +"= "+ nickname+ "경험치 총합계");
		//경험치 구간이 level 1이하 일때
		if( sum <= level[0]) {
			levelresult = 1;
		}
		//경험치가 구간이 level 1초과 일때
		for(int i=0; i<level.length; i++) {
			System.out.println(level[i] + "=level배열");
			if(level[i] < sum) {
				if(sum  <= level[i+1]) {
					levelresult = i+2;
				}
			}
		}
		System.out.println(levelresult +"=" + nickname + "의 레벨");
		mv.addObject("level", levelresult);
		mv.addObject("expsum", sum);
		mv.setViewName("mypage");
		return mv;
	
	}
	
	//챌린지리스트에서 챌린지상세페이지 클릭 시 각 chnum 별로 넘어감
	@GetMapping("challenge/{chnum}")
	public ModelAndView challengelistdatail(@RequestParam int chnumdetail, Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		//닉네임 세션 가져오기
		if(authentication != null) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			String nickname = userDetails.getMemberdto().getNickname();
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
		mv.setViewName("challengedetail");
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
		List<ChallengeDTO> list = service.checklist2();
		return list;
	}
	
	//좋아요 해제 ajax
	@GetMapping("likesafter")
	@ResponseBody
	public List<ChallengeDTO> likesafter(String nickname, String checkid) {
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 좋아요를 해제");
		service.deletelikes(nickname, checkid);
		List<ChallengeDTO> list = service.checklist2();
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
		List<ChallengeDTO> list2 = service.checklist2();
		return list2;
	}
	
	//신고 해제 ajax
	
	@GetMapping("singoafter")
	@ResponseBody 
	public List<ChallengeDTO> singoafter(String nickname, String checkid) { 
		System.out.println(nickname + " 유저가" + checkid + "번 게시물의 신고 해제");
		service.deletesingo(nickname, checkid); 
		List<ChallengeDTO> list2 = service.checklist2();
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
		
	//인증 커뮤니티
	@GetMapping("/checkcommunity")
	public ModelAndView checkmorninglist(Authentication authentication) { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView(); 
		List<ChallengeDTO> list = service.checklist2();
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
		
		mv.addObject("totalsingo", totalsingo);
		mv.addObject("totallike", totallike);
		mv.addObject("checklist", list);
		mv.setViewName("ch-community"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}
}