package kr.or.kosta.salmon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.domain.SuggestionDTO;

/**
 * SuggestionMapper
 */
public interface SuggestionMapper {

    public List<SuggestionDTO> getSuggestionListByPaging(Criteria criteria) throws Exception;

    public List<SuggestionDTO> getSuggestionListsByLikes(Criteria criteria) throws Exception;

    public List<SuggestionDTO> getSuggestionListsByRecommend(Criteria criteria) throws Exception;

    public int getTotalSuggestion(Criteria criteria) throws Exception;
    
    public int getTotalSuggestionByRecommend(Criteria criteria) throws Exception;

    public SuggestionDTO getSuggestion(@Param("article_id") String suggestionId) throws Exception;

    public int checkLike(@Param("userId") String userId, @Param("articleId") String articleId) throws Exception;
}