package kr.or.kosta.salmon.mapper;

import kr.or.kosta.salmon.domain.UserDTO;

public interface UserMapper {

	public UserDTO read(String user_id);
	
	//회원가입
	public void createUser(UserDTO user);
	
	//spring security용 user 권한부여
	public void insertUserAuth(UserDTO user);
	
	//spring security용 member 권한부여
	public void insertMemberAuth(UserDTO user);
	
	//spring security용 admin 권한부여
	public void insertAdminAuth(UserDTO user);
	
	//아이디로 User찾기
	public UserDTO searchUserById(String user_id);
	//이메일로 User찾기
	public UserDTO searchUserByEmail(String user_email);
	//닉네임으로 User찾기
	public UserDTO searchUserByNickname(String user_nickname);
	
}