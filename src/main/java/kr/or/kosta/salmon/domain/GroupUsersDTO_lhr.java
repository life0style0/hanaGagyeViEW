package kr.or.kosta.salmon.domain;


import lombok.Data;
/**
 * GroupUsers 소모임 회원
 * 
 * 소모임 들어가기 위한 SQL: 
 * insert into group_users(GROUP_USERS_ID, group_id, user_id)
 * values(GROUP_USERS_ID_SEQ.nextval, 11, '123')
 */

@Data
public class GroupUsersDTO_lhr {

	private String group_users_id; //회원 고유번호
	private String group_id; //소모임 고유번호 
	private String user_id;  //사용자 아이디
}
