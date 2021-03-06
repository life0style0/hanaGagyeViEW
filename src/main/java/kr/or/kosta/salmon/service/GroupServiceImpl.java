package kr.or.kosta.salmon.service;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;

/**
 * 소모임 
 */

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.GroupCountDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.GroupMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class GroupServiceImpl implements GroupService {

	@Inject
	private GroupMapper groupMapper;

	@Override
	public GroupDTO_lhr get(String group_id) {
		log.info("get............ : " + group_id);
		log.info(groupMapper.read(group_id));
		return groupMapper.read(group_id);
	}
	
	//SelectKey 활용 GroupService 등록 
	@Override
	public void groupRegist(GroupDTO_lhr group) {
		log.info("처음 등록 시작 SelectKey 활용 ");
		groupMapper.createSelectGroup(group);
		log.info("createGroup SelectKey 등록 완료 ");
	}

	@Override
	public void groupUpdate(GroupDTO_lhr group) {
		
	}

	@Override
	public List<UserDTO> getUserInfo(String user_id) {
		return null;
	}

	/* 전체 카테고리 가져오기 */
	@Override
	public List<CategoryDTO_sjh> getAllCategories() {
		return groupMapper.getAllCategories();
	}

	//리스트 가져오기
	@Override
	public List<GroupDTO_lhr> getList() {
		log.info("ServiceImpl****************전체 리스트 가져오기 리스트 실행****************");
		return groupMapper.getList();
	}
	
	//소모임 현재인원, 가입 가능 인원 확인 
	@Override
	public GroupCountDTO getCount(String group_id) {
		log.info(group_id);
		return groupMapper.getCount(group_id);
	}
	
	//소모임 회원으로 들어가기 
	@Override
	public int joinGroup(String group_id, String user_id) {
		log.info(group_id);
		log.info(user_id);
		return groupMapper.joinGroup(group_id, user_id);
	}
	
	
	@Override
	public void writeComment(CommentDTO comment) {
		
	}

	@Override
	public void writeComment(String user_id, int article_id, String comment_content) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id) {
		return null;
	}

	@Override
	public ArrayList<CommentDTO> getNewCommentsByArticle(int articleId, int lastCommentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDTO getSimpleUser(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteComment(int comment_id) {
		
	}

	@Override
	public ArrayList<SNSArticleDTO_sjh> getGroupArticles(String group_id) {
		return groupMapper.getGroupArticles(group_id);
	}

	//그룹에 해당 아이디가 가입했을 경우 : 0 / 가입인원이 있으면 0보다 크다. 
	@Override
	public int checkRegistGroup(String group_id, String user_id) {
		return groupMapper.checkRegistGroup(group_id, user_id);
	}
	
	//그룹 리스트 최신순 
	@Override
	public List<GroupDTO_lhr> getGroupListsbyNewGroup() {
		log.info("ServiceImpl*************** 최신순 가져오기 리스트 실행****************");
		return groupMapper.getGroupListsbyNewGroup();
	}

	//그룹 리스트 인기 순 
	@Override
	public List<GroupDTO_lhr> getGroupListsbyPopular() {
		log.info("ServiceImpl****************인기 가져오기 리스트 실행****************");
		return groupMapper.getGroupListsbyPopular();
	}
	
	//그룹 카테고리별
	@Override
	public List<GroupDTO_lhr> getGroupListsbyCategory(int category_id){
		log.info("getGroupListsbyCategory****************카테고리별 가져오기 리스트 실행****************");
		return groupMapper.getGroupListsbyCategory(category_id);
	}


}