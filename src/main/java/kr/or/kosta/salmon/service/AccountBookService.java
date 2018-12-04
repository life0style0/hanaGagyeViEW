package kr.or.kosta.salmon.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.domain.PsnsDTO;

/**
 * AccountBookService
 */
public interface AccountBookService {

    public List<AccountBookDTO> getAccountBooks(String userId, String year, String year2, String month, String month2)
            throws Exception;

    public AccountBookDTO getAccountBookByArticleId(String userId, int articleId) throws Exception;

    public Map<String, List<AccountBookDTO>> getAccountBooksByYear(String userId, String year, String year2, String month, String month2,int psnStartDay) throws Exception;

    public List<String> getYearMonth(String userId) throws Exception;

    public int getPsnMonthStart(String userId) throws Exception;

    public PsnsDTO getPsns(String userId) throws Exception;

    public Boolean editPsns(PsnsDTO psnsDTO, String userId) throws Exception;

    public Boolean shareArticle(String articleId, String userId) throws Exception;

    public Boolean shareCancelArticle(String articleId, String userId) throws Exception;
}