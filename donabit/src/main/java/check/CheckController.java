package check;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.management.modelmbean.ModelMBeanOperationInfo;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.donabit.demo.challenge.ChallengeService2;

import donabit.challenge.ChallengeDTO;
import joinlogin.PrincipalDetails;

@Controller
public class CheckController {
	
	@Autowired
	@Qualifier("checkservice")
	CheckService service;
	
	@Autowired
	@Qualifier("ChallengeService2")
	ChallengeService2 challengeservice;
	
	//뷰의 요청경로 지정
	@GetMapping("/checkmorningform")
	public ModelAndView checkmorningselect(HttpServletResponse response, Authentication authentication, @RequestParam String chnum) throws IOException {
		PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		String nickname = userDetails.getMemberdto().getNickname();
		ModelAndView mv = new ModelAndView();
		int count = service.selectcountcheck(nickname, chnum);
		int successcount = service.selectchsuccess(chnum);
		int selectchecktime = service.selectchecktime(nickname, chnum);	
		String chname = challengeservice.selectChallengeNameByNumber(Integer.parseInt(chnum));
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(selectchecktime == 0) {
			if(count == successcount) {
				out.print("<script>window.opener.alert('"+chname+" 챌린지 성공횟수를 모두 달성하셨습니다.'); window.close(); </script>");
				out.flush();
			}
			int result = count + 1;
			mv.addObject("result", result);
			mv.setViewName("checkmorningform");
			return mv;
			}
		out.print("<script>window.opener.alert('한 챌리지당 하루에 한 번만 인증할 수 있습니다.'); window.close(); </script>");
		out.flush();
		return mv;
	}
	
		
	@PostMapping("/checkmorningform")
	public void checkmorning(HttpServletResponse response, CheckDTO dto, Authentication authentication, @RequestParam String chnum) throws IOException {
		PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		String nickname = userDetails.getMemberdto().getNickname();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		service.insertCheck(dto);
		int count = service.selectcountcheck(nickname, Integer.toString(dto.chnum));
		int successcount = service.selectchsuccess(chnum);
		if(count == successcount) {
			service.updatepersonalpf(chnum);
		}
		out.print("<script>window.opener.location.reload(); window.close(); </script>");
		out.flush();
	}
	
	
	@GetMapping("/checkmorning")
	public ModelAndView checkmorninglist(Authentication authentication, @RequestParam String chnum) {//Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		String nickname = userDetails.getMemberdto().getNickname();
		ModelAndView mv = new ModelAndView(); 
		List<CheckDTO> list = service.checklist(nickname, chnum);
		String chname = challengeservice.selectChallengeNameByNumber(Integer.parseInt(chnum));
		mv.addObject("chname", chname);
		mv.addObject("checklist", list);
		mv.setViewName("checkmorning"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}
	
	@PostMapping("/deletecheck")
	public void deletecheck(HttpServletResponse response , @RequestParam int checkid) throws IOException {
		service.deletetoggle(checkid);
		service.deletecheck(checkid);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>history.back()</script>");
		out.flush();
	}
	

}
