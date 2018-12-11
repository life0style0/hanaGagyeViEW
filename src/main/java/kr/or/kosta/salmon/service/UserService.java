package kr.or.kosta.salmon.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.LocationDTO_sjh;
import kr.or.kosta.salmon.domain.RegistUserDTO;
/**
 * User 관련 처리
 * @author 송주현
 */
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;

public interface UserService {

	public void userRegist(RegistUserDTO user);
	public void userUpdate(UserDTO user);
	
	//아이디로 User찾기
	public UserDTO searchUserById(String user_id);
	
	//sns 페이지에서 사용자 검색
	public List<UserDTO> searchUserInSNS(String value);
	
	//가입할때 아이디 중복 검사
	public boolean isExistId(String user_id);
	//가입할때 이메일  중복 검사
	public boolean isExistEmail(String user_email);
	//가입할때 닉네임  중복 검사
	public boolean isExistNickname(String user_nickname);
	
	//사용자 관심 카테고리+지역정보+아이디 리턴 (마이페이지 조회용)
	public UserLocAndCatsDTO getUserSimplePsns(String user_id);

	//사용자 닉네임 변경
	public void changeNickname(UserDTO user);
	//지역정보 변경
	public void changeUserLocation(RegistUserDTO user);
	//개인정보 수정
	public void changeUserInfo(RegistUserDTO user);
	
	//이메일 조회
	public String getUserEmail(String user_id);
	
	//카테고리 가져오기
	public List<CategoryDTO_sjh> getAllCategories();
	
	//관심카테고리 변경
	public void changeUserCategories(UserLocAndCatsDTO userCats);

	// 회원탈퇴
	public void setUserResign(String user_id);

	// 비밀번호 가져오기
	public String getUserPw(String user_id);
	
	//비밀번호 확인 후 탈퇴
	public boolean checkPWandResigh(String user_id, String user_password);
	
	//권한 삭제
	public void deleteUserAuth(String user_id);
	public void deleteBlockedUserAuth(String user_id);
	
	//지역정보 전체 가져오기
	public List<LocationDTO_sjh> getAllLocations();

	//유저 정보 전체
	public UserDTO read(String user_id);
	
}
