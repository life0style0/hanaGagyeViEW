package kr.or.kosta.salmon.domain;

import java.util.List;

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
    private List<String> hashtags;
    private String amount; // 개인화 점수 증가 치
    private int result;
}