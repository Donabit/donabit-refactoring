package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	//뷰의 요청경로 지정
	@RequestMapping("/helloboot")
	public ModelAndView hello() { //Controller 처리 결과 후 응답할 view와 view에 전달할 값을 저장
		ModelAndView mv = new ModelAndView(); 
		mv.addObject("model", "전달할 값"); //"변수이름", "변수에 넣을 데이터"
		mv.setViewName("hello"); // 뷰 이름 지정, jsp 이름
		return mv; // jsp 보냄
	}
}
