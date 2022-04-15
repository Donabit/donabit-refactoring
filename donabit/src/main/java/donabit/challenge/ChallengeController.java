package donabit.challenge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChallengeController {
	@Autowired
	@Qualifier("challengeservice")
	ChallengeService service;

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

	@PostMapping("challengedetail/{chnum}")
	public ModelAndView challengelistdatail(@RequestParam int chnumdetail) {
		ModelAndView mv = new ModelAndView();
		List<ChallengeDTO> list = service.challengelist();
		List<ChallengeDTO> list2 = service.challcount();
		mv.addObject("challcount", list2);
		mv.addObject("challengelist", list);
		mv.addObject("chnumdetail", chnumdetail);
		mv.setViewName("challengedetail");
		return mv;
	}

	// test
	@PostMapping("challenge2")
	@ResponseBody
	public String aaa(String name) {
		if (name.equals("ajax")) {
			return "{\"같음\" : \"ajax\"}";
		}else {
			return "{\"다름\" : \"ajax2\"}";
		}

	}

}