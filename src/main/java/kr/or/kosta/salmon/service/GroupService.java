package kr.or.kosta.salmon.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.CommentDTO;
import kr.or.kosta.salmon.domain.GroupCountDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.RegistGroupDTO_lhr;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
/**
 * Group 관련 처리
 * @author 이혜림
 */


public interface GroupService {
	
	//그룹 정보 가져오기
	public GroupDTO_lhr get(String group_id);
	
	//소모임 등록
	public void groupRegist(GroupDTO_lhr group);
	
	//소모임 수정
	public void groupUpdate(GroupDTO_lhr group);
	
	//회원 정보 가져오기
	public List<UserDTO> getUserInfo(String user_id);
	
	//카테고리 가져오기
	public List<CategoryDTO_sjh> getAllCategories();
	
	//전체 그룹 리스트 가져오기
	public List<GroupDTO_lhr> getList();
	
	// 소모임 현재 인원, 가입 가능 인원 확인하기 
	public GroupCountDTO getCount(String group_id);
	
	//소모임 들어가기 
	public int joinGroup(String group_id, String user_id);
	
	//소모임 댓글 관련 
	//댓글
	public void writeComment(CommentDTO comment);
	public void writeComment(String user_id, int article_id, String comment_content);
	public ArrayList<CommentDTO> getCommentsByArticle(int article_id);
	public ArrayList<CommentDTO> getNewCommentsByArticle(int articleId,int lastCommentId);
	public UserDTO getSimpleUser(String user_id);
	public void deleteComment(int comment_id);
	
	//해당 소모임 그룹의 게시물 가져오기
	public ArrayList<SNSArticleDTO_sjh> getSNSGroups(String group_id);

	//그룹에 가입한 사용자인지 확인하기 
	public int checkRegistGroup(String group_id, String user_id);

	//그룹 최신순
	public List<GroupDTO_lhr> getGroupListsbyNewGroup();
	
	//그룹 인기순 
	public List<GroupDTO_lhr> getGroupListsbyPopular();
	
	//그룹 나의 맞춤 카테고리순 (개인화)
	
	//그룹 카테고리별
	public List<GroupDTO_lhr> getGroupListsbyCategory(int category_id);

	
	

}
