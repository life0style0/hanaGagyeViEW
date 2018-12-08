package kr.or.kosta.salmon.service;
import java.util.ArrayList;
import java.util.List;

/**
 * 소모임 
 */

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.GroupCountDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.GroupMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class GroupServiceImpl implements GroupService {

	private GroupMapper groupMapper;

	@Override
	public GroupDTO_lhr get(String group_id) {
		log.info("get............ : " + group_id);
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

	@Override
	public List<GroupDTO_lhr> getList() {
		return groupMapper.getList();
	}
	
	@Override
	public GroupCountDTO getCount(String group_id) {
		return groupMapper.getCount(group_id);
	}
	
	@Override
	public int joinGroup(String group_id, String user_id) {
		return groupMapper.joinGroup(group_id, user_id);
	}

	@Override
	public void writeComment(CommentDTO comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void writeComment(String user_id, int article_id, String comment_content) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		
	}

}