package kr.or.kosta.salmon.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@GetMapping("/login/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied "+auth);
		model.addAttribute("msg","Access Denied");
	}
	
	@RequestMapping("/login/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info(" 로그인 요청 ");
		log.info("error : "+error);
		log.info("logout : "+logout);
		
		if(error != null) {
			//로그인 실패인 경우
			model.addAttribute("error","아이디와 비밀번호를 확인해주세요. ");
		}
		
		if(logout != null) {
			//로그아웃된 경우
			model.addAttribute("logout","!!LOGOUT!!");
		}
	}
	
	@GetMapping("/login/customLogout")
	public void logoutGET() {
		//로그아웃 페이지 보이기
		log.info(" 로그아웃 페이지 보이기 ");
	}
	
	@PostMapping("/customLogout")
	public void logoutPOST() {
		//실제 로그아웃 처리
		log.info(" 로그아웃 처리 ");
	}
}
