package kr.or.kosta.salmon.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.GroupDTO_lhr;

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
	
}