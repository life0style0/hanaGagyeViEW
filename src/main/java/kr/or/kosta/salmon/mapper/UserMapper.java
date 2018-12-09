package kr.or.kosta.salmon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.LocationDTO_sjh;
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
	
	//닉네임 수정
	public void changeNickname(UserDTO user);
	
	//지역정보 수정
	public void changeUserLocation(RegistUserDTO user);
	
	//개인정보 수정
	public void changeUserInfo(RegistUserDTO user);
	
	//아이디로 이메일 찾기 
	public String getUserEmail(String user_id);
	
	//카테고리 가져오기
	public List<CategoryDTO_sjh> getAllCategories();
	
	//관심카테고리 변경
	public void changeUserCategories(UserLocAndCatsDTO userCats);
	
	//관심 카테고리 수정  (마이페이지)
	public void insertBasicPsns1(UserLocAndCatsDTO user);
	public void insertBasicPsns2(UserLocAndCatsDTO user);
	public void insertBasicPsns3(UserLocAndCatsDTO user);
	
	//회원탈퇴
	public void setUserResign(String user_id);
	
	//비밀번호 가져오기
	public String getUserPw(String user_id);
	
	//권한 삭제
	public void deleteUserAuth(String user_id);
	
	//지역정보 전체 가져오기
	public List<LocationDTO_sjh> getAllLocations();
	
	//sns 페이지에서 사용자 검색
	public List<UserDTO> searchUserInSNS(@Param("value") String value);
	
}
