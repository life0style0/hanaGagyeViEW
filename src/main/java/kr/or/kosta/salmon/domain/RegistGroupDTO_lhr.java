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
	
	//카테고리 이름으로 불러오기 : 소모임 관련 
	private String categories;
	
	private String ctgry1Name;
	private String ctgry2Name;
	private String ctgry3Name;
	
	private String[] ctgryNames;
	
	public GroupDTO_lhr makeGroupDTO() {
		GroupDTO_lhr group = new GroupDTO_lhr();
		
		group.setGroup_id(this.group_id);
		group.setGroup_title(group_title);
		group.setGroup_regdate(group_regdate);
		group.setGroup_description(group_description);
		group.setGroup_people_max(group_people_max);
		return group;
	}
	
	//카테고리 이름을 가져오는 메서드
	public void setCtgrNames() {
		if(this.categories != null || this.categories.length() != 0) {
			//카테고리가 있을때, 구분은 , 쉼표로 한다.
			String[] strs=categories.split(",");
			this.ctgry1Name= strs[0];
			this.ctgry2Name= strs[1];
			this.ctgry3Name= strs[2];
		}	
	}
	
	//카테고리 이름의 배열 
	// 구분자는 쉼표
	public void setCtgryNamesArr() {
		if(this.categories != null || this.categories.length() != 0) {
			ctgryNames=categories.split(",");
		}
	}
	

}