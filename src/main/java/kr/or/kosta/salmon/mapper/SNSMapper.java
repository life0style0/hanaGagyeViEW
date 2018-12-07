package kr.or.kosta.salmon.mapper;

import java.util.ArrayList;

import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;

public interface SNSMapper {

	//이 사용자의 팔로워/그룹/본인 게시글 목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticles(String user_id);
	
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id);
//	public ArrayList<MainGroupCtFeeDTO> getChartCategoryFee(String user_id);
	
	//작성자로 글목록 찾기
	public ArrayList<SNSArticleDTO_sjh> getSNSArticleByWriter(String user_id);

	//팔로우
	public boolean askFollow(FollowerDTO follower);
	
	//언팔로우
	public boolean askUnfollow(FollowerDTO follower);
	
	//팔로우 체크
	public int checkFollowing(FollowerDTO follower);
}
