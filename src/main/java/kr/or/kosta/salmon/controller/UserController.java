package kr.or.kosta.salmon.controller;
import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
/**
 * 회원가입 처리
 * @author 송주현
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/regist/*")
@Controller
public class UserController {
	
	@Inject
	UserService service;
	@Inject
	private PasswordEncoder pwEncoder;
	
	@GetMapping("/register")
	public void regist() {
		log.info(" 회원가입 페이지 요청 ");
	}
	
	@PostMapping("/register")
	public String register(UserDTO user, RedirectAttributes rttr) {
		
		log.info(" 회원가입 처리 : "+user);
		log.info("userService: "+service);
		log.info("passwordEncoder : "+pwEncoder);
		user.setUser_passwd(pwEncoder.encode(user.getUser_passwd()));
		service.userRegist(user);
		log.info("회원가입 완료");
		rttr.addFlashAttribute("registRes","success");
		rttr.addFlashAttribute("user_id",user.getUser_id());
		return "redirect:/auth/all";
	}

}
