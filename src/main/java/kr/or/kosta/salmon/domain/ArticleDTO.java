package kr.or.kosta.salmon.domain;

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
public class ArticleDTO {
	private int article_id;
	private int article_ctgry_id;
	private String article_scope;
	private String article_regdate;
	private String article_editdate;
	private String article_payment_type;
	private int article_payment_fee;
	private String article_title;
	private String article_content;
	private String article_proposal_status;
	private int group_id;
	private String user_id;
	private String article_deleted;
	private int article_like_num;
	private int article_report_num;
	private int article_comment_num;
}
