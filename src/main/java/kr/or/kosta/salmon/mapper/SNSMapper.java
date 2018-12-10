package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.LikeDTO;
import kr.or.kosta.salmon.domain.MainFeedArticlesDTO;
import kr.or.kosta.salmon.domain.ReportDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
import kr.or.kosta.salmon.domain.SNSUserPageWithoutAtriclesDTO;
import kr.or.kosta.salmon.domain.ScrapDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;

public interface SNSMapper {

	//이 사용자의 팔로워/그룹/본인 게시글 목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticles(String user_id);
	//이 사용자 기준 해시태그 목록
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
	//전체 글 해시태그 목록
	public ArrayList<HashTagGroupDTO> getAllHashTagGroup();
//	public ArrayList<MainGroupCtFeeDTO> getChartCategoryFee(String user_id);
	
	// 게시글 전체 검색
	public ArrayList<SNSArticleDTO_sjh> searchArticles(@Param("value") String value);
	//검색 게시글에 해당하는 해시태그 목록
	public ArrayList<HashTagGroupDTO> getSearchHashTagGroup(@Param("value") String value);
	//제안글 검색
	public ArrayList<SNSArticleDTO_sjh> searchSuggestions(@Param("value") String value);
	//그룹검색
	public ArrayList<GroupDTO_lhr> searchGroups(@Param("value") String value);
		
	//전체 게시글중 인기글
	public ArrayList<SNSArticleDTO_sjh> getSNSPopularArticles();
	//전체 게시글중 최신글
	public ArrayList<SNSArticleDTO_sjh> getSNSNewArticles();
	//전체 게시글중 오늘의 인기글과 최신글
	public MainFeedArticlesDTO getNewAndPopArticles();
	//내 메인 피드 게시글
	public MainFeedArticlesDTO getMyFeedArticles();
	
	//작성자로 글목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticleByWriter(@Param("login_id") String login_id, @Param("user_id") String user_id);
	//좋아요 한 게시글
	public ArrayList<SNSArticleDTO_sjh> getArticleByLikeUser(@Param("login_id") String login_id, @Param("user_id") String user_id);
	//SNS 페이지 로드용 dB접근  한번에 
	public SNSUserPageDTO getSNSUserPageInfo(@Param("user_id") String user_id);
	//게시글 제외하고 로드  (isLikedByMe, isReportedByMe 활용을 위해 분리)
	public SNSUserPageWithoutAtriclesDTO getSNSUserPageInfoWithoutArticles(@Param("user_id") String user_id);
	
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
	
	
	//좋아요
	public int likeArticle(LikeDTO like);
	public int unlikeArticle(LikeDTO like);
	public SNSArticleDTO_sjh getArticleByArticleId(int article_id);
	
	
	//스크랩
	public void scrapArticle(ScrapDTO scrap);
	
	//댓글
	public void writeComment(CommentDTO comment);
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id);
	public ArrayList<CommentDTO> getNewCommentsByArticle(@Param("article_id") int article_id, @Param("comment_id") int comment_id);
	public void deleteComment(int comment_id);
	
	public UserDTO getSimpleUser(String user_id);
	
	//게시글 신고
	public boolean reportArticle(ReportDTO report);
	
	
}
