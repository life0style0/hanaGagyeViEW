package kr.or.kosta.salmon.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SNSArticleDTO_sjh {
	private int article_id;
	private int article_ctgry_id;
	private String article_ctgry_description;
	private String article_scope;
	private String article_regdate;
	private String article_editdate;
	private String article_payment_type;
	private int article_payment_fee;
	private String article_title;
	private String article_content;
	private String article_proposal_status;
	private int group_id;
	private String group_title;
	private String user_id;
	private String user_nickname;
	private String article_deleted;
	private int ctrgy_id;
	private String ctgry_name;
    private List<String> imagePaths;
    private List<String> hashtags;

	private List<LikeDTO> likes; //받은 좋아요  
	private List<ScrapDTO> scraps; //스크랩  
	private List<CommentDTO> comments; //댓글  
}