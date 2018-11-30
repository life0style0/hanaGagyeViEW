package kr.or.kosta.salmon.mapper;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;

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
	
	//가입시 초기 개인화 정보 저장 (지역, 관심카테고리) - 카테고 리개수별 
	public void insertBasicPsns1(RegistUserDTO user);
	public void insertBasicPsns2(RegistUserDTO user);
	public void insertBasicPsns3(RegistUserDTO user);
	
	public UserLocAndCatsDTO getUserCategories(String user_id);
	public UserLocAndCatsDTO getUserLocation(String user_id);
	
	//사용자 관심 카테고리+지역정보+아이디 리턴
	public UserLocAndCatsDTO getUserSimplePsns(String user_id);
	
}
