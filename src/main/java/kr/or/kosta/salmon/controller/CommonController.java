package kr.or.kosta.salmon.controller;


import java.security.Principal;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Inject
	UserService service;
	
	
	@GetMapping("/login/accessError")
	public void accessDenied(Authentication auth, Model model, Principal principal) {
		log.info("access denied "+auth);
		log.info(service.read(principal.getName()));
		log.info(service.read(principal.getName()).getUser_state());
		if(service.read(principal.getName()).getUser_state().equals("B")) {
			model.addAttribute("msg","관리자에 의해 제한된 유저입니다");
		}else {
			model.addAttribute("msg","관리자 페이지로 일반 사용자 접근이 불가능합니다");
		}
		
	}
	
	@RequestMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		log.info(" 로그인 요청 ");
		log.info("error : "+error);
		log.info("logout : "+logout);
		
		if(error != null) {
			//로그인 실패인 경우
			model.addAttribute("error","!! LOGIN ERROR !! 아이디와 비밀번호를 확인하세요");
		}
		
		if(logout != null) {
			//로그아웃된 경우
			model.addAttribute("logout","로그아웃 되었습니다");
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
