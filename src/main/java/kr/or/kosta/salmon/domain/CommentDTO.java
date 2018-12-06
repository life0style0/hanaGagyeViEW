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
public class CommentDTO {
	private int comment_id;
	private String comment_content;
	private String comment_regdate;
	private String comment_editDate;
	private String user_id;
	private String user_nickname;
	private String user_image;
	private int article_id;
}
