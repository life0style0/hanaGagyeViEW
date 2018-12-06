package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.LikeDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
import kr.or.kosta.salmon.domain.ScrapDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;

public interface SNSMapper {

	//이 사용자의 팔로워/그룹/본인 게시글 목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticles(String user_id);
	
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
//	public ArrayList<MainGroupCtFeeDTO> getChartCategoryFee(String user_id);
	
	//작성자로 글목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticleByWriter(String user_id);
	//좋아요 한 게시글
	public ArrayList<SNSArticleDTO_sjh> getArticleByLikeUser(String user_id);
	
	//팔로우
	public boolean askFollow(FollowerDTO follower);
	//언팔로우
	public boolean askUnfollow(FollowerDTO follower);
	//팔로우 체크
	public int checkFollowing(FollowerDTO follower);
	
	//이 사용자의 팔로잉 목록
	public ArrayList<UserDTO> getFollowingList(String user_id);
	//이 사용자의 그룹 목록
	public ArrayList<GroupDTO_lhr> getJoingingGroupList(String user_id);
	
	public UserLocAndCatsDTO getUserSimplePsns(String user_id);
	public SNSUserPageDTO getSNSUserPageInfo(String user_id);
	
	//좋아요
	public void likeArticle(LikeDTO like);
	public void unlikeArticle(LikeDTO like);
	
	public SNSArticleDTO_sjh getArticleByArticleId(int article_id);
	
	
	//스크랩
	public void scrapArticle(ScrapDTO scrap);
	
	//댓글
	public void writeComment(CommentDTO comment);
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id);
	
	public UserDTO getSimpleUser(String user_id);
	
}
