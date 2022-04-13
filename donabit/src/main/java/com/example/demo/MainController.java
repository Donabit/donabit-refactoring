package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
		@RequestMapping("/main") 
		public String view() {
			return "main";

	}
}
