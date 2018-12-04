package kr.or.kosta.salmon.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
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
	
	@GetMapping("/edit")
	public void edit(Model model, int article_id) {
		MainArticleDTO editArticle = gaArticleService.getEditArticle(article_id);
		editArticle.setArticle_id(article_id);
		String ctgryName = gaArticleService.getCtgryName(editArticle.getArticle_ctgry_id());
		ArrayList<String> categoryList = gaArticleService.getCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("editArticle", editArticle);
		model.addAttribute("ctgryName", ctgryName);
	}
	
	
	
	@PostMapping("/submit")
	public ResponseEntity<String> registArticle(ArticleDTO article, String article_ctgry_name, String categoryName ,Principal principal, Model model){
		//create 준비과정
		article.setArticle_ctgry_id(Integer.parseInt(gaArticleService.getArticleCategoryByName(article_ctgry_name.trim())));
		article.setUser_id(principal.getName());
		//카테고리 생성 준비
		int categoryNum = Integer.parseInt(gaArticleService.getCategoryByName(categoryName));
		ArrayList<String> hashTagList = getHashTag(article.getArticle_content());
		
		switch(article.getArticle_scope().trim()){
		case "public":
			article.setArticle_scope("u");
			break;
		case "private":
			article.setArticle_scope("r");
			break;
		case "group":
			article.setArticle_scope("g");
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
	
	@PostMapping("/update")
	public ResponseEntity<String> updateArticle(ArticleDTO article, String article_ctgry_name, String categoryName ,Principal principal, Model model){
		//update 사전작업
		int article_id = article.getArticle_id();
		gaArticleService.deleteCtgry(article_id);
		gaArticleService.deleteHash(article_id);
		gaArticleService.deleteHashRefs(article_id);
		gaArticleService.deleteImages(article_id);
		
		//update준비과정
		article.setArticle_ctgry_id(Integer.parseInt(gaArticleService.getArticleCategoryByName(article_ctgry_name.trim())));
		article.setUser_id(principal.getName());
		//카테고리 생성 준비
		int categoryNum = Integer.parseInt(gaArticleService.getCategoryByName(categoryName));
		ArrayList<String> hashTagList = getHashTag(article.getArticle_content());
		
		switch(article.getArticle_scope().trim()){
		case "public":
			article.setArticle_scope("u");
			break;
		case "private":
			article.setArticle_scope("r");
			break;
		case "group":
			article.setArticle_scope("g");
			break;
		}
		gaArticleService.updateArticle(article);
		
		CategoryDTO categoryDto = new CategoryDTO();
		categoryDto.setCtgry_id(categoryNum);
		categoryDto.setArticle_id(article_id);
		gaArticleService.createCategory(categoryDto);
		
		//해시태그 처리
		if(hashTagList.size() > 0){
			HashTagDTO hashTagDTO;
			for(int j = 0; j < hashTagList.size(); j++){
				hashTagDTO = new HashTagDTO();
				hashTagDTO.setHashtag_value((String)hashTagList.get(j));
				hashTagDTO.setArticle_id(article_id);
				gaArticleService.createHashTag(hashTagDTO);
			}
		}

		return new ResponseEntity<>(Integer.toString(article_id),HttpStatus.OK);
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
	
	@PostMapping("/imageUpload")
	public ResponseEntity<String> registImage(@RequestParam("uploadFile") MultipartFile[] uploadFile, @RequestParam("articleId") String articleId){
		log.info("articleId check : " + articleId);
		log.info("formData check : " + uploadFile);
		log.info("formData size : " + uploadFile.length);
		log.info("formdata toString : " + uploadFile.toString());
		String uploadFolder = "C:\\upload";
		File uploadPath = new File(uploadFolder, "\\images");
		log.info("upload path:" + uploadPath);
		if(uploadPath.exists()==false){
			uploadPath.mkdirs();
		}
		for(MultipartFile multipartFile : uploadFile){
			log.info("----------테스트-----------");
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload File size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" +uploadFileName;
			File saveFile = new File(uploadPath, uploadFileName);
			ImageDTO imageDTO = new ImageDTO();
			int article_id = Integer.parseInt(articleId);
			imageDTO.setArticle_id(article_id);
			imageDTO.setImage_path(uploadFileName);
			log.info(imageDTO.toString());
			gaArticleService.createImageInfo(imageDTO);
			
			try{
				multipartFile.transferTo(saveFile);
			}catch(Exception e){
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	
	private String getFolder(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		//String reValue = str.replaceAll("-",  File.separator).concat(principal.getName());
		return str.replace("-", File.separator);
	}
	
}
