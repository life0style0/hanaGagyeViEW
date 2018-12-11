package kr.or.kosta.salmon.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.GroupCountDTO;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;

public interface GroupMapper {
	
	//소모임 ID로 그룹 정보 읽기
	public GroupDTO_lhr read(String group_id);
	
	//소모임 생성
	public void createGroup(GroupDTO_lhr groupDTO_lhr);
	
	//소모임 selectKey
	public boolean createSelectGroup(GroupDTO_lhr groupDTO_lhr);
	
	//카테고리 가져오기
	public List<CategoryDTO_sjh> getAllCategories();
	
	//전체 소모임 리스트
	//@Select("select * from groups where group_id > 0")
	public List<GroupDTO_lhr> getList();
	
	//소모임 입장 제한 확인하기
	public GroupCountDTO getCount(@Param("group_id") String group_id);
	
	//소모임에 들어가기 :) 
	public int joinGroup(@Param("group_id") String group_id, @Param("user_id") String user_id);
	
	//소모임 해당 그룹에 sns 아티클 띄우기
	public ArrayList<SNSArticleDTO_sjh> getSNSGroups(@Param("group_id") String group_id);
	
	//소모임에 가입한 인원인지 확인하기 
	public int checkRegistGroup(@Param("group_id") String group_id, @Param("user_id") String user_id);

	//전체 소모임 리스트 (최신순)
	public List<GroupDTO_lhr> getGroupListsbyNewGroup();
	
	//전체 소모임 리스트 (인기순 : 소모임 가입 회원이 많은 순
	public List<GroupDTO_lhr> getGroupListsbyPopular();
	
	//전체 소모임 리스트 (개인화, 맞춤설정)
	
	//전체 소모임 리스트 (카테고리 별)
	public List<GroupDTO_lhr> getGroupListsbyCategory(@Param("category_id") int category_id);
	

}
