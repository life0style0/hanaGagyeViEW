package kr.or.kosta.salmon.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.ArticleDTO;
import kr.or.kosta.salmon.domain.CategoryDTO;
import kr.or.kosta.salmon.domain.HashTagDTO;
import kr.or.kosta.salmon.domain.ImageDTO;
import kr.or.kosta.salmon.domain.ImageEditDTO;
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
		ArrayList<String> articlePathList = gaArticleService.getArticleFilePath(article_id);
		model.addAttribute("articlePathList", articlePathList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("editArticle", editArticle);
		model.addAttribute("ctgryName", ctgryName);
	}
	
	@GetMapping("/delete")
	public String delete(int article_id, Principal principal, RedirectAttributes rttr) {
		log.info("delete call...");
		if (gaArticleService.deleteArticle(article_id, principal.getName())) {
			rttr.addFlashAttribute("checkDelete", false);
			return "redirect:/accountbook/calendar";
		} else {
			rttr.addFlashAttribute("checkDelete", true);
			return "redirect:/accountbook/calendar";
		}
	}
	
	@PostMapping("/submit")
	public ResponseEntity<String> registArticle(ArticleDTO article, String article_ctgry_name, String categoryName ,Principal principal, Model model){
		//create 준비과정
		article.setArticle_ctgry_id(Integer.parseInt(gaArticleService.getArticleCategoryByName(article_ctgry_name.trim())));
		article.setUser_id(principal.getName());
		//카테고리 생성 준비
		int categoryNum = Integer.parseInt(gaArticleService.getCategoryByName(categoryName.trim()));
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
		log.info(article.toString());
		log.info(article_ctgry_name);
		log.info(categoryName);
		
		//update 사전작업
		int article_id = article.getArticle_id();
		gaArticleService.deleteCtgry(article_id);
		gaArticleService.deleteHashRefs(article_id);
		gaArticleService.deleteHash(article_id);

		
		//update준비과정
		article.setArticle_ctgry_id(Integer.parseInt(gaArticleService.getArticleCategoryByName(article_ctgry_name.trim())));
		article.setUser_id(principal.getName());
		//카테고리 생성 준비
		int categoryNum = Integer.parseInt(gaArticleService.getCategoryByName(categoryName.trim()));
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
	      int count = 1;
	      for(String tagTarget : divContent){
	         if(tagTarget.length() > 0 && count>1){
	            hashList.add(tagTarget.split(" ")[0]);
	         }
	         count++;
	      }
	      return hashList;
	   }
	
	@PostMapping("/imageUpload")
	public ResponseEntity<String> registImage(@RequestParam("uploadFile") MultipartFile[] uploadFile, @RequestParam("articleId") String articleId){
		String uploadFolder = "C:\\upload";
		File uploadPath = new File(uploadFolder, "images");
		if(uploadPath.exists()==false){
			uploadPath.mkdirs();
		}
		HashMap<String,Integer> delPathChekList = new HashMap<>();
		ArrayList<String> allList = gaArticleService.getArticleFilePath(Integer.parseInt(articleId));
		for(MultipartFile multipartFile : uploadFile){
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			ImageEditDTO imageEditDTO = new ImageEditDTO();
			imageEditDTO.setArticle_id(Integer.parseInt(articleId));
			imageEditDTO.setImage_path(uploadFileName);
			int check = gaArticleService.imageCheck(imageEditDTO);
			delPathChekList.put(imageEditDTO.getImage_path(),1);
			if(check==1){
				
			}else{
				
				UUID uuid = UUID.randomUUID();
				
				uploadFileName = uuid.toString() + "_" +uploadFileName;
				File saveFile = new File(uploadPath, uploadFileName);
				ImageDTO imageDTO = new ImageDTO();
				int article_id = Integer.parseInt(articleId);
				imageDTO.setArticle_id(article_id);
				imageDTO.setImage_path(uploadFileName);
				gaArticleService.createImageInfo(imageDTO);
				
				try{
					multipartFile.transferTo(saveFile);
				}catch(Exception e){
					log.error(e.getMessage());
				}
			}
		}
		
		//이미지삭제 작업 : 파일삭제 후 데이터베이스 삭제
		
		ArrayList<String> deleteTarget = new ArrayList<>();
		for(String path : allList){
			if(delPathChekList.get(path)==null){
				deleteTarget.add(path);
			}
		}
		deleteFiles(deleteTarget, articleId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	private void deleteFiles(ArrayList<String> path, String article_id){
		try{
			for(String filePath : path){
				Path file = Paths.get("C:/upload/images/" + filePath);
				
				Files.deleteIfExists(file);
				
				ImageEditDTO imageEditDTO = new ImageEditDTO();
				imageEditDTO.setArticle_id(Integer.parseInt(article_id));
				imageEditDTO.setImage_path(filePath);
				gaArticleService.deleteImages(imageEditDTO);
			}
		}catch(Exception e){
			log.error("delete error");
		}
	}
	
	
}
