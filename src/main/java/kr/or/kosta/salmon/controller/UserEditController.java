package kr.or.kosta.salmon.controller;
import java.security.Principal;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
/**
 * 회원가입 처리
 * @author 송주현
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserEditController {
	
	@Inject
	UserService service;
	@Inject
	private PasswordEncoder pwEncoder;
	
	@GetMapping("/main/mypage")
	public void mypageGet(Principal principal, Model model) {
		log.info(" 마이페이지 요청  : "+principal.getName());
		//카테고리,지역 정보 가져오기
		UserLocAndCatsDTO user= service.getUserSimplePsns(principal.getName());
		user.setCtgrNames();
		model.addAttribute("userPsnsInfo",user);
	}
	
	@PostMapping("/main/mypage/editprofile")
	public String editProfileGet(UserDTO user, Principal principal, Model model) {
		log.info(" 프로필 수정 처리  : "+principal.getName());
		user.setUser_id(principal.getName());
		log.info(user);
		service.changeNickname(user);
		log.info(" 프로필 수정 완료 ");
		return "redirect:/main/mypage/editprofile";
	}
}
