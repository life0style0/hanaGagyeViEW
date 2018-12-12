package kr.or.kosta;

import static org.junit.Assert.assertNotNull;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.service.GroupService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 소모임 게시물 등록 테스트
 */

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class GroupServiceTests {

	@Setter(onMethod_= {@Autowired })
	private GroupService service;

	
	//GroupService 객체가 주입되었는지 확인
	//@Test
	public void testExist() {
		log.info(service);
		log.info(service.getClass().getName());
		assertNotNull(service);
		log.info("들어와?");
	}
	
	
	//	!!!!!!! ==== 소모임 등록 테스트==== !!!!!!!
//	@Test
	public void testCreateGroup() {
		GroupDTO_lhr group = new GroupDTO_lhr();
		group.setGroup_title("소모임제목1 서비스 테스트 ");
		group.setGroup_description("소모임 내용1 서비스 테스트");
		group.setGroup_regdate("2018/12/05");
		group.setGroup_people_max(200);
		group.setUser_id("1234");
		group.setCtgry_1(1);
		group.setCtgry_2(2);
		group.setCtgry_3(3);
		

		log.info(service);
		log.info(group);
		log.info("=====================소모임등록 진행되고 있나요~==============");
		service.groupRegist(group);
		log.info("===== 생성된 게시물의 번호 ===== : " + group.getGroup_id());
		
		log.info("소모임등록 완료");
	}
	
//2018.12.07
//소모임 ID로 소모임 정보 가져오기 
//	@Test
	public void testGet() {
		log.info(service.get("22"));
	}
	
	@Test
	public void testImages() {
		service.getGroupArticles("1");
	}
}