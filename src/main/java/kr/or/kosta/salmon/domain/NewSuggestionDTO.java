package kr.or.kosta.salmon.domain;

import lombok.Data;

/**
 * NewSuggestionDTO
 */
@Data
public class NewSuggestionDTO {
    private String articleTitle;
    private String articleContent;
    private String userId;
    private int ctgry1;
    private int ctgry2;
    private int ctgry3;
}