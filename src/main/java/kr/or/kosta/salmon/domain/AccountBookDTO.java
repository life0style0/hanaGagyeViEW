package kr.or.kosta.salmon.domain;

import java.util.List;

import lombok.Data;

/**
 * AccountBookDTO
 */
@Data
public class AccountBookDTO {
    private int articleId;
    private String articleScope;
    private String articleRegdate;
    private String articlePaymentType;
    private int articlePaymentFee;
    private String articleTitle;
    private String articleContent;
    private String articleCtgryType;
    private int articleLikeNum;
    private int articleCommentNum;
    private List<String> ctgryNames;
    private List<String> imagePaths;
    private List<String> hashtags;
}