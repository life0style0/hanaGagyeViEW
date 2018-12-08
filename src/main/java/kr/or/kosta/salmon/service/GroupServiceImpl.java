package kr.or.kosta.salmon.service;
import java.util.List;

/**
 * 소모임 
 */

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
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

}