package kr.or.kosta;
/**
 * users 테이블 더미데이터 만들기 (비밀번호 인코딩 처리됨) 
 * testInsertMember() 사용
 * @author 송주현
 */

import java.util.ArrayList;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.FollowerDTO;
import kr.or.kosta.salmon.domain.SNSArticleDTO_sjh;
import kr.or.kosta.salmon.domain.SNSUserPageDTO;
import kr.or.kosta.salmon.domain.SNSUserPageWithoutAtriclesDTO;
import kr.or.kosta.salmon.mapper.SNSMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class ArticleTest {
	
	@Inject
	private SNSMapper mapper;
	
//	@Test
	public void testGetArticle(){
		ArrayList<SNSArticleDTO_sjh> list =mapper.getSNSArticles("newID6");
		for (SNSArticleDTO_sjh article : list) {
			log.info(article);
			log.info(article.getLikes());
			log.info(article.getComments());
			log.info(article.getScraps());
			log.info(article.getHashtags());
		}
	}
	
//	@Test
	public void testSNS() {
		FollowerDTO follower= new FollowerDTO();
		follower.setUser_id("heyrim18");
		follower.setFollower_user_id("heyrim19");
		log.info(mapper.checkFollowing(follower) >0);
	}
	
	@Test
	public void testSNSPage() {
	//	SNSUserPageDTO page = new SNSUserPageDTO();
	//	page= mapper.getSNSUserPageInfo("heyrim19","heyrim16");
		/*log.info(page.getUser_id());
		log.info(page.getUser());
		log.info(page.getMyfollowings().toString());
		log.info(page.getMyArticles());
		log.info(page.getMyPsnsInfo());
		log.info(page.getMyfollowings());
		log.info(page.getMyGroups());*/
		
		SNSUserPageDTO param= new SNSUserPageDTO();
		param.setUser_id("heyrim15");
		
	//	SNSUserPageDTO page2= mapper.getSNSUserPageInfo("heyrim15");
		SNSUserPageWithoutAtriclesDTO page4= mapper.getSNSUserPageInfoWithoutArticles("heyrim15");
	//	SNSUserPageDTO page3= mapper.getSNSUserPageInfo(param);
		ArrayList<SNSArticleDTO_sjh> list1= mapper.getSNSArticleByWriter("heyrim7", "heyrim15");
		ArrayList<SNSArticleDTO_sjh> list2= mapper.getArticleByLikeUser("heyrim7", "heyrim15");
		
	}
	
	
}
