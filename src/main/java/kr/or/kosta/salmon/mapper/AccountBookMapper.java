package kr.or.kosta.salmon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.AccountBookDTO;

/**
 * AccountBookMapper
 */
public interface AccountBookMapper {

    public List<AccountBookDTO> getAccountBooks(@Param("userId") String userId, @Param("year") String year,
            @Param("month") String month) throws Exception;

    public AccountBookDTO getAccountBookByArticleId(@Param("userId") String userId, @Param("articleId") int articleId)
            throws Exception;
}