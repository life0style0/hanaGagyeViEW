package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.MainService;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ShowAllController {
	
	@Inject
	MainService mainService;
	
	@Inject
	SNSService snsService;
	
	@Inject
	UserService userService;
	
	@GetMapping("/sns/showall")
	public void showAllGET(Principal principal, Model model) {
		log.info("전체 게시글 조회 페이지 요청 ");
		String user_id = principal.getName();
		
		
	//	ArrayList<HashTagGroupDTO> hashTagList = (ArrayList)mainService.getHashTagGroup(user_id);
		ArrayList<HashTagGroupDTO> hashTagList = snsService.getAllHashTagGroup();
//		ArrayList<SNSArticleDTO_sjh> articleList = (ArrayList)snsService.getSNSArticles(user_id);
		ArrayList<SNSArticleDTO_sjh> newArticleList = snsService.getSNSNewArticles();
		log.info(newArticleList);
		ArrayList<GroupDTO_lhr> groupsBynewArticleList= snsService.getGroupsBySNSNewArticles();

	//	MainChartDTO mainchartIncomeInfo = mainService.getChartTotalIncomeFee(user_id);
	//	MainChartDTO mainchartSpendInfo = mainService.getChartTotalSpendFee(user_id);
		/*
		log.info("null test " +user_id);
		if(mainchartIncomeInfo != null) {
			mainchartIncomeInfo.setCtGroupFee(mainService.getChartCategoryIncomeFee(user_id));
			log.info(mainchartIncomeInfo.toString());
		}
		if(mainchartSpendInfo != null) {
			mainchartSpendInfo.setCtGroupFee(mainService.getChartCategorySpendFee(user_id));
			log.info(mainchartSpendInfo.toString());
		} 
		*/
	//	model.addAttribute("mainchartIncomeInfo", mainchartIncomeInfo);
	//	model.addAttribute("mainchartSpendInfo", mainchartSpendInfo);
		model.addAttribute("newArticleList", newArticleList);
		model.addAttribute("hashTagList", hashTagList);
		model.addAttribute("groupsBynewArticleList", groupsBynewArticleList);
		
		//ArrayList<SNSArticleDTO_sjh> articleListJSON = (ArrayList)snsService.getSNSArticles(user_id);
		ObjectMapper objmapper= new ObjectMapper();
		try {
			String newArticleListJSON= objmapper.writeValueAsString(newArticleList);
			model.addAttribute("newArticleListJSON", newArticleListJSON);
			String groupsBynewArticleListJSON= objmapper.writeValueAsString(groupsBynewArticleList);
			model.addAttribute("groupsBynewArticleListJSON", groupsBynewArticleListJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//전체 게시글중 인기글과 최신글
	/*	MainFeedArticlesDTO newAndPop= snsService.getNewAndPopArticles();
		ArrayList<SNSArticleDTO_sjh> newArticles= newAndPop.getNewArticles();
		ArrayList<SNSArticleDTO_sjh> popularArticles= newAndPop.getPopArticles();
		model.addAttribute("newArticles", newArticles);
		model.addAttribute("popularArticles", popularArticles);*/
		/*
		try {
			String newArticlesJSON = objmapper.writeValueAsString(newArticles);
			String popularArticlesJSON = objmapper.writeValueAsString(popularArticles);
			model.addAttribute("newArticlesJSON", newArticlesJSON);
			model.addAttribute("popularArticlesJSON", popularArticlesJSON);
		}catch (Exception e) {
			e.printStackTrace();
		}
		*/
		//유저 정보
		UserDTO meDTO= snsService.getSimpleUser(principal.getName());
		model.addAttribute("me",meDTO);
		try {
			String meJSON= objmapper.writeValueAsString(meDTO);
			model.addAttribute("meJSON", meJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
	}
	
/*	
    
	@GetMapping(value="/main/article/{articleId}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SNSArticleDTO_sjh> getArticleGET(@PathVariable("articleId") int articleId, Principal principal,  Model model) {
		log.info("article 정보 업데이트");
		String user_id = principal.getName();
		SNSArticleDTO_sjh article= snsService.getArticleByArticleId(articleId);
		log.info(article);
		return new ResponseEntity<SNSArticleDTO_sjh>(article,HttpStatus.OK);
		//model.addAttribute("article", article);
	}
	
	*/
}
