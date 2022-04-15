package joinlogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	

/*	
	@RequestMapping(value="/insertmember", method= RequestMethod.GET)
	public String insertform() {
		return "joinform";
	}
	@RequestMapping(value="/insertmember", method= RequestMethod.POST)
	public ModelAndView insertresult(MemberDTO dto) {
		//dto.setId(request.getParameter(id)
		int result = service.insertmember(dto); //id, email, phone 중복 불가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("joinresult");
		return mv;
	}
*/	
	@GetMapping("/loginform")
	public String loginform() {
		return "loginform";
	}
	
	@GetMapping("/joinform")
	public String joinform() {
		return "joinform";
	}
	
/*	@PostMapping("/join")
	public @ResponseBody String join(MemberDTO dto) {
		System.out.println(dto);
		return "join";
	}
*/	
	@RequestMapping(value="/joinresult", method= RequestMethod.POST)
	public ModelAndView joinresult(MemberDTO dto) {
		//dto.setId(request.getParameter(id)
		int result = service.insertmember(dto); //id, email, phone 중복 불가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("joinresult");
		return mv;
	}
}



