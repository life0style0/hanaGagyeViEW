package kr.or.kosta.salmon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.domain.PsnsDTO;
import kr.or.kosta.salmon.mapper.AccountBookMapper;

/**
 * AccountBookServiceImpl
 */
@Service
public class AccountBookServiceImpl implements AccountBookService {

    @Inject
    private AccountBookMapper abm;

    @Override
    public List<AccountBookDTO> getAccountBooks(String userId, String year, String year2, String month, String month2)
            throws Exception {
        return abm.getAccountBooks(userId, year, year2, month, month2);
    }

    @Override
    public AccountBookDTO getAccountBookByArticleId(String userId, int articleId) throws Exception {
        return abm.getAccountBookByArticleId(userId, articleId);
    }

    @Override
    public Map<String, List<AccountBookDTO>> getAccountBooksByYear(String userId, String year, String year2,
            String month1, String month2, int psnStartDay) throws Exception {
        List<AccountBookDTO> abds = abm.getAccountBooksByYear(userId, year, year2, month1, month2);
        Map<String, List<AccountBookDTO>> result = new HashMap<String, List<AccountBookDTO>>();
        String month = null;
        List<AccountBookDTO> lists = null;
        String yearT = null;
        int monthT = 0;
        int dayT = 0;
        if (psnStartDay >= 16 && psnStartDay <= 31) {
            for (AccountBookDTO abd : abds) {
                yearT = abd.getArticleRegdate().substring(0, 4);
                monthT = Integer.parseInt(abd.getArticleRegdate().substring(6, 8)); // 2018년 01월 01일
                dayT = Integer.parseInt(abd.getArticleRegdate().substring(10, 12));
                if (yearT.equals(year)) {
                    month = "01";
                } else if (dayT < psnStartDay) {
                    month = abd.getArticleRegdate().substring(6, 8); // 2018년 01월 01일
                } else if (dayT >= psnStartDay) {
                    month = monthT <= 8 ? "0" + (monthT + 1) : (monthT + 1) + "";
                }
                if (result.containsKey(month)) {
                    result.get(month).add(abd);
                } else {
                    lists = new ArrayList<AccountBookDTO>();
                    lists.add(abd);
                    result.put(month, lists);
                }
            }
        } else if (psnStartDay >= 1 && psnStartDay <= 15) {
            for (AccountBookDTO abd : abds) {
                yearT = abd.getArticleRegdate().substring(0, 4);
                monthT = Integer.parseInt(abd.getArticleRegdate().substring(6, 8)); // 2018년 12월 05일
                dayT = Integer.parseInt(abd.getArticleRegdate().substring(10, 12));
                if (yearT.equals(year2)) {
                    month = "12";
                } else if (dayT < psnStartDay) {
                    month = monthT <= 10 ? "0" + (monthT - 1) : (monthT - 1) + "";
                } else if (dayT >= psnStartDay) {
                    month = abd.getArticleRegdate().substring(6, 8); // 2018년 01월 01일
                }
                if (result.containsKey(month)) {
                    result.get(month).add(abd);
                } else {
                    lists = new ArrayList<AccountBookDTO>();
                    lists.add(abd);
                    result.put(month, lists);
                }
            }
        }
        return result;
    }

    @Override
    public List<String> getYearMonth(String userId) throws Exception {
        return abm.getYearMonth(userId);
    }

    @Override
    public int getPsnMonthStart(String userId) throws Exception {
        return abm.getPsnMonthStart(userId);
    }

    @Override
    public PsnsDTO getPsns(String userId) throws Exception {
        return abm.getPsns(userId);
    }

    @Override
    public Boolean editPsns(PsnsDTO psnsDTO, String userId) throws Exception {
        return abm.editPsns(psnsDTO, userId);
    }

    @Override
    public Boolean shareArticle(String articleId, String userId) throws Exception {
        return abm.shareArticle(articleId, userId);
    }

    @Override
    public Boolean shareCancelArticle(String articleId, String userId) throws Exception {
        return abm.shareCancelArticle(articleId, userId);
    }

}