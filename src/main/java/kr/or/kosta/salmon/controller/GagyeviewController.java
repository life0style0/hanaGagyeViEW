package kr.or.kosta.salmon.controller;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.service.GaArticleService;
import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/article/*")
@Controller
public class GagyeviewController {

	@Inject
	GaArticleService gaArticleService;
	
	
	@GetMapping("/register")
	public void register(Model model) {
		ArrayList<String> categoryList = gaArticleService.getCategory();
		model.addAttribute("categoryList", categoryList);
	}
	
	
	
	@PostMapping("/submit")
	public void registArticle(ArticleDTO article, MultipartFile[] uploadFile){
		
	}

	
}
