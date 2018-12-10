package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.MainService;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.SuggestionService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SearchController {
	
	@Inject
	MainService mainService;
	
	@Inject
	SNSService snsService;
	
	@Inject
	UserService userService;
	
	@Inject
	SuggestionService sugService;
	
	/**
	 * 통합검색창에서 검색
	 * @param value
	 * @param principal
	 * @param model
	 */
	@GetMapping("/sns/search")
	public void showSearch(@RequestParam("search-value") String value, Principal principal, Model model) {
		log.info(" requestparam 검색결과 페이지 요청  "+principal.getName()+" val : "+value);
		//유저 검색 결과
		String searchVal= value;
		value= "%"+value+"%";
		List<UserDTO> userList= userService.searchUserInSNS(value);
		//팔로잉 여부 판단
		try {
			int i=0;
			for (UserDTO user : userList) {
				if(user.getUser_id().equals(principal.getName())){
					userList.remove(i);
				}else {
					if(sugService.checkFollow(user.getUser_id(), principal.getName())) {
						//팔로우 하는 사용자 -> 언팔 가능
						user.setIsFollow("unfollowable");
					}else {
						//아직 팔로우 하지 않은 사용자 -> 팔로 가능
						user.setIsFollow("followable");
					}
				}
				i++;
			}
		}catch (Exception e) {
		}
	
		ArrayList<SNSArticleDTO_sjh> articleList = snsService.searchArticles(value);
		ArrayList<HashTagGroupDTO> hashTagList = snsService.getSearchHashTagGroup(value);
	//	ArrayList<SNSArticleDTO_sjh> suggestionList = snsService.searchSuggestions(value);
		ArrayList<GroupDTO_lhr> groupList = snsService.searchGroups(value);
		
		model.addAttribute("searchVal",searchVal);
		model.addAttribute("userList",userList);
		model.addAttribute("articleList",articleList);
	//	model.addAttribute("suggestionList",suggestionList);
		model.addAttribute("hashTagList",hashTagList);
		model.addAttribute("groupList",groupList);
		
		ObjectMapper objmapper= new ObjectMapper();
		try {
			String articleListJSON= objmapper.writeValueAsString(articleList);
			String hashTagListJSON= objmapper.writeValueAsString(hashTagList);
			String groupListJSON= objmapper.writeValueAsString(groupList);
	//		String suggestionListJSON= objmapper.writeValueAsString(suggestionList);
			model.addAttribute("articleListJSON", articleListJSON);
			model.addAttribute("hashTagListJSON", hashTagListJSON);
			model.addAttribute("groupListJSON", groupListJSON);
	//		model.addAttribute("suggestionListJSON", suggestionListJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		// 유저 정보
		UserDTO meDTO = snsService.getSimpleUser(principal.getName());
		model.addAttribute("me", meDTO);
		try {
			String meJSON = objmapper.writeValueAsString(meDTO);
			model.addAttribute("meJSON", meJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
/*	@GetMapping("/sns/search")
	public void showAllGET(Principal principal, Model model) {
		log.info(" 검색결과 페이지 요청 "+principal.getName());
		String user_id = principal.getName();
		
		ArrayList<HashTagGroupDTO> hashTagList = snsService.getAllHashTagGroup();
		ArrayList<SNSArticleDTO_sjh> newArticleList = snsService.getSNSNewArticles();
		log.info(newArticleList);

		model.addAttribute("newArticleList", newArticleList);
		model.addAttribute("hashTagList", hashTagList);
		
		ObjectMapper objmapper= new ObjectMapper();
		try {
			String newArticleListJSON= objmapper.writeValueAsString(newArticleList);
			model.addAttribute("newArticleListJSON", newArticleListJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//전체 게시글중 인기글과 최신글
		MainFeedArticlesDTO newAndPop= snsService.getNewAndPopArticles();
		ArrayList<SNSArticleDTO_sjh> newArticles= newAndPop.getNewArticles();
		ArrayList<SNSArticleDTO_sjh> popularArticles= newAndPop.getPopArticles();
		model.addAttribute("newArticles", newArticles);
		model.addAttribute("popularArticles", popularArticles);
		
		try {
			String newArticlesJSON = objmapper.writeValueAsString(newArticles);
			String popularArticlesJSON = objmapper.writeValueAsString(popularArticles);
			model.addAttribute("newArticlesJSON", newArticlesJSON);
			model.addAttribute("popularArticlesJSON", popularArticlesJSON);
		}catch (Exception e) {
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
	*/
	/**
	 * 통합검색창 검색
	 * @param value 검색값
	 * @param principal
	 * @return 검색결과
	 */
	@GetMapping(value="/sns/search/{search-value}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> searchUserGET(@PathVariable("search-value") String value,Principal principal) {
	//public ResponseEntity<List<UserDTO>> searchUserGET(@PathVariable("search-value") String value,Principal principal) {
	//public void searchUserGET(@RequestParam("search-value") String value,Principal principal) {
		log.info(" 사용자 검색 요청  from "+principal.getName()+" to "+value);
	//	List<UserDTO> userlist= userService.searchUserInSNS(value);
	//	log.info(userlist);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
}
