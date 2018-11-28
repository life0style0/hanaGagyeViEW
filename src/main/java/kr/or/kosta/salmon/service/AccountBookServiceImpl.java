package kr.or.kosta.salmon.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.mapper.AccountBookMapper;

/**
 * AccountBookServiceImpl
 */
public class AccountBookServiceImpl implements AccountBookService {

    @Inject
    private AccountBookMapper abm;

    @Override
    public List<AccountBookDTO> getAccountBooks(String userId, int year, int month) {
        return abm.getAccountBooks(userId, year, month);
    }

}