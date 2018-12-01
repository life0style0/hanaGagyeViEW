package kr.or.kosta;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;
import kr.or.kosta.salmon.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class UserServiceTests {

	@Inject
	UserService service;
	
	@Inject
	private PasswordEncoder pwEncoder;
	
	//회원가입 테스트
//	@Test
	public void testCreateUser() {
		
		UserDTO user= new UserDTO();
		RegistUserDTO ruser= new RegistUserDTO();
		
		user.setUser_id("newid2");
		user.setUser_nickname("new2Nickname");
		user.setUser_email("new2@mail.com");
		user.setUser_birthday("941225");
		user.setUser_gender("F");
		user.setUser_passwd(pwEncoder.encode("1234"));
		user.setUser_image("https://notefolio.net/data/covers/39320_t2.jpg");
		/*
		usermapper.createUser(user);
		usermapper.insertUserAuth(user);
		*/
		
		log.info(service);
		log.info(pwEncoder);
		service.userRegist(ruser);
		log.info("회원가입 완료");
	}
	
	//마이페이지에서 지역, 카테고리 정보 조회 테스트 
//	@Test
	public void testSimplePsns() {
		log.info("결과 : "+service.getUserSimplePsns("heyrim19"));
		UserLocAndCatsDTO user= service.getUserSimplePsns("heyrim19");
		user.setCtgrNames();
		log.info(user.getCtgry1Name());
		log.info(user.getCtgry2Name());
		log.info(user.getCtgry3Name());
		log.info(user.getLocationname());
	//	UserLocAndCatsDTO user= service.getUserSimplePsns("heyrim19");
	//	System.out.println(user);
	}
	
	@Test
	public void testGetEmails() {
		log.info("결과 : "+service.getUserEmail("newID6"));
		log.info("결과 : "+service.getUserEmail("heyrim19"));
		
	}
}
