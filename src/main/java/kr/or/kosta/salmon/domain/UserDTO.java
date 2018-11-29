package kr.or.kosta.salmon.domain;

import java.util.List;

import lombok.Data;

@Data
public class UserDTO {

	private String user_id;
	private String user_nickname;
	private String user_email;
	private String user_passwd; //암호화 된 비밀번호
	private String user_gender;
	private String user_birthday;
	private String user_image; //프로필 사진
	private String user_regdate;
	private boolean enabled; //sequrity에 필요
	
	private List<Auth> authList; //이 User가 가진 권한 목록
	
}
