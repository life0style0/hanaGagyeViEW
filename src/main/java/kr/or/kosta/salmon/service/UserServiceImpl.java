package kr.or.kosta.salmon.service;
/**
 * 회원가입, 회원정보 수정 
 * @author 송주현
 */
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.UserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper usermapper;
	
	@Transactional
	@Override
	public void userRegist(RegistUserDTO user) {
		log.info("회원가입 시작");
		UserDTO simpleUser= user.makeUserDTO();
		usermapper.createUser(simpleUser); //user 생성
		log.info("createUser 끝");
		usermapper.insertUserAuth(simpleUser); //spring security 권한 부여
		log.info("insertUserAuth 끝");
		usermapper.insertBasicPsns(user); //기본정보 저장
		log.info("insertBasicPsns 끝");
		log.info("회원가입 끝");
	}

	//회원 정보 수정
	@Override
	public void userUpdate(UserDTO user) {

	}

	//아이디 중복검사
	@Override
	public boolean isExistId(String user_id) {
		log.info("아이디 중복검사 시작");
		if(usermapper.searchUserById(user_id) != null) {
			return true; //존재하는 아이디
		} else {
			return false; //없는 아이디
		}
	}

	//이메일 중복검사
	@Override
	public boolean isExistEmail(String user_email) {
		log.info("이메일 중복검사 시작");
		if(usermapper.searchUserByEmail(user_email) != null) {
			return true; //존재하는 이메일
		} else {
			return false; //없는 이메일
		}
	}

	//닉네임 중복검사
	@Override
	public boolean isExistNickname(String user_nickname) {
		log.info("닉네임 중복검사 시작");
		if(usermapper.searchUserByNickname(user_nickname) != null) {
			return true; //존재하는 닉네임
		} else {
			return false; //없는 닉네임
		}
	}

	
}
