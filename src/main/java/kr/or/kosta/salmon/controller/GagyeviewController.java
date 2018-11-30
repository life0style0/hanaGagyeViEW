package kr.or.kosta.salmon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/article/*")
@AllArgsConstructor
public class GagyeviewController {

	@GetMapping("/register")
	public void register() {
	
	}
	
	
	
	@GetMapping("/submit")
	public void registArticle(){
		log.info("imin");
	}

	
}
