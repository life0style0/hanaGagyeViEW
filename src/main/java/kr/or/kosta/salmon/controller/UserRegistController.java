package kr.or.kosta.salmon.controller;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/regist/*")
@Controller
public class UserRegistController {
	
	@Inject
	UserService service;
	@Inject
	private PasswordEncoder pwEncoder;
	
	@GetMapping("/register")
	public void regist() {
		log.info(" 회원가입 페이지 요청 ");
	}
	
	@PostMapping("/register")
	public String register(RegistUserDTO user, RedirectAttributes rttr) {
		log.info(" 회원가입 처리 : "+user);
		log.info("userService: "+service);
		log.info("passwordEncoder : "+pwEncoder);
		user.setUser_passwd(pwEncoder.encode(user.getUser_passwd()));
		service.userRegist(user);
		log.info("회원가입 완료");
		rttr.addFlashAttribute("registRes","success");
		rttr.addFlashAttribute("user_id",user.getUser_id());
		return "redirect:/regist/register-confirm";
	}
	
	@GetMapping("/register-confirm")
	public void registConfirm() {
		log.info(" 회원가입 결과 페이지 요청 ");
	}
	
	//아이디 중복검사
	@GetMapping(value="/idValidator/{userid}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> isValidId(@PathVariable("userid") String user_id) {
		log.info("아이디 중복검사 시작 : "+user_id);
		if(service.isExistId(user_id) == false) { //없는 아이디
			return new ResponseEntity<>("newId",HttpStatus.OK);
		}else { //존재하는 아이디
			return new ResponseEntity<>("usedId",HttpStatus.OK);
		}
	}
	
	//이메일 중복검사
	@GetMapping(value="/emailValidator/*",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> isValidEmail(@RequestParam String user_email) {
		log.info("이메일 중복검사 시작 : "+user_email);
		if(service.isExistEmail(user_email) == false) { //없는 메일
			return new ResponseEntity<>("newEmail",HttpStatus.OK);
		}else { //존재하는 메일
			return new ResponseEntity<>("usedEmail",HttpStatus.OK);
		}
	}	
	
	//닉네임 중복검사
	@GetMapping(value="/nicknameValidator/{usernickname}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> isValidNickname(@PathVariable("usernickname") String user_nickname) {
		log.info("닉네임 중복검사 시작 : "+user_nickname);
		if(service.isExistNickname(user_nickname) == false) { //없는 닉네임
			return new ResponseEntity<>("newNickname",HttpStatus.OK);
		}else { //존재하는 닉네임
			return new ResponseEntity<>("usedNickname",HttpStatus.OK);
		}
	}		

}
