package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.MainArticleDTO;
import kr.or.kosta.salmon.domain.MainChartDTO;
import kr.or.kosta.salmon.domain.MainGroupCtFeeDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.mapper.MainMapper;
import kr.or.kosta.salmon.mapper.SNSMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SNSServiceImpl implements SNSService{
	@Inject
	SNSMapper snsMapper;

	//이 사용자의 피드 게시글 조회
	@Override
	public ArrayList<SNSArticleDTO_sjh> getSNSArticles(String user_id) {
		return snsMapper.getSNSArticles(user_id);
	}

	//작성자로 글목록 찾기
	@Override
	public ArrayList<SNSArticleDTO_sjh> getSNSArticleByWriter(String user_id) {
		return snsMapper.getSNSArticleByWriter(user_id);
	}
	
	@Override
	public ArrayList<HashTagGroupDTO> getHashTagGroup(String user_id) {
		return snsMapper.getHashTagGroup(user_id);
	}

	@Override
	public void askFollow(FollowerDTO follower) {
		snsMapper.askFollow(follower);
	}
	
	@Override
	public void askFollow(String follower_id, String followed_id) {
		FollowerDTO follower= new FollowerDTO();
		follower.setUser_id(followed_id);
		follower.setFollower_user_id(follower_id);
		askFollow(follower);
	}

	@Override
	public void askUnfollow(FollowerDTO follower) {
		snsMapper.askUnfollow(follower);
	}

	@Override
	public void askUnfollow(String follower_id, String followed_id) {
		FollowerDTO follower= new FollowerDTO();
		follower.setUser_id(followed_id);
		follower.setFollower_user_id(follower_id);
		log.info(follower);
		askUnfollow(follower);
	}

	@Override
	public boolean checkFollowing(FollowerDTO follower) {
		log.info("check follow from "+follower.getFollower_user_id()+" to "+follower.getUser_id());
		if(snsMapper.checkFollowing(follower) >0 ) {
			log.info("following...");
			return true;
		}else {
			log.info("followable...");
			return false;
		}
	}

	@Override
	public boolean checkFollowing(String follower_id, String followed_id) {
		FollowerDTO follower = new FollowerDTO();
		follower.setFollower_user_id(follower_id);
		follower.setUser_id(followed_id);
		return checkFollowing(follower);
	}
}
