package kr.or.kosta.salmon.controller;


import java.security.Principal;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;
import kr.or.kosta.salmon.service.SNSService;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class FeedsController {
	
	@Inject
	UserService userService;
	
	@Inject
	SNSService snsService;
	
	@GetMapping("/sns/feeds")
	public void FeedsPageGet(@RequestParam("userid") String user_id, Principal principal, Model model) {
		log.info(" sns 유저 페이지 "+ user_id);
		//user 정보
		UserDTO user= userService.searchUserById(user_id);
		model.addAttribute("user",user);
		
		//카테고리,지역 정보 가져오기
		UserLocAndCatsDTO userPsnsInfo = userService.getUserSimplePsns(user.getUser_id());
		userPsnsInfo.setCtgrNames();
		userPsnsInfo.setCtgryNamesArr();
		model.addAttribute("userPsnsInfo",userPsnsInfo);
		
		//이 페이지 유저가 쓴 게시글
		ArrayList<SNSArticleDTO_sjh> myArticles= snsService.getSNSArticleByWriter(user_id);
		model.addAttribute("myArticles",myArticles);
		
		if(snsService.checkFollowing(principal.getName(), user_id)) {
			//팔로우 하는 사용자 -> 언팔 가능
			model.addAttribute("follow","unfollowable");
		}else {
			//아직 팔로우 하지 않은 사용자 -> 팔로 가능
			model.addAttribute("follow","followable");
		}
	}
	
	@GetMapping(value="/sns/follow/{follow-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> followGet(@PathVariable("follow-id") String followId, Principal principal) {
		log.info(" 팔로 요청  from "+principal.getName()+" to "+followId);
		//팔로 처리
		snsService.askFollow(principal.getName(), followId);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	@GetMapping(value="/sns/unfollow/{follow-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> unfollowGet(@PathVariable("follow-id") String followId, Principal principal) {
		log.info(" 언팔로 요청  from "+principal.getName()+" to "+followId);
		snsService.askUnfollow(principal.getName(), followId);
		log.info("언팔 끝");
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
}
