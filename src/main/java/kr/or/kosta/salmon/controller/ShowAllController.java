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
}
