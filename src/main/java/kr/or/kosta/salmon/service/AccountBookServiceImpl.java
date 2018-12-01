package kr.or.kosta.salmon.service;

import java.util.List;

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
    public List<AccountBookDTO> getAccountBooks(String userId, String year, String month) throws Exception{
        return abm.getAccountBooks(userId, year, month);
    }

    @Override
    public AccountBookDTO getAccountBookByArticleId(String userId, int articleId) throws Exception {
        return abm.getAccountBookByArticleId(userId, articleId);
    }

}