package kr.or.kosta.salmon.domain;

import lombok.Data;
/**
 * GroupDTO 설정
 * @author 이혜림
 */

@Data
public class GroupDTO_lhr {
	private String group_id; //소모임 고유번호
	private String group_title;  //소모임 제목 
	private String group_regdate; //소모임 개설일
	private String group_description; //소모임 간단 소개글 
	private int group_people_max; //소모임 최대 인원
	private String user_id; //사용자 id
	private int ctgry_1; //관심 카테고리 1
	private int ctgry_2; //관심 카테고리 2
	private int ctgry_3; //관심 카테고리 2 
	
	private int group_people_now;
	
	
	private String ctgry_1_name;
	private String ctgry_2_name;
	private String ctgry_3_name;
	
	
}