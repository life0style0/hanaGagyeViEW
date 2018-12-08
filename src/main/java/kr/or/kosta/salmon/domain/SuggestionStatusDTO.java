package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * SuggestionStatusDTO
 */
@Data
public class SuggestionStatusDTO {
    private String articleProposalStatus;
    private Long articleProposalNum;
    private Long articleLikeNum;
}