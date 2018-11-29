package kr.or.kosta.salmon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		System.out.println("imin");
	}

	
}
