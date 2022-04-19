package joinlogin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

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
		String rawPassword=dto.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rawPassword);
		dto.setPassword(encPassword);

		int result = service.insertmember(dto); //id, email, phone 중복 불가능
				
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("joinresult");
		return mv;
	}
	
	@GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/main";
    }
	
	
	//회원수정 탈퇴
	@RequestMapping(value="/updateform", method= RequestMethod.GET)
	public String updateform(String email) {
		return "updateform"; // 주소 이름 수정 폼
	}

	@RequestMapping(value="/memberupdate", method= RequestMethod.POST)
	public ModelAndView updateresult(MemberDTO dto) {//id(고정), name, address 입력
		
		int result = service.updatemember(dto); //id, email, phone 중복 불가능
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("updateresult");
		return mv;
	}
	
	
	@RequestMapping(value="/passwordmodify", method= RequestMethod.GET)
	public String passwordmodify(String email) {
		return "passwordmodify"; 
	}

	@RequestMapping(value="/passwordmodify", method= RequestMethod.POST)
	public ModelAndView passwordmodifyresult(MemberDTO dto) {
				
		String rawPassword=dto.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rawPassword);
		dto.setPassword(encPassword);
		
		int result = service.passwordmodify(dto); 
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("passwordmodifyresult");
		return mv;
	}
	
	
/*	 @GetMapping("passwordmodify")
	    public void getPrevModify(Authentication auth) {

	    }

	 @PostMapping("passwordmodify")
	   public String postPrevModify(Authentication auth, @RequestParam("password") String pw, RedirectAttributes rttr) {
	       MemberDTO dto = (MemberDTO)auth.getPrincipal();
	       String password = dto.getPassword();
	       if(bCryptPasswordEncoder.matches(pw, password)) {
	           return "redirect:/passwordmodifysuccess";
	        }
	       else {
	           rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
	           return "redirect:/passwordmodify";
	        }
	    }
	
*/	
	
	/*
	@RequestMapping(value="/deleteconform", method= RequestMethod.GET)
	public String deleteconform(String email) {
		return "deleteconform"; // 탈퇴확인
	}
	*/
	@RequestMapping("/deleteresult")
	public String deleteresult(String email) {
		int result = service.deletemember(email);
		
		if(result == 1) {
			return "deleteresult";//컨트롤러 url매핑 메소드 호출(회원리스트)			
		}		
		return "redirect:/main";//컨트롤러 url매핑 메소드 호출
	}

}



