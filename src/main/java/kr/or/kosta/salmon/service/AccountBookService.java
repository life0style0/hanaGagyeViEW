package kr.or.kosta.salmon.service;

import java.util.List;

import kr.or.kosta.salmon.domain.AccountBookDTO;

/**
 * AccountBookService
 */
public interface AccountBookService {

    public List<AccountBookDTO> getAccountBooks(String userId, int year, int month);
    
}