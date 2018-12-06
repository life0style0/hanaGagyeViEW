package kr.or.kosta.salmon.service;

import java.util.List;

import kr.or.kosta.salmon.common.Criteria;
import kr.or.kosta.salmon.domain.SuggestionDTO;

/**
 * SuggestionService
 */
public interface SuggestionService {

    public List<SuggestionDTO> getSuggestionListWithPaging(Criteria criteria) throws Exception;

    public List<SuggestionDTO> getSuggestionListsByLikes(Criteria criteria) throws Exception;

    public int getTotalSuggestion(Criteria criteria) throws Exception;

    public SuggestionDTO getSuggestion(String suggestionId) throws Exception;
}