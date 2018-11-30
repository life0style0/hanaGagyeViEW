package kr.or.kosta.salmon.service;
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
}
