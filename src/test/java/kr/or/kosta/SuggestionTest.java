package kr.or.kosta;

import java.util.ArrayList;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.domain.NewSuggestionDTO;
import kr.or.kosta.salmon.domain.SuggestionProcDTO;
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
        log.info(sm.getSuggestionListByPaging(cri));
    }

    @Test
    public void test2() throws Exception {
        NewSuggestionDTO newSuggestionDTO = new NewSuggestionDTO();
        newSuggestionDTO.setUserId("jiwon");
        newSuggestionDTO.setArticleTitle("hi");
        newSuggestionDTO.setArticleContent("hi2");
        newSuggestionDTO.setCtgry1(1);
        newSuggestionDTO.setCtgry2(2);
        newSuggestionDTO.setCtgry3(3);
        newSuggestionDTO.setHashtags(new ArrayList<String>());
        newSuggestionDTO.setAmount("1");
        sm.insertArticle(newSuggestionDTO);
        log.info(newSuggestionDTO);
    }

    @Test
    public void test3() throws Exception {
        Criteria criteria = new Criteria();
        criteria.setArticleProposalStatus("R");
        criteria.setMaxArticleNum(10);
        criteria.setMaxPageNum(5);
        criteria.setPageNum(1);
        criteria.setUserId("heyrim6");

        SuggestionProcDTO a = (new SuggestionProcDTO()).build(criteria);
        sm.getSuggestionListsByRecommend2(a);
        sm.getTotalSuggestionByRecommend2(a);
        log.info(a.getResultNum());
    }
}
