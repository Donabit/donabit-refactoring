package donabit.challenge;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import check.CheckDTO;
import check.CheckService;
import joinlogin.MemberDTO;
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
	public ModelAndView challengelist() { // Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> list = service.challengelist();
		List<ChallengeDTO> list2 = service.challcount();
		mv.addObject("challengelist", list); // "변수이름", "변수에 넣을 데이터"
		mv.addObject("challcount", list2);
		mv.setViewName("challenge"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}
	
	//챌린지리스트에서 챌린지상세페이지 클릭 시 각 chnum 별로 넘어감
	@GetMapping("challengedetail/{chnum}")
	public ModelAndView challengelistdatail(@RequestParam int chnumdetail) {
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> list = service.challengelist();
		List<ChallengeDTO> list2 = service.challcount();
		int result = service.challnickname(chnumdetail);
		System.out.println(result);
		mv.addObject("challengelist", list);
		mv.addObject("challcount", list2);
		mv.addObject("challnickname", result);
		mv.addObject("chnumdetail", chnumdetail);
		mv.setViewName("challengedetail");
		return mv;
	}

	//챌린지 상세페이지에서 ajax 요청
	@PostMapping("participate")
	@ResponseBody
	public List<ChallengeDTO> chnumajax(String chnumajax, String nicknameajax) {
		System.out.println(chnumajax);
		System.out.println(nicknameajax);
		service.insertChallengingAjax(chnumajax);
		List<ChallengeDTO> list = service.challengedetaillist(chnumajax, nicknameajax);
		return list;
	}
	
	//챌린지 상세페이지에서 ajax 요청(취소하기)
	@PostMapping("cancel")
	@ResponseBody
	public List<ChallengeDTO> chnumajax2(String chnumajax, String nicknameajax) {
		System.out.println(chnumajax);
		System.out.println(nicknameajax);
		service.deleteChallengingAjax(chnumajax, nicknameajax);
		List<ChallengeDTO> list = service.challengedetaillist2(chnumajax);
		return list;
	}
	
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
	
		@GetMapping("totallikebefore")
		@ResponseBody
		public int totallikebefore(String checkid) {
			System.out.println(checkid);
			int totallike = service.totallike(checkid) + 1;
			System.out.println(totallike +"좋아요 개수");
			return totallike;
		}
		
		
		@GetMapping("totallikeafter")
		@ResponseBody
		public int totallikeafter(String checkid) {
			System.out.println(checkid);
			int totallike = service.totallike(checkid) - 1;
			System.out.println(totallike +"좋아요 개수");
			return totallike;
		}
	//인증 커뮤니티
	@GetMapping("/checkcommunity")
	public ModelAndView checkmorninglist(Authentication authentication) { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView(); 
		List<ChallengeDTO> list = service.checklist2();
		List<Integer> mylikeresult = new ArrayList<Integer>();
		List<Integer> totallike = new ArrayList<Integer>();
		
		//if문 내부는 로그인을 한 상태일때
		if(authentication != null) {
			PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
			String nickname = userDetails.getMemberdto().getNickname();
			System.out.println(nickname); 
			for(ChallengeDTO data: list) {
				mylikeresult.add(service.selecttoggle(nickname, data.getCheckid()));
				System.out.println(nickname + "가 로그인 중/" + data.getCheckid() +"=챌린지인증고유번호");
			}
			for(Integer i : mylikeresult) { 
			    System.out.println(nickname+"가  "+i+"=하트누려면1 / 아니면0");
			}
			mv.addObject("toggle", mylikeresult);
		}
		
		for(ChallengeDTO data: list) {
			totallike.add(service.totallike(data.getCheckid()));
		}
		for(Integer i : totallike) { 
		    System.out.println(i+"= 각 인증게시물의 전체 좋아요 수");
		}
		
		mv.addObject("totallike", totallike);
		mv.addObject("checklist", list);
		mv.setViewName("ch-community"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}

	  
	
	
	/*
	 * // test
	 * 
	 * @PostMapping("challenge3")
	 * 
	 * @ResponseBody public String aaa(String name) { if (name.equals("ajax")) {
	 * return "{\"같음\" : \"ajax\"}"; }else { return "{\"다름\" : \"ajax2\"}"; }
	 * 
	 * }
	 */
}