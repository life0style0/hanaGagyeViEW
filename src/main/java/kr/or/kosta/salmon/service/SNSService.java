package kr.or.kosta.salmon.service;
import java.util.ArrayList;
/**
 * SNS 관련 기능
 * @author 송주현
 */
import java.util.List;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.LocationDTO_sjh;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;
import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
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
	//이 게시글의 좋아요 수
	//public int getLikesNumByAricle(int article_id);
	//이 게시글의 댓글 수
	//public int getCommentsNumByAricle(int article_id);
	//이 게시글의 스크랩 수
	//public int getScrapsNumByAricle(int article_id);
	
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
}
