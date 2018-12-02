package kr.or.kosta.salmon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosta.salmon.domain.AccountBookDTO;

/**
 * AccountBookMapper
 */
public interface AccountBookMapper {

        public List<AccountBookDTO> getAccountBooks(@Param("userId") String userId, @Param("year") String year,
                        @Param("year2") String year2, @Param("month") String month, @Param("month2") String month2)
                        throws Exception;

        public AccountBookDTO getAccountBookByArticleId(@Param("userId") String userId,
                        @Param("articleId") int articleId) throws Exception;

        public List<AccountBookDTO> getAccountBooksByYear(@Param("userId") String userId, @Param("year") String year,
        @Param("year2") String year2, @Param("month") String month, @Param("month2") String month2)
                        throws Exception;

        public List<String> getYearMonth(@Param("userId") String userId) throws Exception;

        public int getPsnMonthStart(@Param("userId") String userId) throws Exception;
}