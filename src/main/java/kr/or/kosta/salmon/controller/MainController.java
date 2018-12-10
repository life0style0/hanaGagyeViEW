package kr.or.kosta.salmon.controller;

import java.io.File;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainFeedArticlesDTO;
import kr.or.kosta.salmon.domain.ReportDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.MainService;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
	@Inject
	MainService mainService;
	
	@Inject
	SNSService snsService;
	
	@Inject
	UserService userService;
	
	@GetMapping("/main/home")
	public void mainHome(Principal principal, Model model) {
		log.info("main컨트롤러 진입");
		String user_id = principal.getName();
		ArrayList<HashTagGroupDTO> hashTagList = (ArrayList)mainService.getHashTagGroup(user_id);
		ArrayList<SNSArticleDTO_sjh> articleList = (ArrayList)snsService.getSNSArticles(user_id);

		MainChartDTO mainchartIncomeInfo = mainService.getChartTotalIncomeFee(user_id);
		MainChartDTO mainchartSpendInfo = mainService.getChartTotalSpendFee(user_id);
		
		log.info("null test " +user_id);
		if(mainchartIncomeInfo != null) {
			mainchartIncomeInfo.setCtGroupFee(mainService.getChartCategoryIncomeFee(user_id));
			log.info(mainchartIncomeInfo.toString());
		}
		if(mainchartSpendInfo != null) {
			mainchartSpendInfo.setCtGroupFee(mainService.getChartCategorySpendFee(user_id));
			log.info(mainchartSpendInfo.toString());
		} 
		model.addAttribute("mainchartIncomeInfo", mainchartIncomeInfo);
		model.addAttribute("mainchartSpendInfo", mainchartSpendInfo);
		model.addAttribute("articleList", articleList);
		model.addAttribute("hashTagList", hashTagList);
		
		//ArrayList<SNSArticleDTO_sjh> articleListJSON = (ArrayList)snsService.getSNSArticles(user_id);
		ObjectMapper objmapper= new ObjectMapper();
		try {
			String articleListJSON= objmapper.writeValueAsString(articleList);
			model.addAttribute("articleListJSON", articleListJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

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
	
	@GetMapping("/main/image")
    @ResponseBody
    public ResponseEntity<byte[]> getImage(String fileName) {
        log.info("getImage : " + fileName);
        File file = new File("C:\\upload\\images\\" + fileName);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
        } catch (Exception e) {
            result = new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return result;
    }
    
	@GetMapping(value="/main/article/{articleId}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SNSArticleDTO_sjh> getArticleGET(@PathVariable("articleId") int articleId, Principal principal,  Model model) {
		log.info("article 정보 업데이트");
		log.info(articleId);
		String user_id = principal.getName();
		SNSArticleDTO_sjh article = snsService.getArticleByArticleId(articleId);
		log.info(article);
		return new ResponseEntity<SNSArticleDTO_sjh>(article,HttpStatus.OK);
		//model.addAttribute("article", article);
	}
	

	/**
	 * 게시글 신고
	 * @param articleId
	 * @param principal
	 * @return
	 */
	@PostMapping(value="/main/article/report",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> reportArticlePost(@RequestParam("user_id") String user_id,@RequestParam("article_id") int articleId, @RequestParam("report_reason") String report_reason, Principal principal) {
		log.info(" 게시글 신고 요청  from "+user_id+" to "+articleId+" by "+report_reason);
		ReportDTO report= new ReportDTO();
		report.setUser_id(user_id);
		report.setReport_reason(report_reason);
		report.setArticle_id(articleId);
		if (snsService.reportArticle(report)) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>("fail",HttpStatus.OK);
		}
		
	}
}
