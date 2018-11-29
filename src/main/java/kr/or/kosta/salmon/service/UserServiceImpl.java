package kr.or.kosta.salmon.service;
/**
 * 회원가입, 회원정보 수정 
 * @author 송주현
 */
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void userRegist(UserDTO user) {
		log.info("회원가입 시작");
		usermapper.createUser(user); //user 생성
		usermapper.insertUserAuth(user); //spring security 권한 부여
		log.info("회원가입 끝");
	}

	@Override
	public void userUpdate(UserDTO user) {

	}

}
