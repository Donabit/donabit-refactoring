package joinlogin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
	
	//회원가입 검증
	// 이메일 중복 체크
		 @ResponseBody
		 @RequestMapping(value="/emailchk", method = RequestMethod.POST)
		 public int emailchk(MemberDTO dto) throws Exception {
		      int result = service.emailchk(dto);
		      return result;
		  }
		 
		    // 닉네임 중복 체크
		 @ResponseBody
		 @RequestMapping(value="/nickchk", method = RequestMethod.POST)
		 public int nickchk(MemberDTO dto) throws Exception {
		    int result = service.nickchk(dto);
		    return result;
		  }  
	
	
	
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
		
	/*
	  	int check1 = service.emailchk(dto);
	 
		int check2 = service.nickchk(dto);
		
		try {
				if(check1 ==1 || check2==1) {
					return "redirect:/joinform";
			}else if (check1 ==0 && check2==0){
		String rawPassword=dto.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rawPassword);
		dto.setPassword(encPassword);

		int result = service.insertmember(dto);
				
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result); //int
		mv.setViewName("joinresult");
			
			}
			
		}catch(Exception e) {
			throw new Exception();
		}
		return mv;
		
	*/	
		
		
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
	
	
	@RequestMapping(value="/passwordmodifyform", method= RequestMethod.GET)
	public String passwordmodifyform(String email) {
		return "passwordmodifyform"; 
	}
	
	@RequestMapping(value="/pwcheck" , method=RequestMethod.POST)
	@ResponseBody
	public int pwcheck(PrincipalDetails memberdto, Authentication auth, @RequestParam("memberPw") String pw) throws Exception{
		memberdto = (PrincipalDetails)auth.getPrincipal();
		String memberPw = memberdto.getPassword();
		if(!bCryptPasswordEncoder.matches(pw, memberPw)) {
			return 0;
		}
		return 1;
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


	
	  @RequestMapping(value="/deleteview", method=RequestMethod.GET)
		public String deleteView() throws Exception{
			return "deleteview";
		}
	    	    
	    
	    @RequestMapping(value="/deletemember", method=RequestMethod.POST)
		public String deletemember(String email, RedirectAttributes rttr, HttpSession session)throws Exception{
	    	int result = service.deletemember(email);
	    	
	    	if(result == 1) {
	    		//session.invalidate();
	    		//rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
	    		return "redirect:/logout";
	    	}
			return "redirect:/main";
		}
		
	
	   

}



