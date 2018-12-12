package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.kosta.salmon.domain.Auth;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */

	
@Controller
@Log4j
public class HomeController {
	@Inject
	UserService userService;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		log.info("Welcome home! The client locale is {}.");
		log.info( "is login info null : "+(principal == null));
		
		//return "login";
		if(principal != null) {
			log.info(" main home ");
	
			//blocked 유저 체크
			UserDTO user= userService.read(principal.getName());
			List<Auth> list= user.getAuthList();
			boolean isBlocked=true;
			for (Auth auth : list) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {//admin, member		
					isBlocked=false;
				}
			}
			
			if(isBlocked==true) { //블랙당한 유저	
				log.info("blocked user");
				model.addAttribute("msg","관리자에 의해 제한된 유저입니다");
				return "/login/accessError";
			}else {//admin, member	
				return "redirect:/main/home";
			}
			
		} else {
			return "login";
		}
	}
	
}
