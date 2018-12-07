package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * GroupDTO 설정
 */

@Data
public class RegistGroupDTO_lhr {

	private String group_id;
	private String group_title;
	private String group_regdate;
	private String group_description;
	private int group_people_max;	
	private int ctgry_1; //관심 카테고리 1 
	private int ctgry_2; //관심 카테고리 2
	private int ctgry_3; //관심 카테고리 3
	
	public GroupDTO_lhr makeGroupDTO() {
		GroupDTO_lhr group = new GroupDTO_lhr();
		
		group.setGroup_id(this.group_id);
		group.setGroup_title(group_title);
		group.setGroup_regdate(group_regdate);
		group.setGroup_description(group_description);
		group.setGroup_people_max(group_people_max);
		return group;
	}

}