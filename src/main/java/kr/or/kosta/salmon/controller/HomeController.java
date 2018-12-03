package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		log.info("Welcome home! The client locale is {}.");
		log.info( "is login info null : "+(principal == null));
		
		//return "login";
		if(principal != null) {
		//	log.info(" main home ");
			return "main/home";
		} else {
			return "login";
		}
	}
	
}
