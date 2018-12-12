package kr.or.kosta;
/**
 * users 테이블 더미데이터 만들기 (비밀번호 인코딩 처리됨) 
 * testInsertMember() 사용
 * @author 송주현
 */

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.SNSMapper;
import kr.or.kosta.salmon.mapper.UserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class SearchTest {
	
	@Inject
	private SNSMapper mapper;
	
	@Inject
	private UserMapper usermapper;
	
	@Test
	public void testGetArticle(){
		List<UserDTO> userlist= usermapper.searchUserInSNS("%hey%");
		
		for (UserDTO user : userlist) {
			user.getUserLocAndCat().setCtgrNames();
			log.info(user);
		}
	}
	
	@Test
	public void test() {
		log.info("hi");
	     SNSArticleDTO_sjh s =   mapper.getArticleByArticleId(22);
	     
	     log.info(s);
	}
	
}
