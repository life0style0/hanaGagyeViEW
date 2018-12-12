package kr.or.kosta.salmon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.domain.NewSuggestionDTO;
import kr.or.kosta.salmon.domain.PsnsDTO;
import kr.or.kosta.salmon.domain.SuggestionDTO;
import kr.or.kosta.salmon.domain.SuggestionProcDTO;
import kr.or.kosta.salmon.mapper.SuggestionMapper;

/**
 * SuggestionServiceImpl
 */
@Service
public class SuggestionServiceImpl implements SuggestionService {

    @Inject
    private SuggestionMapper sm;

    @Override
    public List<SuggestionDTO> getSuggestionListByPaging(Criteria criteria) throws Exception {
        return sm.getSuggestionListByPaging(criteria);
    }

    @Override
    public List<SuggestionDTO> getSuggestionListsByLikes(Criteria criteria) throws Exception {
        return sm.getSuggestionListsByLikes(criteria);
    }

    @Override
    public List<SuggestionDTO> getSuggestionListsByRecommend(Criteria criteria) throws Exception {
        return sm.getSuggestionListsByRecommend(criteria);
    }

    @Override
    public List<SuggestionDTO> getSuggestionListsByRecommend2(Criteria criteria) throws Exception {
        SuggestionProcDTO suggestionProcDTO = (new SuggestionProcDTO()).build(criteria);
        sm.getSuggestionListsByRecommend2(suggestionProcDTO);
        return suggestionProcDTO.getResultset();
    }

    @Override
    public PsnsDTO getPsnsWithSuggestion(String userId) throws Exception {
        return sm.getPsnsWithSuggestion(userId);
    }

    @Override
    public int getTotalSuggestion(Criteria criteria) throws Exception {
        return sm.getTotalSuggestion(criteria);
    }

    @Override
    public int getTotalSuggestionByRecommend(Criteria criteria) throws Exception {
        SuggestionProcDTO suggestionProcDTO = (new SuggestionProcDTO()).build(criteria);
        sm.getSuggestionListsByRecommend2(suggestionProcDTO);
        return suggestionProcDTO.getResultNum();
    }

    @Override
    public int getTotalSuggestionByRecommend2(Criteria criteria) throws Exception {
        return sm.getTotalSuggestionByRecommend(criteria);
    }

    @Override
    public SuggestionDTO getSuggestion(String suggestionId) throws Exception {
        return sm.getSuggestion(suggestionId);
    }

    @Override
    public boolean checkLike(String userId, String articleId) throws Exception {
        return sm.checkLike(userId, articleId) > 0 ? true : false;
    }

    @Override
    public boolean checkFollow(String userId, String followerId) throws Exception {
        return sm.checkFollow(userId, followerId) > 0 ? true : false;
    }

    @Override
    public String getLikeNum(String articleId) throws Exception {
        return sm.getLikeNum(articleId);
    }

    @Override
    public boolean insertArticle(NewSuggestionDTO newSuggestionDTO) throws Exception {
        sm.insertArticle(newSuggestionDTO);
        return newSuggestionDTO.getResult() > 0 ? true : false;
    }
}