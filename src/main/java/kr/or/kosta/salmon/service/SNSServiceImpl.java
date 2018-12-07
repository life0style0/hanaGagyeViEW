package kr.or.kosta.salmon.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.HashTagGroupDTO;
import kr.or.kosta.salmon.domain.LikeDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
import kr.or.kosta.salmon.domain.ScrapDTO;
import kr.or.kosta.salmon.domain.UserDTO;
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
			if(follower.getUser_id().equals(follower.getFollower_user_id())) {
				log.info(" it's me ");
				return true;
			}
			log.info(" not following...");
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

	@Override
	public ArrayList<UserDTO> getFollowingList(String user_id) {
		return snsMapper.getFollowingList(user_id);
	}

	@Override
	public SNSUserPageDTO getSNSUserPageInfo(String user_id) {
		return snsMapper.getSNSUserPageInfo(user_id);
	}

	@Override
	public void likeArticle(LikeDTO like) {
		snsMapper.likeArticle(like);
		log.info("좋아요 완료");
	}

	@Override
	public void likeArticle(String user_id, int article_id) {
		LikeDTO like= new LikeDTO();
		like.setUser_id(user_id);
		like.setArticle_id(article_id);
		likeArticle(like);
	}

	@Override
	public void unlikeArticle(LikeDTO like) {
		snsMapper.unlikeArticle(like);
		log.info("안좋아요 완료");
	}

	@Override
	public void unlikeArticle(String user_id, int article_id) {
		LikeDTO like= new LikeDTO();
		like.setUser_id(user_id);
		like.setArticle_id(article_id);
		unlikeArticle(like);
	}

	@Override
	public SNSArticleDTO_sjh getArticleByArticleId(int article_id) {
		return snsMapper.getArticleByArticleId(article_id);
	}

	@Override
	public void scrapArticle(ScrapDTO scrap) {
		snsMapper.scrapArticle(scrap);
	}

	@Override
	public void scrapArticle(String user_id, int article_id) {
		ScrapDTO scrap= new ScrapDTO();
		scrap.setUser_id(user_id);
		scrap.setArticle_id(article_id);
		scrapArticle(scrap);
		
	}

	//좋아요 한 게시글 목록
	@Override
	public ArrayList<SNSArticleDTO_sjh> getArticleByLikeUser(String user_id) {
		return snsMapper.getArticleByLikeUser(user_id);
	}

	//댓글쓰기
	@Override
	public void writeComment(CommentDTO comment) {
		snsMapper.writeComment(comment);
	}

	@Override
	public void writeComment(String user_id, int article_id, String comment_content) {
		CommentDTO comment= new CommentDTO();
		comment.setArticle_id(article_id);
		comment.setUser_id(user_id);
		comment.setComment_content(comment_content);
		writeComment(comment);
	}

	@Override
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id) {
		return snsMapper.getCommentsByArticle(article_id);
	}

	@Override
	public UserDTO getSimpleUser(String user_id) {
		return snsMapper.getSimpleUser(user_id);
	}

	@Override
	public ArrayList<CommentDTO> getNewCommentsByArticle(int articleId, int lastCommentId) {
		return snsMapper.getNewCommentsByArticle(articleId,lastCommentId);
	}

	@Override
	public void deleteComment(int comment_id) {
		log.info("댓글 삭제");
		snsMapper.deleteComment(comment_id);
	}
}
