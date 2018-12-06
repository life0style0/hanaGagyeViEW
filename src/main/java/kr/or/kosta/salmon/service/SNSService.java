package kr.or.kosta.salmon.service;
import java.util.ArrayList;
/**
 * SNS 관련 기능
 * @author 송주현
 */
import java.util.List;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.LikeDTO;
import kr.or.kosta.salmon.domain.LocationDTO_sjh;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;
import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
import kr.or.kosta.salmon.domain.ScrapDTO;
/**
 * User 관련 처리
 * @author 송주현
 */
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;

public interface SNSService {
	
	//전체 게시글 리턴
	public ArrayList<SNSArticleDTO_sjh> getSNSArticles(String user_id);
	
	//작성자로 글목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticleByWriter(String user_id);
	//글 아이디로 글 찾기
	public SNSArticleDTO_sjh getArticleByArticleId(int article_id);
	
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
//	public ArrayList<MainGroupCtFeeDTO> getChartCategoryFee(String user_id);

	//팔로우
	public void askFollow(FollowerDTO follower);
	public void askFollow(String follower_id, String followed_id);
	
	//언팔
	public void askUnfollow(FollowerDTO follower);
	public void askUnfollow(String follower_id, String followed_id);
	
	//팔로 체크
	public boolean checkFollowing(FollowerDTO follower);
	public boolean checkFollowing(String follower_id, String followed_id);
	public ArrayList<UserDTO> getFollowingList(String user_id);
	
	//SNS 페이지 로드용 dB접근  한번에 
	public SNSUserPageDTO getSNSUserPageInfo(String user_id);
	
	//좋아요
	public void likeArticle(LikeDTO like);
	public void likeArticle(String user_id, int article_id);
	public void unlikeArticle(LikeDTO like);
	public void unlikeArticle(String user_id, int article_id);
	//좋아요 한 게시글
	public ArrayList<SNSArticleDTO_sjh> getArticleByLikeUser(String user_id);
	
	//스크랩
	public void scrapArticle(ScrapDTO scrap);
	public void scrapArticle(String user_id, int article_id);
	
	//댓글
	public void writeComment(CommentDTO comment);
	public void writeComment(String user_id, int article_id, String comment_content);
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id);
	public UserDTO getSimpleUser(String user_id);
	
}
