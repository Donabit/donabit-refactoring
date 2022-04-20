package donabit.challenge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import check.CheckDTO;
import check.CheckService;

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
		mv.addObject("challcount", list2);
		mv.addObject("challengelist", list); // "변수이름", "변수에 넣을 데이터"
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
	
	//인증 커뮤니티
	@GetMapping("/checkcommunity")
	public ModelAndView checkmorninglist() { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView(); 
		//List<CheckDTO> list = service2.checklist();
		//mv.addObject("checklist", list);
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