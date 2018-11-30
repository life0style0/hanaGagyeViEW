package kr.or.kosta;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
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
	@Test
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
	//	service.userRegist(ruser);
		log.info("회원가입 완료");
	}
}
