package kr.or.kosta.salmon.domain;


import lombok.Data;
/**
 * GroupUsers 소모임 회원
 */

@Data
public class GroupUsersDTO_lhr {

	private String gour_users_id; //회원 고유번호
	private String group_id; //소모임 고유번호 
	private String user_id;  //사용자 아이디
}
