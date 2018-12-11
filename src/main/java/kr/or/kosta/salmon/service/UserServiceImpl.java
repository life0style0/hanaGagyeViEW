package kr.or.kosta.salmon.service;
import java.util.List;

/**
 * 회원가입, 회원정보 수정 
 * @author 송주현
 */
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.LocationDTO_sjh;
import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;
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
		
		if(user.getUser_image() == null || user.getUser_image().trim().length() ==0) {
			//user.setUser_image("default img");
			user.setUser_image("images/default-user.jpg");
		}
		
		UserDTO simpleUser= user.makeUserDTO();
		log.info(simpleUser);
		usermapper.createUser(simpleUser); //user 생성
		log.info("createUser 끝");
		usermapper.insertUserAuth(simpleUser); //spring security 권한 부여
		usermapper.insertMemberAuth(simpleUser); //spring security 권한 부여
		log.info("insertUserAuth 끝");
		
		usermapper.insertBasicPsns3(user);
		
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

	//마이페이지 정보조회용
	@Override
	public UserLocAndCatsDTO getUserSimplePsns(String user_id) {
		log.info(" 지역 정보와 관심사 정보 조회");
		return usermapper.getUserSimplePsns(user_id);
	}

	//닉네임 변경
	@Override
	public void changeNickname(UserDTO user) {
		usermapper.changeNickname(user);
	}

	@Override
	public UserDTO searchUserById(String user_id) {
		return usermapper.searchUserById(user_id);
	}

	@Override
	public String getUserEmail(String user_id) {
		return usermapper.getUserEmail(user_id);
	}

	@Override
	public void changeUserInfo(RegistUserDTO user) {
		usermapper.changeUserInfo(user);
	}

	@Override
	public void changeUserLocation(RegistUserDTO user) {
		usermapper.changeUserLocation(user);
	}

	@Override
	public List<CategoryDTO_sjh> getAllCategories() {
		return usermapper.getAllCategories();
	}

	@Override
	public void changeUserCategories(UserLocAndCatsDTO userCats) {
		log.info("관심카테고리 수정 "+userCats);
		
		if(userCats.getCtgry_1() == -1) {
			userCats.setCtgry_1(0);
		}
		if(userCats.getCtgry_2()==-1) {
			userCats.setCtgry_2(0);
		}
		
		usermapper.changeUserCategories(userCats);
	}

	@Override
	public String getUserPw(String user_id) {
		return usermapper.getUserPw(user_id);
	}
	
	//회원 탈퇴
	@Transactional
	@Override
	public void setUserResign(String user_id) {
		usermapper.setUserResign(user_id); //user_state 변경
		usermapper.deleteUserAuth(user_id); //auth 제거
	}

	// 권한 삭제
	@Override
	public void deleteUserAuth(String user_id) {
		usermapper.deleteUserAuth(user_id);
	}

	//비밀번호 확인 후 탈퇴
	@Transactional
	@Override
	public boolean checkPWandResigh(String user_id, String user_password) {
		if(user_password.equals(usermapper.getUserPw(user_id))) {
			log.info("비밀번호 일치 ! 탈퇴 시작");
			usermapper.setUserResign(user_id);
			return true;
		}else {
			log.info("비밀번호 불일치! 탈퇴 불가");
			return false;
		}
	}

	@Override
	public List<LocationDTO_sjh> getAllLocations() {
		return usermapper.getAllLocations();
	}

	@Override
	public List<UserDTO> searchUserInSNS(String value) {
		log.info("사용자검색");
		return usermapper.searchUserInSNS(value);
	}

	@Override
	public UserDTO read(String user_id) {
		return usermapper.read(user_id);
	}

	@Override
	public void deleteBlockedUserAuth(String user_id) {
		usermapper.deleteBlockedUserAuth(user_id);
	}

}
