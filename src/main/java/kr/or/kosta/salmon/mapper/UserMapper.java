package kr.or.kosta.salmon.mapper;

import kr.or.kosta.salmon.domain.UserDTO;

public interface UserMapper {

	public UserDTO read(String user_id);
	
	//회원가입
	public void createUser(UserDTO user);
	
	//spring security용 user 권한
	public void insertUserAuth(UserDTO user);
	
	//spring security용 member 권한
	public void insertMemberAuth(UserDTO user);
	
	//spring security용 admin 권한
	public void insertAdminAuth(UserDTO user);
	
}
