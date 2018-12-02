package kr.or.kosta.salmon.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.salmon.domain.AccountBookDTO;

/**
 * AccountBookService
 */
public interface AccountBookService {

    public List<AccountBookDTO> getAccountBooks(String userId, String year, String month) throws Exception;
    
    public AccountBookDTO getAccountBookByArticleId(String userId, int articleId) throws Exception;

    public Map<String, List<AccountBookDTO>> getAccountBooksByYear(String userId, String year) throws Exception;

    public List<String> getYearMonth(String userId) throws Exception;
}