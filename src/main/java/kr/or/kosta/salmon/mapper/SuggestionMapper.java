package kr.or.kosta.salmon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.domain.SuggestionDTO;

/**
 * SuggestionMapper
 */
public interface SuggestionMapper {

    public List<SuggestionDTO> getSuggestionListWithPaging(Criteria criteria) throws Exception;

    public List<SuggestionDTO> getSuggestionListsByLikes(Criteria criteria) throws Exception;

    public int getTotalSuggestion(Criteria criteria) throws Exception;

    public SuggestionDTO getSuggestion(@Param("article_id") String suggestionId) throws Exception;
}