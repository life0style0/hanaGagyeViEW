package kr.or.kosta.salmon.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/auth/*")
@Controller
public class SampleController {

	@GetMapping("/all")
	public void doAll() {
		log.info("누구나 접근가능 페이지 ");
	}
	
	@GetMapping("/user")
	public void doUser(Principal principal) {
		log.info("회원 가능 페이지");	
		log.info("user id : "+principal.getName());
	}
		
	@GetMapping("/member")
	public void doMember() {
		log.info("멤버 가능 페이지");			
	}
		
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자만 가능 페이지");
	}

}
