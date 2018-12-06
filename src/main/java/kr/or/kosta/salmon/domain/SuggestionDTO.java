package kr.or.kosta.salmon.domain;

import java.util.List;

import lombok.Data;

/**
 * SuggestionDTO
 */
@Data
public class SuggestionDTO {
	private int articleId;
	private String articleRegdate;
	private String articleEnddate;
	private String articleEditdate;
	private String articlePaymentType;
	private int articlePaymentFee;
	private String articleTitle;
	private String articleContent;
	private String articleProposalStatus;
	private String userId;
    private int likeCnt;
    private int commentCnt;
    private int scrapCnt;
    private List<String> imagePaths;
    private List<String> ctgryNames;
    private List<String> hashtags;
    private List<CommentDTO> comments;
}