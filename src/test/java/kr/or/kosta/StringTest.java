package kr.or.kosta;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.mapper.GroupMapper;
import lombok.extern.log4j.Log4j;

/**
 * StringTest
 */
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class StringTest {
	@Inject
	private GroupMapper gmapper;

 //   @Test
    public void test() {
        String cal = "2018-12-12";
        log.info(cal.substring(5, 7));
    }
    @Test
	public void testread() {
		gmapper.read("9");
	}
}