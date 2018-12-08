package kr.or.kosta.salmon.service;

import java.util.List;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.RegistGroupDTO_lhr;
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
}
