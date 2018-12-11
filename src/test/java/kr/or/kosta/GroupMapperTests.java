package kr.or.kosta;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.GroupDTO_lhr;
import kr.or.kosta.salmon.mapper.GroupMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 소모임 Mapper Test
 * 매퍼는 다 잘 들어온다!!!!!!!! 예~~~~~~~~!
 */

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class GroupMapperTests {

	@Setter(onMethod_= @Autowired)
	private GroupMapper mapper;

	
	//@Test
	public void testInsert() {
//		GroupDTO_lhr group = new GroupDTO_lhr();
//		group.setGroup_title("새로 만든 소모임");
//		group.setGroup_description("새로 만든 소모임 설명");
//		group.setGroup_id("1234");
//		group.setGroup_regdate("2018/12/05");
//		group.setUser_id("1234");
//		group.setCtgry_1("1");
//		group.setCtgry_2("2");
//		group.setCtgry_3("3");
//		group.setGroup_people_max("200");
//		
//		mapper.createGroup(group);
//		
//		log.info(group);
//		log.info("등록 되나요!!! ~ ");
	}
	//등록 성공 >_____< !!!!!
	
	
	
	/**
	 * BoardMapperTest : CreateSelectGroup
	 * 등록 성공!!!!!!!!!!!!!!!! 
	 * 반드시 넣어 주어야 할 내용
	 * : 소모임 제목 / 설명 / 방장 / 카테고리 / 최대인원
	 */
//	@Test
	public void testInsertSelectKey() {
		
		GroupDTO_lhr group = new GroupDTO_lhr();
		group.setGroup_title("새로 만드는 소모임 selectKey");
		group.setGroup_description("새로 만드는 소모임 내용 selectKey");
		group.setUser_id("1234"); 
		group.setCtgry_1(1);
		group.setCtgry_2(2);
		group.setCtgry_3(3);
		group.setGroup_people_max(200);
		log.info("등록 시작한다! BySelectKey!!!!");
		log.info("Create전에 그룹 내용 확인을 위한 logger :  "+group);
		mapper.createSelectGroup(group);
		log.info("Create 이후 내용 확인 logger"+group);
	}

	/**
	 * 전체 리스트 인출
	 */
	//@Test
	public void testGetList() {
		mapper.getList().forEach(groups -> log.info(groups));
	}
	
	@Test
	public void testread() {
	//	mapper.read("9");
		mapper.getAllCategories();
	}
	
}