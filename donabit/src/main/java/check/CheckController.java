package check;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import donabit.challenge.ChallengeDTO;

@Controller
public class CheckController {
	@Autowired
	@Qualifier("checkservice")
	CheckService service;
	
	//뷰의 요청경로 지정
	@GetMapping("/checkmorningform")
	public ModelAndView checkmorningselect(HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		int count = service.selectcountchallenge();
		int successcount = service.selectchsuccess();
		int selectchecktime = service.selectchecktime();				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(selectchecktime == 0) {
			if(count == successcount) {
				out.print("<script>alert('챌린지를 성공하셨습니다.'); location.href = '/checkmorning';</script>");
				out.flush();
			}
			int result = count + 1;
			mv.addObject("result", result);
			mv.setViewName("checkmorningform");
			return mv;
			}
		out.print("<script>alert('하루에 하나만 올릴 수 있습니다.'); location.href = '/checkmorning';</script>");
		out.flush();
		return mv;
	}
	
		
	@PostMapping("/checkmorningform")
	public ModelAndView checkmorning(CheckDTO dto) {
		service.insertCheck(dto);
		int count = service.selectcountchallenge();
		int successcount = service.selectchsuccess();
		if(count == successcount) {
			service.updatepersonalpf();
		}
		return checkmorninglist();
	}
	
	
	@GetMapping("/checkmorning")
	public ModelAndView checkmorninglist() { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView(); 
		List<CheckDTO> list = service.checklist();
		mv.addObject("checklist", list);
		mv.setViewName("checkmorning"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}

	
	
}
