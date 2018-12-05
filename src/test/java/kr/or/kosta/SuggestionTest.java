package kr.or.kosta;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.mapper.SuggestionMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class SuggestionTest {

    @Inject
    private SuggestionMapper sm;

    @Test
    public void test() throws Exception {

        Criteria cri = new Criteria(1, 5, 10);
        log.info(cri);
        log.info(sm.getSuggestionListWithPaging(cri));
    }

}
