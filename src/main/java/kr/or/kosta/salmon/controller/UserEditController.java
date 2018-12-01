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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		UserLocAndCatsDTO userPsnsInfo= service.getUserSimplePsns(principal.getName());
		userPsnsInfo.setCtgrNames();
		UserDTO user= service.searchUserById(principal.getName());
		model.addAttribute("userPsnsInfo",userPsnsInfo);
		model.addAttribute("user",user);
	}
	
	@PostMapping("/main/mypage/editprofile")
	public String editProfilePost(UserDTO user, Principal principal) {
		//닉네임, 프로필사진 수정
		log.info(" 프로필 수정 처리  : "+principal.getName());
		user.setUser_id(principal.getName());
		log.info(user);
		service.changeNickname(user);
		log.info(" 프로필 수정 완료 ");
		return "redirect:/main/mypage";
	}
	
	@Transactional
	@PostMapping("/main/mypage/editmyinfo")
	public String editMyInfoPost(RegistUserDTO user, Principal principal) {
		//비밀번호, 이메일, 성별, 생년월일, 지역 수정
		log.info(" 개인정보 수정 처리  : "+principal.getName());
		log.info(user);
		service.changeUserInfo(user); //users 테이블 변경
		service.changeUserLocation(user); //psns 테이블 변경
		log.info(" 개인정보 수정 완료 ");
		return "redirect:/main/mypage";
	}
	
	//이메일 중복검사 ( 본인 이메일 제외)
	@GetMapping(value="/main/mypage/emailValidator/{userid}/*",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> isValidEmail(@PathVariable("userid") String user_id, @RequestParam String user_email, Principal principal) {
			log.info("이메일 중복검사 시작 : "+user_email);
			log.info("아이디 : "+user_id);
			if(service.isExistEmail(user_email) == false) { //없는 메일
				return new ResponseEntity<>("newEmail",HttpStatus.OK);
			}else{ //존재하는 메일
				String mail = service.getUserEmail(user_id);
				log.info(mail);
				if(mail.equals(user_email)) { //내 메일
					log.info("my mail");
					return new ResponseEntity<>("myEmail",HttpStatus.OK);
				}else { 
					return new ResponseEntity<>("usedEmail",HttpStatus.OK);
				}
			}
		}	
}
