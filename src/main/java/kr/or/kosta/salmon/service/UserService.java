package kr.or.kosta.salmon.service;
/**
 * User 관련 처리
 * @author 송주현
 */
import kr.or.kosta.salmon.domain.UserDTO;

public interface UserService {

	public void userRegist(UserDTO user);
	
	public void userUpdate(UserDTO user);
	
	//가입할때 아이디 중복 검사
	public boolean isExistId(String user_id);
	//가입할때 이메일  중복 검사
	public boolean isExistEmail(String user_email);
	//가입할때 닉네임  중복 검사
	public boolean isExistNickname(String user_nickname);
}
