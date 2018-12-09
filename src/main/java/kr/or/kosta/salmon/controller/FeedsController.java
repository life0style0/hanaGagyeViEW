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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
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
		SNSUserPageDTO userPageInfo= snsService.getSNSUserPageInfo(user_id);
		//user 정보
		//UserDTO user= userService.searchUserById(user_id);
		UserDTO user= userPageInfo.getUser();
		log.info(user);
		model.addAttribute("user",user);
		
		//카테고리,지역 정보 가져오기
		//UserLocAndCatsDTO userPsnsInfo = userService.getUserSimplePsns(user.getUser_id());
		UserLocAndCatsDTO userPsnsInfo = userPageInfo.getMyPsnsInfo();
		userPsnsInfo.setCtgrNames();
		userPsnsInfo.setCtgryNamesArr();
		log.info(userPsnsInfo.getCtgryNames().length);
		for (String str : userPsnsInfo.getCtgryNames()) {
			log.info(str);
		}
		log.info(userPsnsInfo);
		model.addAttribute("userPsnsInfo",userPsnsInfo);
		
		//이 페이지 유저가 쓴 게시글
		//ArrayList<SNSArticleDTO_sjh> myArticles= snsService.getSNSArticleByWriter(user_id);
		ArrayList<SNSArticleDTO_sjh> myArticles= userPageInfo.getMyArticles();
		model.addAttribute("myArticles",myArticles);
		log.info(myArticles);
		for (SNSArticleDTO_sjh art : myArticles) {
			log.info(art.getComments());
		}
		
		//이 페이지 유저가 팔로잉하는 유저
		//ArrayList<UserDTO> followingList= snsService.getFollowingList(user_id);
		ArrayList<UserDTO> followingList= userPageInfo.getMyfollowings();
		model.addAttribute("followingList",followingList);
		log.info(followingList);
		
		//이 페이지 유저가 가입한 그룹
		ArrayList<GroupDTO_lhr> groupList= userPageInfo.getMyGroups();
		model.addAttribute("groupList",groupList);
		log.info(groupList);

		//이 페이지 유저와 로그인 유저의 팔로우 상태
		if(principal.getName().equals(user_id)) {
			//자기 자신 페이지
			model.addAttribute("follow","me");
		} else {
			if(followingList.contains(user_id)) {
				//팔로우 하는 사용자 -> 언팔 가능
				model.addAttribute("follow","unfollowable");
			}else {
				//아직 팔로우 하지 않은 사용자 -> 팔로 가능
				model.addAttribute("follow","followable");
			}
		}
		
		UserDTO meDTO= snsService.getSimpleUser(principal.getName());
		model.addAttribute("me",meDTO);
		ObjectMapper objmapper= new ObjectMapper();
		try {
			String meJSON= objmapper.writeValueAsString(meDTO);
			model.addAttribute("meJSON", meJSON);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 사용자 팔로 요청
	 * @param followId 팔로우 할 사용자 아이디
	 * @param principal 내 아이디
	 * @return 
	 */
	@GetMapping(value="/sns/follow/{follow-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> followGet(@PathVariable("follow-id") String followId, Principal principal) {
		log.info(" 팔로 요청  from "+principal.getName()+" to "+followId);
		//팔로 처리
		snsService.askFollow(principal.getName(), followId);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	/**
	 * 사용자 팔로  취소 요청
	 * @param followId 팔로우 취소할 사용자 아이디
	 * @param principal 내 아이디
	 * @return 
	 */
	@GetMapping(value="/sns/unfollow/{follow-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> unfollowGet(@PathVariable("follow-id") String followId, Principal principal) {
		log.info(" 언팔로 요청  from "+principal.getName()+" to "+followId);
		snsService.askUnfollow(principal.getName(), followId);
		log.info("언팔 끝");
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	/**
	 * 게시글 좋아요 요청
	 * @param articleId 게시글 아이디
	 * @param principal
	 * @return 갱신된 이 게시글 좋아요 수 
	 */
	@GetMapping(value="/sns/like/{article-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> likeGet(@PathVariable("article-id") int articleId, Principal principal) {
		log.info(" 좋아요 요청  from "+principal.getName()+" to "+articleId);
		snsService.likeArticle(principal.getName(), articleId);
		return new ResponseEntity<>(snsService.getArticleByArticleId(articleId).getLikes().size()+"",HttpStatus.OK);
	}
	
	/**
	 * 게시글 좋아요 취소 요청
	 * @param articleId 게시글 아이디
	 * @param principal
	 * @return 갱신된 이 게시글 좋아요 수 
	 */
	@GetMapping(value="/sns/unlike/{article-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> unlikeGet(@PathVariable("article-id") int articleId, Principal principal) {
		log.info(" 안좋아요 요청  from "+principal.getName()+" to "+articleId);
		snsService.unlikeArticle(principal.getName(), articleId);
		return new ResponseEntity<>(snsService.getArticleByArticleId(articleId).getLikes().size()+"",HttpStatus.OK);
	}
	
	/**
	 * 게시글 스크랩 요청
	 * @param articleId 게시글 아이디
	 * @param principal 내 아이디
	 * @return 갱신된 이 게시글 스크랩 수 
	 */
	@GetMapping(value="/sns/scrap/{article-id}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> scrapGET(@PathVariable("article-id") int articleId, Principal principal) {
		log.info(" 스크랩 요청  from "+principal.getName()+" to "+articleId);
		snsService.scrapArticle(principal.getName(), articleId);
		return new ResponseEntity<>(snsService.getArticleByArticleId(articleId).getScraps().size()+"",HttpStatus.OK);
	}
	
	@GetMapping(value="/sns/comment/{articleId}/{content}/{lastCommentId}",
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ArrayList<CommentDTO>> commentGET(@PathVariable("articleId") int articleId, @PathVariable("content") String content, @PathVariable("lastCommentId") int lastCommentId, Principal principal) {
		log.info(" 댓글 입력 요청  from "+principal.getName()+" to "+articleId);
		snsService.writeComment(principal.getName(), articleId, content);
	//	ArrayList<CommentDTO> comments =  snsService.getCommentsByArticle(articleId);
		ArrayList<CommentDTO> comments =  snsService.getNewCommentsByArticle(articleId,lastCommentId);
		log.info(comments);
		return new ResponseEntity<>(comments,HttpStatus.OK);
	}
	
	@GetMapping(value="/sns/deletecomment/{commentId}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteCommentGET(@PathVariable("commentId") int commentId) {
		log.info(" 댓글 삭제 요청  from "+commentId);
		snsService.deleteComment(commentId);
		//snsService.writeComment(principal.getName(), articleId, content);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
}