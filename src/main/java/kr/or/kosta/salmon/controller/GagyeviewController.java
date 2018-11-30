package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
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
	public ResponseEntity<String> registArticle(ArticleDTO article, String article_ctgry_name, String categoryName ,Principal principal, Model model){
		//create 준비과정
		article.setArticle_ctgry_id(Integer.parseInt(gaArticleService.getArticleCategoryByName(article_ctgry_name.trim())));
		article.setUser_id("jiwon");
		//카테고리 생성 준비
		int categoryNum = Integer.parseInt(gaArticleService.getCategoryByName(categoryName));
		ArrayList<String> hashTagList = getHashTag(article.getArticle_content());
		
		switch(article.getArticle_scope().trim()){
		case "public":
			article.setArticle_scope("1");
			break;
		case "private":
			article.setArticle_scope("2");
			break;
		case "group":
			article.setArticle_scope("3");
			break;
		}
		int lastId = gaArticleService.createGaArticle(article)-1;
		
		CategoryDTO categoryDto = new CategoryDTO();
		categoryDto.setCtgry_id(categoryNum);
		categoryDto.setArticle_id(lastId);
		gaArticleService.createCategory(categoryDto);
		
		//해시태그 처리
		if(hashTagList.size() > 0){
			HashTagDTO hashTagDTO;
			for(int j = 0; j < hashTagList.size(); j++){
				hashTagDTO = new HashTagDTO();
				hashTagDTO.setHashtag_value((String)hashTagList.get(j));
				hashTagDTO.setArticle_id(lastId);
				gaArticleService.createHashTag(hashTagDTO);
			}
		}

		return new ResponseEntity<>(Integer.toString(lastId),HttpStatus.OK);
	}
	
	public ArrayList<String> getHashTag(String content){
		ArrayList<String> hashList = new ArrayList<>();
		String[] divContent = content.trim().split("#");
		for(String tagTarget : divContent){
			if(tagTarget.length() > 0){
				hashList.add(tagTarget.split(" ")[0]);
			}
		}

		return hashList;
	}
	
}
