package kr.or.kosta.salmon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.mapper.AccountBookMapper;

/**
 * AccountBookServiceImpl
 */
@Service
public class AccountBookServiceImpl implements AccountBookService {

    @Inject
    private AccountBookMapper abm;

    @Override
    public List<AccountBookDTO> getAccountBooks(String userId, String year, String month) throws Exception {
        return abm.getAccountBooks(userId, year, month);
    }

    @Override
    public AccountBookDTO getAccountBookByArticleId(String userId, int articleId) throws Exception {
        return abm.getAccountBookByArticleId(userId, articleId);
    }

    @Override
    public Map<String, List<AccountBookDTO>> getAccountBooksByYear(String userId, String year) throws Exception {
        List<AccountBookDTO> abds = abm.getAccountBooksByYear(userId, year);
        Map<String, List<AccountBookDTO>> result = new HashMap<String, List<AccountBookDTO>>();
        String month = null;
        for (AccountBookDTO abd : abds) {
            month = abd.getArticleRegdate().substring(6, 8); //2018년 01월 01일
            if (result.containsKey(month)) {
                result.get(month).add(abd);
            } else {
                List<AccountBookDTO> lists = new ArrayList<AccountBookDTO>();
                lists.add(abd);
                result.put(month, lists);
            }
        }
        return result;
    }

    @Override
    public List<String> getYearMonth(String userId) throws Exception {
        return abm.getYearMonth(userId);
    }

}