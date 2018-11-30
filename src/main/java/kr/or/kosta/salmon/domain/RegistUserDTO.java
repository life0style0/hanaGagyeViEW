package kr.or.kosta.salmon.domain;

import java.util.List;

import lombok.Data;

@Data
public class RegistUserDTO {

	private String user_id;
	private String user_nickname;
	private String user_email;
	private String user_passwd; //암호화 된 비밀번호
	private String user_gender;
	private String user_birthday;
	private String user_image; //프로필 사진
	private String user_regdate;
	private int CTGRY_1; //관심카테고리1
	private int CTGRY_2; //관심카테고리1
	private int CTGRY_3; //관심카테고리1
	
	//private boolean enabled; //sequrity에 필요
	
	private List<Auth> authList; //이 User가 가진 권한 목록
	
	public UserDTO makeUserDTO() {
		UserDTO user= new UserDTO();
		user.setUser_id(this.user_id);
		user.setUser_nickname(user_nickname);
		user.setUser_email(user_email);
		user.setUser_passwd(user_passwd);
		user.setUser_gender(user_gender);
		user.setUser_birthday(user_birthday);
		user.setUser_image(user_image);
		return user;
	}
	
}
