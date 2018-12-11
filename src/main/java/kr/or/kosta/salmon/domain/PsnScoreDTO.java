package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * PsnScoreDTO
 */
@Data
public class PsnScoreDTO {
    private String userId;
    private String articleId;
    private String amount;
    private int result;
}